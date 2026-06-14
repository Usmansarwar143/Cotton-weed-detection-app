import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ur.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ur'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CottonCare'**
  String get appTitle;

  /// No description provided for @tagline.
  ///
  /// In en, this message translates to:
  /// **'Intelligent weed monitoring for cotton crops using AI'**
  String get tagline;

  /// No description provided for @detectWeed.
  ///
  /// In en, this message translates to:
  /// **'Detect Weed'**
  String get detectWeed;

  /// No description provided for @identifyWeedsDesc.
  ///
  /// In en, this message translates to:
  /// **'Identify weeds in your cotton field'**
  String get identifyWeedsDesc;

  /// No description provided for @startDetection.
  ///
  /// In en, this message translates to:
  /// **'Start Detection'**
  String get startDetection;

  /// No description provided for @aboutApp.
  ///
  /// In en, this message translates to:
  /// **'About App'**
  String get aboutApp;

  /// No description provided for @learnAboutDesc.
  ///
  /// In en, this message translates to:
  /// **'Learn about CottonCare & team'**
  String get learnAboutDesc;

  /// No description provided for @viewDetails.
  ///
  /// In en, this message translates to:
  /// **'View Details'**
  String get viewDetails;

  /// No description provided for @howItWorks.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get howItWorks;

  /// No description provided for @howItWorksDesc.
  ///
  /// In en, this message translates to:
  /// **'Our deep learning model analyzes cotton crop images to detect and identify common weeds like Horse Purslane and Purple Nutsedge, helping farmers take timely action.'**
  String get howItWorksDesc;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @projectOverview.
  ///
  /// In en, this message translates to:
  /// **'Project Overview'**
  String get projectOverview;

  /// No description provided for @projectOverviewDesc.
  ///
  /// In en, this message translates to:
  /// **'This application uses advanced deep learning techniques to detect and identify weeds in cotton crops. Our AI model helps farmers quickly identify problematic weeds, enabling timely intervention and improving crop yield through precision agriculture.'**
  String get projectOverviewDesc;

  /// No description provided for @datasetInfo.
  ///
  /// In en, this message translates to:
  /// **'Dataset Information'**
  String get datasetInfo;

  /// No description provided for @datasetSource.
  ///
  /// In en, this message translates to:
  /// **'Dataset Source'**
  String get datasetSource;

  /// No description provided for @targetWeeds.
  ///
  /// In en, this message translates to:
  /// **'Target Weeds'**
  String get targetWeeds;

  /// No description provided for @technology.
  ///
  /// In en, this message translates to:
  /// **'Technology'**
  String get technology;

  /// No description provided for @viewOnKaggle.
  ///
  /// In en, this message translates to:
  /// **'View Dataset on Kaggle'**
  String get viewOnKaggle;

  /// No description provided for @officialWebsite.
  ///
  /// In en, this message translates to:
  /// **'Official Website'**
  String get officialWebsite;

  /// No description provided for @websiteDesc.
  ///
  /// In en, this message translates to:
  /// **'Explore our complete datasets and detailed project documentation on our official website.'**
  String get websiteDesc;

  /// No description provided for @visitWebsite.
  ///
  /// In en, this message translates to:
  /// **'Visit Website'**
  String get visitWebsite;

  /// No description provided for @projectMission.
  ///
  /// In en, this message translates to:
  /// **'Project Mission'**
  String get projectMission;

  /// No description provided for @independentInnovation.
  ///
  /// In en, this message translates to:
  /// **'Independent Innovation'**
  String get independentInnovation;

  /// No description provided for @missionDesc.
  ///
  /// In en, this message translates to:
  /// **'CottonCare is an independent initiative dedicated to empowering farmers through accessible AI technology, fostering a future of smarter and more sustainable agriculture.'**
  String get missionDesc;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @captureOrUpload.
  ///
  /// In en, this message translates to:
  /// **'Capture or upload an image'**
  String get captureOrUpload;

  /// No description provided for @noImageSelected.
  ///
  /// In en, this message translates to:
  /// **'No image selected'**
  String get noImageSelected;

  /// No description provided for @startDetectionDesc.
  ///
  /// In en, this message translates to:
  /// **'Capture or upload an image to start detection'**
  String get startDetectionDesc;

  /// No description provided for @captureImage.
  ///
  /// In en, this message translates to:
  /// **'Capture Image'**
  String get captureImage;

  /// No description provided for @uploadImage.
  ///
  /// In en, this message translates to:
  /// **'Upload Image'**
  String get uploadImage;

  /// No description provided for @analyzingImage.
  ///
  /// In en, this message translates to:
  /// **'Analyzing image...'**
  String get analyzingImage;

  /// No description provided for @detectionResult.
  ///
  /// In en, this message translates to:
  /// **'Detection Result'**
  String get detectionResult;

  /// No description provided for @detectedWeed.
  ///
  /// In en, this message translates to:
  /// **'Detected Weed'**
  String get detectedWeed;

  /// No description provided for @confidenceScore.
  ///
  /// In en, this message translates to:
  /// **'Confidence Score'**
  String get confidenceScore;

  /// No description provided for @highConfidence.
  ///
  /// In en, this message translates to:
  /// **'High Confidence'**
  String get highConfidence;

  /// No description provided for @recommendation.
  ///
  /// In en, this message translates to:
  /// **'Recommendation'**
  String get recommendation;

  /// No description provided for @detectAnother.
  ///
  /// In en, this message translates to:
  /// **'Detect Another Image'**
  String get detectAnother;

  /// No description provided for @detectionTip.
  ///
  /// In en, this message translates to:
  /// **'Tip: For best results, ensure the image is clear and focused on the weed area. Good lighting improves detection accuracy.'**
  String get detectionTip;

  /// No description provided for @horsePurslane.
  ///
  /// In en, this message translates to:
  /// **'Horse Purslane'**
  String get horsePurslane;

  /// No description provided for @purpleNutsedge.
  ///
  /// In en, this message translates to:
  /// **'Purple Nutsedge'**
  String get purpleNutsedge;

  /// No description provided for @horsePurslaneRec.
  ///
  /// In en, this message translates to:
  /// **'Horse Purslane detected. Consider manual removal or targeted herbicide application for effective control.'**
  String get horsePurslaneRec;

  /// No description provided for @blackPigweed.
  ///
  /// In en, this message translates to:
  /// **'Black Pigweed'**
  String get blackPigweed;

  /// No description provided for @blackPigweedRec.
  ///
  /// In en, this message translates to:
  /// **'Black Pigweed detected. Apply pre-emergence herbicides or use manual weeding in early stages.'**
  String get blackPigweedRec;

  /// No description provided for @nutgrass.
  ///
  /// In en, this message translates to:
  /// **'Nutgrass'**
  String get nutgrass;

  /// No description provided for @nutgrassRec.
  ///
  /// In en, this message translates to:
  /// **'Nutgrass detected. Use systematic herbicides and ensure deep ploughing during summer to control tubers.'**
  String get nutgrassRec;

  /// No description provided for @cottonRec.
  ///
  /// In en, this message translates to:
  /// **'Healthy Cotton crop detected. No weed management action needed.'**
  String get cottonRec;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ur'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ur':
      return AppLocalizationsUr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
