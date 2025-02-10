import 'dart:convert';

import 'package:guia_de_moteis/core/models/api_response.dart';
import 'package:guia_de_moteis/core/network/endpoints.dart';
import 'package:http/http.dart' as http;

class MotelsService {
  http.Client client;

  MotelsService(this.client);

  Future<ApiData?> fetchMoteis() async {
    var response = await http.get(Endpoints.motelsURL);

    try {
      var decoded = jsonDecode(utf8.decode(response.bodyBytes));
      return ApiResponse.fromJson(decoded).data;
    } catch (e) {
      rethrow;
    }
  }
}
