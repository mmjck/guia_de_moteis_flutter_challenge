import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/ui/widgets/app_bar.dart';
import 'package:guia_de_moteis/ui/widgets/custom_typography.dart';

void main() {
  group("CustomTypography test", () {
    testWidgets('render element', (WidgetTester tester) async {
      const widget = HeaderAppBar();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(120.0), child: widget),
          body: Container(),
        ),
      ));

      expect(find.byType(HeaderAppBar), findsOneWidget);
    });

    testWidgets('render widgets', (WidgetTester tester) async {
      const widget = HeaderAppBar();

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          appBar: const PreferredSize(
              preferredSize: Size.fromHeight(120.0), child: widget),
          body: Container(),
        ),
      ));

      expect(find.byType(AppBar), findsOneWidget);

      expect(find.byType(IconButton), findsNWidgets(2));

      expect(find.byType(CustomTypography), findsOneWidget);
      expect(find.byType(Icon), findsNWidgets(3));
    });
  });
}
