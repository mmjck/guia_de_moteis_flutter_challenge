import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/core/models/desconto.dart';
import 'package:guia_de_moteis/core/models/periodo.dart';
import 'package:guia_de_moteis/ui/widgets/row_price_element.dart';
import 'package:guia_de_moteis/ui/widgets/custom_typography.dart';

void main() {
  group("RowPriceElement test", () {
    testWidgets('render element', (WidgetTester tester) async {
      final Periodo p = Periodo(
          tempoFormatado: "12 horas",
          tempo: "12",
          valor: 100,
          valorTotal: 100,
          temCortesia: false);

      final widget = RowPrice(periodo: p);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.byType(RowPrice), findsOneWidget);
    });

    testWidgets('render texts', (WidgetTester tester) async {
      final Periodo p = Periodo(
          tempoFormatado: "12 horas",
          tempo: "12",
          valor: 100,
          valorTotal: 100,
          temCortesia: false);

      final widget = RowPrice(periodo: p);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.byType(CustomTypography), findsNWidgets(2));
    });

    testWidgets('Counter increments smoke test', (WidgetTester tester) async {
      final Periodo p = Periodo(
          tempoFormatado: "12 horas",
          tempo: "12",
          valor: 100,
          valorTotal: 100,
          temCortesia: false);

      final widget = RowPrice(periodo: p);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.byType(CustomTypography), findsNWidgets(2));
    });

    testWidgets('render texts', (WidgetTester tester) async {
      final Periodo p = Periodo(
        tempoFormatado: "12 horas",
        tempo: "12",
        valor: 100,
        valorTotal: 100,
        temCortesia: false,
      );

      final widget = RowPrice(periodo: p);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.text("12 horas"), findsOne);
      expect(find.text("R\$ 100,00"), findsOne);
    });

    testWidgets('render texts with discount', (WidgetTester tester) async {
      final Periodo p = Periodo(
        tempoFormatado: "12 horas",
        tempo: "12",
        valor: 100,
        valorTotal: 50,
        temCortesia: false,
        desconto: Desconto(
          desconto: 50,
        ),
      );

      final widget = RowPrice(periodo: p);

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: widget,
        ),
      ));

      expect(find.byType(CustomTypography), findsNWidgets(4));

      expect(find.text("12 horas"), findsOne);
      expect(find.text("R\$ 100,00"), findsOne);
      expect(find.text("R\$ 50,00"), findsOne);
    });
  });
}
