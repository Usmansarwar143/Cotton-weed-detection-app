import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:animate_do/animate_do.dart';
import '../l10n/app_localizations.dart';

import '../theme.dart';
import '../services/classifier_service.dart';

class DetectionScreen extends StatefulWidget {
  const DetectionScreen({super.key});

  @override
  State<DetectionScreen> createState() => _DetectionScreenState();
}

class _DetectionScreenState extends State<DetectionScreen> {
  File? _image;
  bool _isAnalyzing = false;
  Map<String, dynamic>? _result;
  final ImagePicker _picker = ImagePicker();
  final ClassifierService _classifier = ClassifierService();

  @override
  void initState() {
    super.initState();
    _classifier.loadModel();
  }

  @override
  void dispose() {
    _classifier.dispose();
    super.dispose();
  }

  Future<void> _pickImage(BuildContext context, ImageSource source) async {
    final l10n = AppLocalizations.of(context)!;
    final XFile? pickedFile = await _picker.pickImage(
      source: source,
      maxWidth: 1000,
      maxHeight: 1000,
      imageQuality: 85,
    );

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
        _isAnalyzing = true;
        _result = null;
      });

      try {
        final results = await _classifier.classify(_image!);

        if (!mounted) return;

        setState(() {
          _isAnalyzing = false;
          final name = results['name'];
          final confidence = results['confidence'];

          _result = {
            'name': name,
            'confidence': double.parse(confidence.toStringAsFixed(1)),
            'recommendation': _getRecommendation(name, l10n),
          };
        });
      } catch (e) {
        debugPrint(e.toString());
        if (!context.mounted) return;

        setState(() {
          _isAnalyzing = false;
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error analyzing image: $e')));
      }
    }
  }

  String _getRecommendation(String tag, AppLocalizations l10n) {
    // Normalize tag to lower case for comparison
    final lowerTag = tag.toLowerCase();

    // Map tags to recommendations
    // Note: Adjust these keys to match your actual model class names
    if (lowerTag.contains('black') && lowerTag.contains('pigweed')) {
      return l10n.blackPigweedRec;
    } else if (lowerTag.contains('nutgrass')) {
      return l10n.nutgrassRec;
    } else if (lowerTag.contains('cotton')) {
      return l10n.cottonRec;
    } else if (lowerTag.contains('horse') || lowerTag.contains('purslane')) {
      return l10n.horsePurslaneRec; // Kept as fallback/extra
    } else if (lowerTag.contains('weed')) {
      return "Weed detected. Monitor spread and apply appropriate control measures.";
    }

    return "No specific recommendation available for this detection.";
  }

  void _reset() {
    setState(() {
      _image = null;
      _result = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  _buildImageArea(context),
                  const SizedBox(height: 24),
                  if (_result == null && !_isAnalyzing)
                    _buildActionButtons(context),
                  if (_isAnalyzing) _buildAnalyzingState(context),
                  if (_result != null) _buildResultCard(context),
                  if (_result != null) ...[
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: _reset,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.lightGreen,
                        ),
                        child: Text(l10n.detectAnother),
                      ),
                    ),
                  ],
                  const SizedBox(height: 24),
                  if (_result == null && !_isAnalyzing) _buildTipBox(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      color: AppTheme.cottonGreen,
      padding: const EdgeInsets.only(top: 60, bottom: 30, left: 16, right: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 28,
                ),
                style: IconButton.styleFrom(hoverColor: Colors.white10),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.appTitle,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 56, right: 56, top: 4),
            child: Text(
              l10n.captureOrUpload,
              style: const TextStyle(color: AppTheme.warmAccent, fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageArea(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FadeIn(
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppTheme.lightGreen, width: 2),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 20,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          clipBehavior: Clip.antiAlias,
          child: _image != null
              ? Image.file(_image!, fit: BoxFit.cover)
              : Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(color: AppTheme.lightGreen, width: 2),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: const BoxDecoration(
                          color: AppTheme.warmAccent,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt_outlined,
                          size: 64,
                          color: AppTheme.cottonGreen,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        l10n.noImageSelected,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF374151),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          l10n.startDetectionDesc,
                          style: const TextStyle(
                            color: Color(0xFF6B7280),
                            fontSize: 13,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Row(
      children: [
        Expanded(
          child: _buildSquareButton(
            icon: Icons.camera_alt,
            label: l10n.captureImage,
            color: AppTheme.cottonGreen,
            onTap: () => _pickImage(context, ImageSource.camera),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildSquareButton(
            icon: Icons.upload_file,
            label: l10n.uploadImage,
            color: AppTheme.lightGreen,
            onTap: () => _pickImage(context, ImageSource.gallery),
          ),
        ),
      ],
    );
  }

  Widget _buildSquareButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: const EdgeInsets.symmetric(vertical: 24),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 4,
      ),
      child: Column(
        children: [
          Icon(icon, size: 32),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildAnalyzingState(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      children: [
        const CircularProgressIndicator(color: AppTheme.cottonGreen),
        const SizedBox(height: 16),
        Text(
          l10n.analyzingImage,
          style: const TextStyle(
            color: Color(0xFF374151),
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildResultCard(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FadeInUp(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppTheme.lightGreen, width: 2),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  Icons.analytics_outlined,
                  color: AppTheme.cottonGreen,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.detectionResult,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            _buildResultItem(
              l10n.detectedWeed,
              _result!['name'],
              const Color(0xFFFFF3E0),
              const Color(0xFFA1887F),
            ),
            const SizedBox(height: 16),
            _buildConfidenceItem(context, _result!['confidence']),
            const SizedBox(height: 16),
            _buildRecommendationItem(context, _result!['recommendation']),
          ],
        ),
      ),
    );
  }

  Widget _buildResultItem(
    String label,
    String value,
    Color bgColor,
    Color borderColor,
  ) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: borderColor, width: 4)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Color(0xFF4B5563), fontSize: 13),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1F2937),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildConfidenceItem(BuildContext context, double confidence) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF3E0),
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: AppTheme.cottonGreen, width: 4),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.confidenceScore,
            style: const TextStyle(color: Color(0xFF4B5563), fontSize: 13),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${confidence.toString()}%',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.cottonGreen,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.cottonGreen,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  l10n.highConfidence,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: confidence / 100,
              backgroundColor: Colors.white,
              color: AppTheme.cottonGreen,
              minHeight: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendationItem(BuildContext context, String text) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: const Border(
          left: BorderSide(color: AppTheme.lightGreen, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.recommendation,
            style: const TextStyle(color: Color(0xFF4B5563), fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Color(0xFF374151)),
          ),
        ],
      ),
    );
  }

  Widget _buildTipBox(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.warmAccent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.lightGreen),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.lightbulb_outline,
            color: AppTheme.cottonGreen,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              l10n.detectionTip,
              style: const TextStyle(color: Color(0xFF374151), fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
