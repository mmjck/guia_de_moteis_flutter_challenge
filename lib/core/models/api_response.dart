import 'package:guia_de_moteis/core/models/motel.dart';

class ApiResponse {
  final bool sucess;
  final ApiData data;

  ApiResponse({required this.sucess, required this.data});

  factory ApiResponse.fromJson(Map<String, dynamic> json) {
    return ApiResponse(
      data: ApiData.fromJson(json["data"]),
      sucess: json['sucesso'],
    );
  }
}

class ApiData {
  final int page;
  final int totalByPage;
  final int totalSuites;
  final int totalMoteis;
  final int raio;
  final double maxPages;
  final List<Motel> moteis;

  ApiData({
    required this.page,
    required this.totalByPage,
    required this.totalSuites,
    required this.totalMoteis,
    required this.raio,
    required this.maxPages,
    required this.moteis,
  });

  factory ApiData.fromJson(Map<String, dynamic> json) {
    return ApiData(
      page: json['pagina'],
      totalByPage: json['qtdPorPagina'],
      totalSuites: json['totalSuites'],
      totalMoteis: json['totalMoteis'],
      raio: json['raio'],
      moteis: (json['moteis'] as List).map((e) => Motel.fromJson(e)).toList(),
      maxPages: json['maxPaginas'],
    );
  }
}
