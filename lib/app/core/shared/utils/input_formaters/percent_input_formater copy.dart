import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class PercentInputFormatter extends TextInputFormatter {
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    if (newValue.selection.baseOffset == 0) {
      print(true);
      return oldValue;
    }
    double value = 0;
    print(newValue);

    try {
      value = double.parse(
        newValue.text
            .replaceAll('%', '')
            .replaceAll(',', '')
            .replaceAll('.', '')
            .trim(),
      );
    } catch (e) {
      print(e);
    }

    // final formatter =
    //     NumberFormat.decimalPercentPattern(locale: "pt_Br", decimalDigits: 2);
    final formatter =
        NumberFormat.simpleCurrency(locale: "pt_Br", decimalDigits: 2);

    String newText = formatter.format(value / 100);

    return newValue.copyWith(
        text: newText.replaceAll('R\$', ''),
        selection: new TextSelection.collapsed(offset: newText.length));
  }
}
