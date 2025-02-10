import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/ui/widgets/tertiary_button.dart';

void main() {
  group("TertiaryButton test", () {
    testWidgets('render element', (WidgetTester tester) async {
      final widget = TertiaryButton(
        text: "test",
        onPressed: () {},
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.byType(TertiaryButton), findsOneWidget);
    });

    testWidgets('render element', (WidgetTester tester) async {
      tester.view.devicePixelRatio = 2.0;
      tester.view.physicalSize = const Size(1080, 1920);

      bool pressed = false;
      final widget = TertiaryButton(
        text: "test",
        onPressed: () {
          pressed = true;
        },
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.text("test"), findsOneWidget);

      final Finder target = find.text("test");
      await tester.ensureVisible(target);
      await tester.tap(target);

      await tester.pumpAndSettle();

      expect(pressed, true);
    });
  });
}
