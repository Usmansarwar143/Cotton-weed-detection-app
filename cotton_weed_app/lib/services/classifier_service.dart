import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:image/image.dart' as img;
import 'package:tflite_flutter/tflite_flutter.dart';

class ClassifierService {
  Interpreter? _interpreter;
  List<String>? _labels;
  bool _isLoaded = false;

  Future<void> loadModel() async {
    if (_isLoaded) return;
    try {
      _interpreter = await Interpreter.fromAsset('assets/model.tflite');
      _labels = await _loadLabels('assets/labels.txt');
      _isLoaded = true;
      debugPrint('Model loaded successfully');
    } catch (e) {
      debugPrint('Failed to load model: $e');
    }
  }

  Future<List<String>> _loadLabels(String path) async {
    final fileData = await rootBundle.loadString(path);
    return fileData.split('\n').where((item) => item.isNotEmpty).toList();
  }

  Future<Map<String, dynamic>> classify(File imageFile) async {
    if (!_isLoaded) await loadModel();

    if (_interpreter == null || _labels == null) {
      throw Exception('Model or labels not loaded');
    }

    // Load and resize image
    final imageData = await imageFile.readAsBytes();
    final image = img.decodeImage(imageData);
    if (image == null) throw Exception('Failed to decode image');

    // Get input shape
    final inputTensor = _interpreter!.getInputTensor(0);
    final inputShape = inputTensor.shape; // [1, 224, 224, 3] usually
    final inputHeight = inputShape[1];
    final inputWidth = inputShape[2];

    final resizedImage = img.copyResize(
      image,
      width: inputWidth,
      height: inputHeight,
    );

    // Prepare input buffer
    final inputType = inputTensor.type;
    Object inputBuffer;

    if (inputType == TensorType.float32) {
      inputBuffer = _imageToFloat32List(resizedImage, inputHeight, inputWidth);
    } else {
      inputBuffer = _imageToUint8List(resizedImage, inputHeight, inputWidth);
    }

    // Prepare output buffer
    final outputTensor = _interpreter!.getOutputTensor(0);
    final outputShape = outputTensor.shape;
    final outputType = outputTensor.type;

    // Output is usually [1, num_classes]
    // Initialize output buffer with correct shape manually
    // We assume [1, N] for classification
    int batchSize = outputShape[0];
    int numClasses = outputShape[1];

    // Using List.generate to create nested lists [batchSize][numClasses]
    List<List<dynamic>> outputBuffer;
    if (outputType == TensorType.float32) {
      outputBuffer = List.generate(
        batchSize,
        (_) => List.filled(numClasses, 0.0),
      );
    } else {
      outputBuffer = List.generate(
        batchSize,
        (_) => List.filled(numClasses, 0),
      );
    }

    // Run inference
    _interpreter!.run(inputBuffer, outputBuffer);

    // Process output
    // The outputBuffer is updated in place
    // outputBuffer[0] contains the probabilities
    final probabilities = outputBuffer[0];

    // Find max probability
    double maxScore = -1.0;
    int maxIndex = -1;

    for (int i = 0; i < probabilities.length; i++) {
      double score = (probabilities[i] as num).toDouble();

      // Dequantize if needed
      if (outputType == TensorType.uint8) {
        final params = outputTensor.params;
        score = params.scale * (score - params.zeroPoint);
      }

      if (score > maxScore) {
        maxScore = score;
        maxIndex = i;
      }
    }

    String label = "Unknown";
    if (maxIndex >= 0 && maxIndex < _labels!.length) {
      label = _labels![maxIndex];
    }

    return {
      'name': label,
      'confidence': maxScore * 100, // percentage
    };
  }

  // Float32 normalization [0, 1]
  List<List<List<List<double>>>> _imageToFloat32List(
    img.Image image,
    int height,
    int width,
  ) {
    var convertedBytes = List.generate(
      1,
      (i) => List.generate(
        height,
        (j) => List.generate(width, (k) => List.generate(3, (l) => 0.0)),
      ),
    );

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final pixel = image.getPixel(j, i);
        // Normalize 0-255 to 0.0-1.0
        convertedBytes[0][i][j][0] = pixel.r / 255.0;
        convertedBytes[0][i][j][1] = pixel.g / 255.0;
        convertedBytes[0][i][j][2] = pixel.b / 255.0;
      }
    }
    return convertedBytes;
  }

  // Uint8 no normalization
  List<List<List<List<int>>>> _imageToUint8List(
    img.Image image,
    int height,
    int width,
  ) {
    var convertedBytes = List.generate(
      1,
      (i) => List.generate(
        height,
        (j) => List.generate(width, (k) => List.generate(3, (l) => 0)),
      ),
    );

    for (var i = 0; i < height; i++) {
      for (var j = 0; j < width; j++) {
        final pixel = image.getPixel(j, i);
        convertedBytes[0][i][j][0] = pixel.r.toInt();
        convertedBytes[0][i][j][1] = pixel.g.toInt();
        convertedBytes[0][i][j][2] = pixel.b.toInt();
      }
    }
    return convertedBytes;
  }

  void dispose() {
    _interpreter?.close();
    _isLoaded = false;
  }
}
