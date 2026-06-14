import { useState } from 'react';
import { SplashScreen } from './components/SplashScreen';
import { HomeScreen } from './components/HomeScreen';
import { DetectionScreen } from './components/DetectionScreen';
import { InfoScreen } from './components/InfoScreen';

type Screen = 'splash' | 'home' | 'detection' | 'info';

export default function App() {
  const [currentScreen, setCurrentScreen] = useState<Screen>('splash');

  const handleSplashComplete = () => {
    setCurrentScreen('home');
  };

  const handleNavigate = (screen: 'detection' | 'info') => {
    setCurrentScreen(screen);
  };

  const handleBack = () => {
    setCurrentScreen('home');
  };

  return (
    <div className="max-w-md mx-auto bg-white min-h-screen shadow-2xl">
      {currentScreen === 'splash' && (
        <SplashScreen onComplete={handleSplashComplete} />
      )}
      
      {currentScreen === 'home' && (
        <HomeScreen onNavigate={handleNavigate} />
      )}
      
      {currentScreen === 'detection' && (
        <DetectionScreen onBack={handleBack} />
      )}
      
      {currentScreen === 'info' && (
        <InfoScreen onBack={handleBack} />
      )}
    </div>
  );
}
