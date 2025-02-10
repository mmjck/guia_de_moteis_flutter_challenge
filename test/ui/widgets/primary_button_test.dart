import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/ui/widgets/primary_button.dart';

void main() {
  group("PrimaryButton test", () {
    testWidgets('render element', (WidgetTester tester) async {
      final widget = PrimaryButton(
        text: "test",
        onPressed: () {},
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.byType(PrimaryButton), findsOneWidget);
    });

    testWidgets('render properties element', (WidgetTester tester) async {
      final widget = PrimaryButton(
        text: "test",
        onPressed: () {},
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      final PrimaryButton finded =
          tester.widget<PrimaryButton>(find.byType(PrimaryButton));

      expect(finded.text, "test");
      expect(finded.onPressed != null, true);
    });

    testWidgets('click', (WidgetTester tester) async {
      tester.view.devicePixelRatio = 2.0;
      tester.view.physicalSize = const Size(1080, 1920);

      bool pressed = false;
      final widget = PrimaryButton(
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
