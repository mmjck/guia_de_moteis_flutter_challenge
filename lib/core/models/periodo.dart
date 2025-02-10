import 'package:guia_de_moteis/core/models/desconto.dart';

class Periodo {
  final String tempoFormatado;
  final String tempo;
  final double valor;
  final double valorTotal;
  final bool temCortesia;
  final Desconto? desconto;

  Periodo({
    required this.tempoFormatado,
    required this.tempo,
    required this.valor,
    required this.valorTotal,
    required this.temCortesia,
    this.desconto,
  });

  factory Periodo.fromJson(Map<String, dynamic> json) {
    return Periodo(
      tempoFormatado: json['tempoFormatado'],
      tempo: json['tempo'],
      valor: (json['valor'] as num).toDouble(),
      valorTotal: (json['valorTotal'] as num).toDouble(),
      temCortesia: json['temCortesia'],
      desconto:
          json['desconto'] != null ? Desconto.fromJson(json['desconto']) : null,
    );
  }
}
