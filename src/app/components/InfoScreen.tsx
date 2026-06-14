import { ArrowLeft, Database, Users, GraduationCap, Leaf, Target } from 'lucide-react';
import { motion } from 'motion/react';
import { Button } from './ui/button';
import { Card } from './ui/card';

interface InfoScreenProps {
  onBack: () => void;
}

export function InfoScreen({ onBack }: InfoScreenProps) {
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
          <h1 className="text-2xl">About Project</h1>
        </div>
        <p className="text-[#FFF3E0] text-sm ml-14">
          AI-based cotton weed detection system
        </p>
      </div>

      {/* Main Content */}
      <div className="px-6 py-8 pb-12">
        {/* Project Description */}
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.4 }}
        >
          <Card className="bg-white rounded-2xl p-6 shadow-lg mb-6 border-2 border-[#66BB6A]">
            <div className="flex items-center mb-4">
              <div className="bg-[#FFF3E0] p-3 rounded-xl mr-4">
                <Target className="w-6 h-6 text-[#2E7D32]" strokeWidth={1.5} />
              </div>
              <h2 className="text-xl text-gray-800">Project Overview</h2>
            </div>
            <p className="text-gray-700 leading-relaxed">
              This application uses advanced deep learning techniques to detect and identify weeds in cotton crops. 
              Our AI model helps farmers quickly identify problematic weeds, enabling timely intervention and 
              improving crop yield through precision agriculture.
            </p>
          </Card>
        </motion.div>

        {/* Dataset Information */}
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.1, duration: 0.4 }}
        >
          <Card className="bg-white rounded-2xl p-6 shadow-lg mb-6 border-2 border-[#66BB6A]">
            <div className="flex items-center mb-4">
              <div className="bg-[#FFF3E0] p-3 rounded-xl mr-4">
                <Database className="w-6 h-6 text-[#2E7D32]" strokeWidth={1.5} />
              </div>
              <h2 className="text-xl text-gray-800">Dataset Information</h2>
            </div>
            
            <div className="space-y-3">
              <div className="bg-[#FFF3E0] rounded-lg p-4">
                <p className="text-sm text-gray-600 mb-1">Dataset Source</p>
                <p className="text-lg text-[#2E7D32]">CottonWeeds Dataset (Kaggle)</p>
              </div>

              <div className="bg-[#FFF3E0] rounded-lg p-4">
                <p className="text-sm text-gray-600 mb-2">Target Weeds</p>
                <div className="flex flex-wrap gap-2">
                  <div className="bg-white border-2 border-[#2E7D32] px-4 py-2 rounded-full flex items-center">
                    <Leaf className="w-4 h-4 text-[#2E7D32] mr-2" strokeWidth={1.5} />
                    <span className="text-gray-800">Horse Purslane</span>
                  </div>
                  <div className="bg-white border-2 border-[#66BB6A] px-4 py-2 rounded-full flex items-center">
                    <Leaf className="w-4 h-4 text-[#66BB6A] mr-2" strokeWidth={1.5} />
                    <span className="text-gray-800">Purple Nutsedge</span>
                  </div>
                </div>
              </div>

              <div className="bg-[#FFF3E0] rounded-lg p-4">
                <p className="text-sm text-gray-600 mb-1">Technology</p>
                <p className="text-sm text-gray-700">
                  Deep Learning • Computer Vision • Image Classification
                </p>
              </div>
            </div>
          </Card>
        </motion.div>

        {/* Team Details */}
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.2, duration: 0.4 }}
        >
          <Card className="bg-white rounded-2xl p-6 shadow-lg border-2 border-[#66BB6A] mb-6">
            <div className="flex items-center mb-4">
              <div className="bg-[#FFF3E0] p-3 rounded-xl mr-4">
                <Users className="w-6 h-6 text-[#2E7D32]" strokeWidth={1.5} />
              </div>
              <h2 className="text-xl text-gray-800">Team Members</h2>
            </div>

            <div className="space-y-3">
              {/* Team Member 1 */}
              <div className="bg-[#FFF3E0] rounded-xl p-4 border border-[#66BB6A]">
                <div className="flex items-center">
                  <div className="bg-[#2E7D32] text-white w-12 h-12 rounded-full flex items-center justify-center text-xl mr-4">
                    S
                  </div>
                  <div>
                    <p className="text-lg text-gray-800">Sibgha Mursaleen</p>
                    <p className="text-sm text-gray-600">Project Developer</p>
                  </div>
                </div>
              </div>

              {/* Team Member 2 */}
              <div className="bg-[#FFF3E0] rounded-xl p-4 border border-[#66BB6A]">
                <div className="flex items-center">
                  <div className="bg-[#66BB6A] text-white w-12 h-12 rounded-full flex items-center justify-center text-xl mr-4">
                    M
                  </div>
                  <div>
                    <p className="text-lg text-gray-800">Muhammad Usman Sarwar</p>
                    <p className="text-sm text-gray-600">Project Developer</p>
                  </div>
                </div>
              </div>
            </div>
          </Card>
        </motion.div>

        {/* University Details */}
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.3, duration: 0.4 }}
        >
          <Card className="bg-gradient-to-br from-[#2E7D32] to-[#66BB6A] text-white rounded-2xl p-6 shadow-xl">
            <div className="flex items-center mb-3">
              <div className="bg-white/20 p-3 rounded-xl mr-4">
                <GraduationCap className="w-6 h-6 text-white" strokeWidth={1.5} />
              </div>
              <div>
                <h2 className="text-xl">Sukkur IBA University</h2>
                <p className="text-[#FFF3E0] text-sm">
                  Department of Computer Systems Engineering
                </p>
              </div>
            </div>
            <div className="bg-white/10 rounded-lg p-4 mt-4">
              <p className="text-sm text-[#F9FAF7]">
                This project is part of our ongoing research in applying artificial intelligence 
                to solve real-world agricultural challenges and promote sustainable farming practices.
              </p>
            </div>
          </Card>
        </motion.div>

        {/* Footer Note */}
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          transition={{ delay: 0.4, duration: 0.4 }}
          className="text-center mt-8"
        >
          <p className="text-[#A1887F] text-sm">
            Version 1.0.0 • 2026
          </p>
        </motion.div>
      </div>
    </div>
  );
}