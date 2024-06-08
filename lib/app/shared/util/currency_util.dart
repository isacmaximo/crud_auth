import 'package:intl/intl.dart';

class CurrencyUtil {
  static String doubleToReal(double value) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return formatter.format(value);
  }

  static double parseCurrency(String value) {
    // Remove todos os caracteres não numéricos, exceto vírgulas e pontos
    String cleanedValue = value.replaceAll(RegExp(r'[^\d,]'), '');

    // Remove pontos usados como separadores de milhar
    cleanedValue = cleanedValue.replaceAll('.', '');

    // Substitui a vírgula decimal por um ponto decimal
    cleanedValue = cleanedValue.replaceAll(',', '.');

    // Converte a string resultante para double
    return double.tryParse(cleanedValue) ?? 0.0;
  }
}
