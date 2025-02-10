import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/utils/extract_percentage_value.dart';

void main() {
  group("Extrat Percenteage", () {
    test('should be extract correct', () {
      const double newValue = 100;
      const double oldValue = 200;

      expect(extractPercentage(oldValue, newValue), 50);
    });
  });
}
