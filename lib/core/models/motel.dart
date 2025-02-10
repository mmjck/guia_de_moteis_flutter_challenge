import 'package:guia_de_moteis/core/models/suite.dart';

class Motel {
  final String fantasia;
  final String logo;
  final String bairro;
  final double distancia;
  final int qtdFavoritos;
  final int qtdAvaliacoes;
  final double media;
  final List<Suite> suites;

  Motel({
    required this.fantasia,
    required this.logo,
    required this.bairro,
    required this.distancia,
    required this.qtdFavoritos,
    required this.qtdAvaliacoes,
    required this.media,
    required this.suites,
  });

  factory Motel.fromJson(Map<String, dynamic> json) {
    return Motel(
      fantasia: json['fantasia'] as String,
      logo: json['logo'],
      bairro: json['bairro'],
      distancia: (json['distancia'] as num).toDouble(),
      suites: (json['suites'] as List).map((e) => Suite.fromJson(e)).toList(),
      qtdFavoritos: json['qtdFavoritos'],
      qtdAvaliacoes: json['qtdAvaliacoes'],
      media: (json['media'] as num).toDouble(),
    );
  }
}
