import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

double formatCurrencyToDouble(String currencyText) {
  String integers, decimals;
  String onlyNumbers = currencyText.replaceAll(RegExp('[^0-9]'), '');
  int textLength = onlyNumbers.length;

  if (textLength > 2) {
    integers = onlyNumbers.substring(0, textLength - 2);
    decimals = onlyNumbers.substring(textLength - 2, textLength);
  } else if (textLength == 2) {
    integers = "0";
    decimals = onlyNumbers.substring(0, 2);
  } else if (textLength == 1) {
    integers = "0";
    decimals = "0" + onlyNumbers;
  }
  return double.parse(integers + "." + decimals);
}

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat currencyFormatter;

  CurrencyInputFormatter(this.currencyFormatter);

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    print("\n############################ \n");
    print("oldValue : ${oldValue.text}");
    print("newValue : ${newValue.text}");

    /// [newValue] is empty, return an empty String
    if (newValue.text.isEmpty) {
      print("Value is empty");
      return newValue.copyWith(text: '');

      /// [newValue] is different from [oldValue].
      /// Extract only the numbers of the text field, separate decimals and integers
      /// and format the resulting number using the NumberFormat.currency() formatter
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      final int selectionIndexFromTheRight = newValue.text.length - newValue.selection.end;
      double number = formatCurrencyToDouble(newValue.text);
      final String newString = currencyFormatter.format(number).trim();

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length - selectionIndexFromTheRight),
      );
    } else {
      print("Value hasn't changed");
      return newValue;
    }
  }
}
