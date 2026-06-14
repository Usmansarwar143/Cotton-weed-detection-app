import 'package:flutter_test/flutter_test.dart';
import 'package:cotton_weed_app/main.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const CottonWeedApp());

    // Verify that splash screen or home screen is shown.
    // Since it starts with a splash screen, we expect to see 'CottonCare'
    expect(find.text('CottonCare'), findsAtLeast(1));
  });
}
