import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/core/services/motels_service.dart';
import 'package:http/testing.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;

import 'mock.dart';

@GenerateMocks([http.Client])
void main() {
  test('returns data if the http call completes successfully', () async {
    final client = MockClient((request) async {
      return http.Response(mockData, 200);
    });

    final service = MotelsService(client);

    final data = await service.fetchMoteis();

    expect(data?.page, 1);
    expect(data?.maxPages, 1.0);
    expect(data?.totalSuites, 0);
    expect(data?.totalMoteis, 1);
    expect(data?.raio, 0);
    expect(data?.moteis.length, 1);
  });
}
