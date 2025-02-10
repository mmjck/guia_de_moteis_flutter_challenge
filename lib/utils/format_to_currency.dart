import 'package:intl/intl.dart';

String formatCurrency(double value) {
  return NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$').format(value);
}
