import 'package:guia_de_moteis/core/models/categoria_item.dart';
import 'package:guia_de_moteis/core/models/periodo.dart';

class Suite {
  final String nome;
  final int qtd;
  final bool exibirQtdDisponiveis;
  final List<String> fotos;
  final List<Item> itens;
  final List<CategoriaItem> categoriaItens;
  final List<Periodo> periodos;

  Suite({
    required this.nome,
    required this.qtd,
    required this.exibirQtdDisponiveis,
    required this.fotos,
    required this.itens,
    required this.categoriaItens,
    required this.periodos,
  });

  factory Suite.fromJson(Map<String, dynamic> json) {
    return Suite(
      nome: json['nome'] as String,
      qtd: json['qtd'],
      exibirQtdDisponiveis: json['exibirQtdDisponiveis'],
      fotos: List<String>.from(json['fotos']),
      itens: (json['itens'] as List).map((e) => Item.fromJson(e)).toList(),
      categoriaItens: (json['categoriaItens'] as List)
          .map((e) => CategoriaItem.fromJson(e))
          .toList(),
      periodos:
          (json['periodos'] as List).map((e) => Periodo.fromJson(e)).toList(),
    );
  }
}

class Item {
  final String nome;

  Item({required this.nome});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(nome: json['nome']);
  }
}
