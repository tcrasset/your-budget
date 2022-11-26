import 'package:your_budget/models/constants.dart';

String format(double number) {
  return Constants.CURRENCY_FORMAT.format(number);
}

num parse(String text) {
  /// There is a bug in the intl library
  /// https://github.com/dart-lang/intl/issues/478
  String without_symbol = text.replaceAll(Constants.CURRENCY_SYMBOL, "").trim();
  return Constants.CURRENCY_FORMAT.parse(without_symbol);
}
