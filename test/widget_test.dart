import 'package:flutter_test/flutter_test.dart';

import 'package:herbal_plant_app/main.dart';

void main() {
  testWidgets('HerbVision app launches', (WidgetTester tester) async {
    await tester.pumpWidget(const HerbVisionApp());
    expect(find.byType(HerbVisionApp), findsOneWidget);
  });
}
