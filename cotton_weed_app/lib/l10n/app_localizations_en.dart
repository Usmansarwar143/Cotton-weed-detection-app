// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CottonCare';

  @override
  String get tagline => 'Intelligent weed monitoring for cotton crops using AI';

  @override
  String get detectWeed => 'Detect Weed';

  @override
  String get identifyWeedsDesc => 'Identify weeds in your cotton field';

  @override
  String get startDetection => 'Start Detection';

  @override
  String get aboutApp => 'About App';

  @override
  String get learnAboutDesc => 'Learn about CottonCare & team';

  @override
  String get viewDetails => 'View Details';

  @override
  String get howItWorks => 'How it works';

  @override
  String get howItWorksDesc =>
      'Our deep learning model analyzes cotton crop images to detect and identify common weeds like Horse Purslane and Purple Nutsedge, helping farmers take timely action.';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get settings => 'Settings';

  @override
  String get projectOverview => 'Project Overview';

  @override
  String get projectOverviewDesc =>
      'This application uses advanced deep learning techniques to detect and identify weeds in cotton crops. Our AI model helps farmers quickly identify problematic weeds, enabling timely intervention and improving crop yield through precision agriculture.';

  @override
  String get datasetInfo => 'Dataset Information';

  @override
  String get datasetSource => 'Dataset Source';

  @override
  String get targetWeeds => 'Target Weeds';

  @override
  String get technology => 'Technology';

  @override
  String get viewOnKaggle => 'View Dataset on Kaggle';

  @override
  String get officialWebsite => 'Official Website';

  @override
  String get websiteDesc =>
      'Explore our complete datasets and detailed project documentation on our official website.';

  @override
  String get visitWebsite => 'Visit Website';

  @override
  String get projectMission => 'Project Mission';

  @override
  String get independentInnovation => 'Independent Innovation';

  @override
  String get missionDesc =>
      'CottonCare is an independent initiative dedicated to empowering farmers through accessible AI technology, fostering a future of smarter and more sustainable agriculture.';

  @override
  String get version => 'Version';

  @override
  String get captureOrUpload => 'Capture or upload an image';

  @override
  String get noImageSelected => 'No image selected';

  @override
  String get startDetectionDesc =>
      'Capture or upload an image to start detection';

  @override
  String get captureImage => 'Capture Image';

  @override
  String get uploadImage => 'Upload Image';

  @override
  String get analyzingImage => 'Analyzing image...';

  @override
  String get detectionResult => 'Detection Result';

  @override
  String get detectedWeed => 'Detected Weed';

  @override
  String get confidenceScore => 'Confidence Score';

  @override
  String get highConfidence => 'High Confidence';

  @override
  String get recommendation => 'Recommendation';

  @override
  String get detectAnother => 'Detect Another Image';

  @override
  String get detectionTip =>
      'Tip: For best results, ensure the image is clear and focused on the weed area. Good lighting improves detection accuracy.';

  @override
  String get horsePurslane => 'Horse Purslane';

  @override
  String get purpleNutsedge => 'Purple Nutsedge';

  @override
  String get horsePurslaneRec =>
      'Horse Purslane detected. Consider manual removal or targeted herbicide application for effective control.';

  @override
  String get blackPigweed => 'Black Pigweed';

  @override
  String get blackPigweedRec =>
      'Black Pigweed detected. Apply pre-emergence herbicides or use manual weeding in early stages.';

  @override
  String get nutgrass => 'Nutgrass';

  @override
  String get nutgrassRec =>
      'Nutgrass detected. Use systematic herbicides and ensure deep ploughing during summer to control tubers.';

  @override
  String get cottonRec =>
      'Healthy Cotton crop detected. No weed management action needed.';
}
