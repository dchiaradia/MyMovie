import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class CurrencyInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return oldValue;
    }

    double value = 0;

    try {
      value = double.parse(
        newValue.text
            .replaceAll('R\$', '')
            .replaceAll(',', '')
            .replaceAll('.', '')
            .trim(),
      );
    } catch (e) {
      print(e);
    }

    final formatter =
        NumberFormat.simpleCurrency(locale: "pt_Br", decimalDigits: 2);

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText,
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
