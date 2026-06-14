import { Scan, Info, Sprout, Leaf } from 'lucide-react';
import { motion } from 'motion/react';
import { Button } from './ui/button';

interface HomeScreenProps {
  onNavigate: (screen: 'detection' | 'info') => void;
}

export function HomeScreen({ onNavigate }: HomeScreenProps) {
  return (
    <div className="min-h-screen bg-[#F9FAF7]">
      {/* Header - Cotton Green */}
      <div className="bg-[#2E7D32] text-[#F9FAF7] pt-12 pb-16 px-6 rounded-b-[3rem] shadow-xl">
        <motion.div
          initial={{ y: -20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ duration: 0.5 }}
          className="flex items-center justify-center mb-4"
        >
          <Leaf className="w-10 h-10 mr-3" strokeWidth={1.5} />
          <h1 className="text-3xl">Cotton Weed Detection</h1>
        </motion.div>
        
        <motion.p
          initial={{ y: -20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.2, duration: 0.5 }}
          className="text-center text-[#FFF3E0] text-lg px-4"
        >
          AI-powered weed detection for cotton crops
        </motion.p>
      </div>

      {/* Main Content */}
      <div className="px-6 -mt-8">
        {/* Feature Cards */}
        <div className="space-y-4 mb-8">
          {/* Detect Weed Card */}
          <motion.div
            initial={{ x: -100, opacity: 0 }}
            animate={{ x: 0, opacity: 1 }}
            transition={{ 
              delay: 0.3, 
              duration: 0.6,
              type: "spring",
              stiffness: 100,
              damping: 15
            }}
            whileHover={{ 
              scale: 1.03,
              boxShadow: "0 25px 50px -12px rgba(46, 125, 50, 0.25)",
              transition: { duration: 0.2 }
            }}
            whileTap={{ 
              scale: 0.97,
              transition: { duration: 0.1 }
            }}
            onClick={() => onNavigate('detection')}
            className="bg-white rounded-2xl shadow-xl p-6 cursor-pointer border-2 border-transparent hover:border-[#2E7D32] transition-all"
          >
            <div className="flex items-center mb-4">
              <motion.div 
                whileHover={{ rotate: [0, -10, 10, -10, 0] }}
                transition={{ duration: 0.5 }}
                className="bg-[#FFF3E0] p-4 rounded-xl mr-4"
              >
                <Scan className="w-8 h-8 text-[#2E7D32]" strokeWidth={1.5} />
              </motion.div>
              <div>
                <h2 className="text-2xl text-gray-800 mb-1">Detect Weed</h2>
                <p className="text-gray-600">Identify weeds in your cotton field</p>
              </div>
            </div>
            <Button 
              className="w-full bg-[#2E7D32] hover:bg-[#1B5E20] text-white rounded-xl py-6 text-lg shadow-md"
              onClick={() => onNavigate('detection')}
            >
              Start Detection
            </Button>
          </motion.div>

          {/* About Project Card */}
          <motion.div
            initial={{ x: 100, opacity: 0 }}
            animate={{ x: 0, opacity: 1 }}
            transition={{ 
              delay: 0.5, 
              duration: 0.6,
              type: "spring",
              stiffness: 100,
              damping: 15
            }}
            whileHover={{ 
              scale: 1.03,
              boxShadow: "0 25px 50px -12px rgba(102, 187, 106, 0.25)",
              transition: { duration: 0.2 }
            }}
            whileTap={{ 
              scale: 0.97,
              transition: { duration: 0.1 }
            }}
            onClick={() => onNavigate('info')}
            className="bg-white rounded-2xl shadow-xl p-6 cursor-pointer border-2 border-transparent hover:border-[#66BB6A] transition-all"
          >
            <div className="flex items-center mb-4">
              <motion.div 
                whileHover={{ rotate: [0, -10, 10, -10, 0] }}
                transition={{ duration: 0.5 }}
                className="bg-[#FFF3E0] p-4 rounded-xl mr-4"
              >
                <Info className="w-8 h-8 text-[#A1887F]" strokeWidth={1.5} />
              </motion.div>
              <div>
                <h2 className="text-2xl text-gray-800 mb-1">About Project</h2>
                <p className="text-gray-600">Learn about our AI model & team</p>
              </div>
            </div>
            <Button 
              className="w-full bg-[#66BB6A] hover:bg-[#4CAF50] text-white rounded-xl py-6 text-lg shadow-md"
              onClick={() => onNavigate('info')}
            >
              View Details
            </Button>
          </motion.div>
        </div>

        {/* Info Section */}
        <motion.div
          initial={{ y: 20, opacity: 0 }}
          animate={{ y: 0, opacity: 1 }}
          transition={{ delay: 0.7, duration: 0.5 }}
          className="bg-[#FFF3E0] rounded-2xl p-6 border-2 border-[#FFF3E0] shadow-sm"
        >
          <div className="flex items-start">
            <Sprout className="w-6 h-6 text-[#2E7D32] mr-3 mt-1 flex-shrink-0" strokeWidth={1.5} />
            <div>
              <h3 className="text-lg text-gray-800 mb-2">How it works</h3>
              <p className="text-gray-700 text-sm leading-relaxed">
                Our deep learning model analyzes cotton crop images to detect and identify common weeds like Horse Purslane and Purple Nutsedge, helping farmers take timely action.
              </p>
            </div>
          </div>
        </motion.div>
      </div>

      {/* Footer */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.9, duration: 0.5 }}
        className="text-center mt-12 pb-8 px-6"
      >
        <p className="text-[#A1887F] text-sm">
          Sukkur IBA University
        </p>
        <p className="text-gray-400 text-xs mt-1">
          Department of Computer Systems Engineering
        </p>
      </motion.div>
    </div>
  );
}