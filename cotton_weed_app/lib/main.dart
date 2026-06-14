import 'package:flutter/material.dart';
import 'l10n/app_localizations.dart';
import 'theme.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'language_provider.dart';

final languageProvider = LanguageProvider();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const CottonWeedApp());
}

class CottonWeedApp extends StatelessWidget {
  const CottonWeedApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: languageProvider,
      builder: (context, child) {
        return MaterialApp(
          title: 'CottonCare',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.light,
          locale: languageProvider.currentLocale,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: const [Locale('en'), Locale('ur')],
          home: const MainContainer(),
        );
      },
    );
  }
}

class MainContainer extends StatefulWidget {
  const MainContainer({super.key});

  @override
  State<MainContainer> createState() => _MainContainerState();
}

class _MainContainerState extends State<MainContainer> {
  bool _showSplash = true;

  void _onSplashComplete() {
    setState(() {
      _showSplash = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_showSplash) {
      return SplashScreen(onComplete: _onSplashComplete);
    }
    return const HomeScreen();
  }
}
