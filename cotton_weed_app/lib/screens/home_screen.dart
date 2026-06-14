import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import '../l10n/app_localizations.dart';
import 'detection_screen.dart';
import 'info_screen.dart';
import '../theme.dart';
import '../widgets/language_bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 32),
            _buildActionCards(context),
            const SizedBox(height: 32),
            _buildHowItWorks(context),
            const SizedBox(height: 48),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.cottonGreen,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(48),
          bottomRight: Radius.circular(48),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.only(top: 80, bottom: 60, left: 24, right: 24),
      child: Column(
        children: [
          FadeInDown(
            child: Row(
              children: [
                const Icon(
                  Icons.eco_outlined,
                  color: Color(0xFFF9FAF7),
                  size: 40,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    l10n.appTitle,
                    style: const TextStyle(
                      color: Color(0xFFF9FAF7),
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => showLanguageBottomSheet(context),
                  icon: const Icon(
                    Icons.language,
                    color: Colors.white,
                    size: 28,
                  ),
                  tooltip: l10n.selectLanguage,
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          FadeInDown(
            delay: const Duration(milliseconds: 200),
            child: Text(
              l10n.tagline,
              textAlign: TextAlign.center,
              style: const TextStyle(color: AppTheme.warmAccent, fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionCards(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          // Detect Weed Card
          FadeInLeft(
            delay: const Duration(milliseconds: 300),
            child: _buildFeatureCard(
              context,
              title: l10n.detectWeed,
              subtitle: l10n.identifyWeedsDesc,
              icon: Icons.center_focus_weak,
              buttonText: l10n.startDetection,
              buttonColor: AppTheme.cottonGreen,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetectionScreen(),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          // About Project Card
          FadeInRight(
            delay: const Duration(milliseconds: 500),
            child: _buildFeatureCard(
              context,
              title: l10n.aboutApp,
              subtitle: l10n.learnAboutDesc,
              icon: Icons.info_outline,
              buttonText: l10n.viewDetails,
              buttonColor: AppTheme.lightGreen,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const InfoScreen()),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required String buttonText,
    required Color buttonColor,
    required VoidCallback onTap,
  }) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.warmAccent,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: AppTheme.cottonGreen, size: 32),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color(0xFF4B5563),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(buttonText),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHowItWorks(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return FadeInUp(
      delay: const Duration(milliseconds: 700),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.warmAccent,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: AppTheme.warmAccent),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.spa, color: AppTheme.cottonGreen, size: 24),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.howItWorks,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F2937),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l10n.howItWorksDesc,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF374151),
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
