import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/core/models/motel.dart';
import 'package:guia_de_moteis/core/models/suite.dart';
import 'package:guia_de_moteis/ui/widgets/motel_card.dart';

void main() {
  group("MotelCard", () {
    final data = Motel(
        fantasia: "test",
        logo:
            "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg",
        bairro: "bairro",
        distancia: 12,
        qtdFavoritos: 1,
        qtdAvaliacoes: 1,
        media: 1,
        suites: [
          Suite(nome: "suite", qtd: 1, exibirQtdDisponiveis: false, fotos: [
            "https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg"
          ], itens: [], categoriaItens: [], periodos: [])
        ]);
    testWidgets('render element', (WidgetTester tester) async {
      final widget = MotelCard(
        data: data,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              widget,
            ],
          )),
        ),
      ));

      expect(find.byType(MotelCard), findsOneWidget);
    });

    testWidgets('render properties element', (WidgetTester tester) async {
      final widget = MotelCard(
        data: data,
      );

      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: SingleChildScrollView(
              child: Column(
            children: [
              widget,
            ],
          )),
        ),
      ));

      final MotelCard finded = tester.widget<MotelCard>(find.byType(MotelCard));

      expect(finded.data.bairro, data.bairro);
      expect(finded.data.fantasia, data.fantasia);

      expect(finded.data.suites.length, data.suites.length);
    });
  });
}
