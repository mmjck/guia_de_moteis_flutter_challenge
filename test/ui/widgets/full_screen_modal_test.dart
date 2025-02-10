import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/ui/widgets/full_screen_modal.dart';
import 'package:guia_de_moteis/ui/widgets/tertiary_button.dart';

void main() {
  void showBottomSheet(
    BuildContext context,
  ) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return const FullScreenModal(
          itemsCategory: [],
          items: [],
        );
      },
    );
  }

  group("FullScreenModal", () {
    testWidgets('render element', (WidgetTester tester) async {
      final widget = Builder(builder: (context) {
        return TertiaryButton(
          onPressed: () {
            showBottomSheet(context);
          },
          text: "test",
        );
      });

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      final Finder target = find.text("test");
      await tester.ensureVisible(target);
      await tester.tap(target);

      await tester.pumpAndSettle();
      expect(find.byType(FullScreenModal), findsOneWidget);
    });
  });
}
