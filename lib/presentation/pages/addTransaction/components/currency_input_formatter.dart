// Flutter imports:
import 'package:flutter/services.dart';

// Package imports:
import 'package:intl/intl.dart';

/// Given the [currencyText] String returned from [NumberFormat.format()],
/// this method returns the double value of [currencyText], making sure
/// it is positive when [isPositive] is true, and negative when not.

class CurrencyInputFormatter extends TextInputFormatter {
  final NumberFormat currencyFormatter;
  final bool isPositive;

  CurrencyInputFormatter(this.currencyFormatter, this.isPositive);

  static double formatCurrencyToDouble(String currencyText, bool isPositive) {
    String integers = "0";
    String decimals = "0";
    final String onlyNumbers = currencyText.replaceAll(RegExp('[^0-9]'), '');
    final int textLength = onlyNumbers.length;

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

    final double number = double.parse("$integers.$decimals");
    return isPositive ? number : -number;
  }

  @override
  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {
    /// [newValue] is empty, return an empty String
    if (newValue.text.isEmpty) {
      return newValue.copyWith(text: '');
    } else if (newValue.text.compareTo(oldValue.text) != 0) {
      /// [newValue] is different from [oldValue].
      /// Extract only the numbers of the text field, separate decimals and integers
      /// and format the resulting number using the [NumberFormat.currency()] formatter
      final double number = formatCurrencyToDouble(newValue.text, isPositive);
      final String newString = currencyFormatter.format(number).trim();

      return TextEditingValue(
        text: newString,
        selection: TextSelection.collapsed(offset: newString.length - 2),
      );
    } else {
      return newValue;
    }
  }
}
