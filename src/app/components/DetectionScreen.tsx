import { useState } from 'react';
import { Camera, Upload, ArrowLeft, AlertCircle, CheckCircle2 } from 'lucide-react';
import { motion } from 'motion/react';
import { Button } from './ui/button';
import { Card } from './ui/card';

interface DetectionScreenProps {
  onBack: () => void;
}

export function DetectionScreen({ onBack }: DetectionScreenProps) {
  const [hasImage, setHasImage] = useState(false);
  const [showResult, setShowResult] = useState(false);

  const handleCapture = () => {
    // Simulate image capture
    setHasImage(true);
    setTimeout(() => setShowResult(true), 1000);
  };

  const handleUpload = () => {
    // Simulate image upload
    setHasImage(true);
    setTimeout(() => setShowResult(true), 1000);
  };

  const resetDetection = () => {
    setHasImage(false);
    setShowResult(false);
  };

  return (
    <div className="min-h-screen bg-[#F9FAF7]">
      {/* Header - Cotton Green */}
      <div className="bg-[#2E7D32] text-[#F9FAF7] pt-12 pb-8 px-6">
        <div className="flex items-center mb-4">
          <Button
            onClick={onBack}
            variant="ghost"
            className="mr-3 text-[#F9FAF7] hover:bg-[#1B5E20] p-2 rounded-full"
          >
            <ArrowLeft className="w-6 h-6" />
          </Button>
          <h1 className="text-2xl">Weed Detection</h1>
        </div>
        <p className="text-[#FFF3E0] text-sm ml-14">
          Capture or upload a cotton crop image
        </p>
      </div>

      {/* Main Content */}
      <div className="px-6 py-8">
        {/* Image Preview Area */}
        <motion.div
          initial={{ scale: 0.9, opacity: 0 }}
          animate={{ scale: 1, opacity: 1 }}
          transition={{ duration: 0.4 }}
          className="mb-6"
        >
          <Card className="bg-white border-2 border-dashed border-[#66BB6A] rounded-2xl overflow-hidden shadow-lg">
            {!hasImage ? (
              <div className="aspect-square flex flex-col items-center justify-center p-8">
                <div className="bg-[#FFF3E0] p-6 rounded-full mb-4">
                  <Camera className="w-16 h-16 text-[#2E7D32]" strokeWidth={1.5} />
                </div>
                <p className="text-gray-700 text-center mb-2">No image selected</p>
                <p className="text-gray-500 text-sm text-center">
                  Capture or upload an image to start detection
                </p>
              </div>
            ) : (
              <div className="aspect-square bg-gradient-to-br from-[#FFF3E0] to-[#F9FAF7] flex items-center justify-center p-4">
                {/* Placeholder for uploaded/captured image */}
                <div className="w-full h-full bg-white rounded-xl shadow-inner flex items-center justify-center">
                  <div className="text-center">
                    <div className="bg-[#2E7D32] p-4 rounded-full inline-block mb-3">
                      <CheckCircle2 className="w-12 h-12 text-white" />
                    </div>
                    <p className="text-gray-700">Image loaded successfully</p>
                  </div>
                </div>
              </div>
            )}
          </Card>
        </motion.div>

        {/* Action Buttons */}
        {!showResult && (
          <motion.div
            initial={{ y: 20, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ delay: 0.2, duration: 0.4 }}
            className="grid grid-cols-2 gap-4 mb-6"
          >
            <Button
              onClick={handleCapture}
              className="bg-[#2E7D32] hover:bg-[#1B5E20] text-white rounded-xl py-6 flex flex-col items-center justify-center h-auto shadow-md"
            >
              <Camera className="w-8 h-8 mb-2" strokeWidth={1.5} />
              <span>Capture Image</span>
            </Button>
            <Button
              onClick={handleUpload}
              className="bg-[#66BB6A] hover:bg-[#4CAF50] text-white rounded-xl py-6 flex flex-col items-center justify-center h-auto shadow-md"
            >
              <Upload className="w-8 h-8 mb-2" strokeWidth={1.5} />
              <span>Upload Image</span>
            </Button>
          </motion.div>
        )}

        {/* Detection Result Card */}
        {showResult && (
          <motion.div
            initial={{ y: 50, opacity: 0 }}
            animate={{ y: 0, opacity: 1 }}
            transition={{ duration: 0.5 }}
          >
            <Card className="bg-white border-2 border-[#66BB6A] rounded-2xl p-6 shadow-xl mb-6">
              <div className="flex items-center mb-4">
                <AlertCircle className="w-6 h-6 text-[#2E7D32] mr-3" strokeWidth={1.5} />
                <h2 className="text-xl text-gray-800">Detection Result</h2>
              </div>

              <div className="space-y-4">
                {/* Weed Name */}
                <div className="bg-[#FFF3E0] border-l-4 border-[#A1887F] rounded-lg p-4">
                  <p className="text-sm text-gray-600 mb-1">Detected Weed</p>
                  <p className="text-2xl text-gray-800">Horse Purslane</p>
                </div>

                {/* Confidence Score */}
                <div className="bg-[#FFF3E0] border-l-4 border-[#2E7D32] rounded-lg p-4">
                  <p className="text-sm text-gray-600 mb-2">Confidence Score</p>
                  <div className="flex items-center justify-between mb-2">
                    <p className="text-3xl text-[#2E7D32]">94.7%</p>
                    <div className="bg-[#2E7D32] text-white px-3 py-1 rounded-full text-sm">
                      High Confidence
                    </div>
                  </div>
                  {/* Progress bar */}
                  <div className="w-full bg-gray-200 rounded-full h-2">
                    <motion.div
                      initial={{ width: 0 }}
                      animate={{ width: '94.7%' }}
                      transition={{ delay: 0.3, duration: 1 }}
                      className="bg-[#2E7D32] h-2 rounded-full"
                    />
                  </div>
                </div>

                {/* Additional Info */}
                <div className="bg-white border-l-4 border-[#66BB6A] rounded-lg p-4 shadow-sm">
                  <p className="text-sm text-gray-600 mb-1">Recommendation</p>
                  <p className="text-sm text-gray-700">
                    Horse Purslane detected. Consider manual removal or targeted herbicide application for effective control.
                  </p>
                </div>
              </div>
            </Card>

            {/* Try Again Button */}
            <Button
              onClick={resetDetection}
              className="w-full bg-[#66BB6A] hover:bg-[#4CAF50] text-white rounded-xl py-6 text-lg shadow-md"
            >
              Detect Another Image
            </Button>
          </motion.div>
        )}

        {/* Info Note */}
        {!showResult && (
          <motion.div
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            transition={{ delay: 0.4, duration: 0.4 }}
            className="bg-[#FFF3E0] border border-[#66BB6A] rounded-xl p-4"
          >
            <div className="flex items-start">
              <AlertCircle className="w-5 h-5 text-[#2E7D32] mr-3 mt-0.5 flex-shrink-0" strokeWidth={1.5} />
              <p className="text-sm text-gray-700">
                <strong>Tip:</strong> For best results, ensure the image is clear and focused on the weed area. Good lighting improves detection accuracy.
              </p>
            </div>
          </motion.div>
        )}
      </div>
    </div>
  );
}