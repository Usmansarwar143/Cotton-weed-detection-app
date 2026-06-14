import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../theme.dart';

class SplashScreen extends StatefulWidget {
  final VoidCallback onComplete;

  const SplashScreen({super.key, required this.onComplete});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 3));
    widget.onComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppTheme.cottonGreen, AppTheme.lightGreen],
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [_buildAnimatedLogo()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimatedLogo() {
    return ElasticIn(
      duration: const Duration(milliseconds: 1000),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Logo Container
          Container(
            width: 96,
            height: 96,
            decoration: const BoxDecoration(
              color: Color(0xFFF9FAF7),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 20,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            child: const Icon(
              Icons.eco_outlined,
              size: 56,
              color: AppTheme.cottonGreen,
            ),
          ),
          // Sparkle Icon
          Positioned(
            top: 15,
            right: 15,
            child: FadeIn(
              delay: const Duration(milliseconds: 800),
              child: const Icon(
                Icons.auto_awesome,
                color: AppTheme.warmAccent,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
