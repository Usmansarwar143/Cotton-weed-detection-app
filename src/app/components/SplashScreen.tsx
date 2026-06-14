import { useEffect } from 'react';
import { Leaf, Sparkles } from 'lucide-react';
import { motion } from 'motion/react';

interface SplashScreenProps {
  onComplete: () => void;
}

export function SplashScreen({ onComplete }: SplashScreenProps) {
  useEffect(() => {
    // Navigate to home screen after 3 seconds
    const timer = setTimeout(() => {
      onComplete();
    }, 3000);

    return () => clearTimeout(timer);
  }, [onComplete]);

  return (
    <div className="min-h-screen bg-gradient-to-b from-[#2E7D32] to-[#66BB6A] flex flex-col items-center justify-center p-6">
      {/* Animated Logo Container */}
      <motion.div
        initial={{ scale: 0, opacity: 0 }}
        animate={{ scale: 1, opacity: 1 }}
        transition={{ duration: 0.6, ease: "easeOut" }}
        className="relative mb-8"
      >
        {/* Decorative circle background - soft glow */}
        <motion.div 
          animate={{ 
            scale: [1, 1.1, 1],
            opacity: [0.3, 0.5, 0.3]
          }}
          transition={{ 
            repeat: Infinity, 
            duration: 3,
            ease: "easeInOut"
          }}
          className="absolute inset-0 bg-white/20 rounded-full blur-3xl scale-150" 
        />
        
        {/* Logo - Cotton Boll with Leaves - Clean circular design */}
        <motion.div 
          animate={{ 
            rotate: [0, 5, -5, 0],
          }}
          transition={{ 
            repeat: Infinity, 
            duration: 4,
            ease: "easeInOut"
          }}
          className="relative bg-[#F9FAF7] rounded-full p-12 shadow-2xl w-48 h-48 flex items-center justify-center"
        >
          {/* Cotton leaves icon - centered */}
          <Leaf className="w-32 h-32 text-[#2E7D32]" strokeWidth={1.5} />
          
          {/* AI sparkle element */}
          <motion.div
            animate={{ 
              scale: [1, 1.3, 1],
              opacity: [1, 0.7, 1]
            }}
            transition={{ 
              repeat: Infinity, 
              duration: 2,
              ease: "easeInOut"
            }}
          >
            <Sparkles className="w-8 h-8 text-[#FFF3E0] absolute top-2 right-2 drop-shadow-lg" />
          </motion.div>
        </motion.div>
      </motion.div>

      {/* App Name */}
      <motion.div
        initial={{ y: 20, opacity: 0 }}
        animate={{ y: 0, opacity: 1 }}
        transition={{ delay: 0.4, duration: 0.6 }}
        className="text-center"
      >
        <h1 className="text-4xl text-[#F9FAF7] mb-2">
          Cotton Weed Detection
        </h1>
        <p className="text-[#FFF3E0] text-lg">AI-Powered Agriculture</p>
      </motion.div>

      {/* Loading indicator - subtle animation */}
      <motion.div
        initial={{ opacity: 0 }}
        animate={{ opacity: 1 }}
        transition={{ delay: 0.8, duration: 0.5 }}
        className="mt-12"
      >
        <div className="flex space-x-2">
          <motion.div
            animate={{ scale: [1, 1.2, 1] }}
            transition={{ repeat: Infinity, duration: 1, delay: 0 }}
            className="w-3 h-3 bg-[#F9FAF7] rounded-full"
          />
          <motion.div
            animate={{ scale: [1, 1.2, 1] }}
            transition={{ repeat: Infinity, duration: 1, delay: 0.2 }}
            className="w-3 h-3 bg-[#F9FAF7] rounded-full"
          />
          <motion.div
            animate={{ scale: [1, 1.2, 1] }}
            transition={{ repeat: Infinity, duration: 1, delay: 0.4 }}
            className="w-3 h-3 bg-[#F9FAF7] rounded-full"
          />
        </div>
      </motion.div>
    </div>
  );
}