import 'package:flutter_test/flutter_test.dart';
import 'package:guia_de_moteis/utils/format_to_currency.dart';

void main() {
  group("Format to currency", () {
    test('should be formatted correct', () {
      const double value = 100;

      expect(formatCurrency(value), "R\$ 100,00");
    });
  });
}
