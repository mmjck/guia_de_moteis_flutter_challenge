import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/ui/widgets/custom_typography.dart';

void main() {
  group("CustomTypography test", () {
    testWidgets('render element', (WidgetTester tester) async {
      const widget = CustomTypography(
        text: "test",
        variant: TypographyVariant.h1,
      );

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.byType(CustomTypography), findsOneWidget);
    });

    testWidgets('render texts', (WidgetTester tester) async {
      const widget = CustomTypography(
        text: "test",
        variant: TypographyVariant.h1,
      );

      await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.text("test").first, findsOne);
    });
  });
}
