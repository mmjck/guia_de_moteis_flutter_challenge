import 'package:flutter/material.dart';
import 'package:guia_de_moteis/core/models/api_response.dart';
import 'package:guia_de_moteis/core/services/motels_service.dart';

class MotelsProvider with ChangeNotifier {
  final MotelsService service;

  MotelsProvider({required this.service});

  ApiData? _data;
  ApiData? get data => _data;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    try {
      _data = await service.fetchMoteis();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
