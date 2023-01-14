// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/amount_input_row.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/currency_input_formatter.dart';
import 'value_failure.dart';
import 'value_object.dart';

class Amount extends ValueObject<double> {
  @override
  final Either<ValueFailure<String>, double> value;

  static const MAX_VALUE = 999999999.99;

  factory Amount(String input) {
    return Amount._(_validateAmount(input));
  }

  factory Amount.fromDouble(double input) {
    Either<ValueFailure<String>, double> failureOrAmount;
    if (input >= Amount.MAX_VALUE) {
      failureOrAmount = left(ValueFailure<String>.tooBigAmount(failedValue: input.toString()));
    } else {
      failureOrAmount = right(input);
    }
    return Amount._(failureOrAmount);
  }

  const Amount._(this.value);

  Amount operator +(Amount other) => Amount.fromDouble(getOrCrash() + other.getOrCrash());
  Amount operator -(Amount other) => Amount.fromDouble(getOrCrash() - other.getOrCrash());
}

Either<ValueFailure<String>, double> _validateAmount(String input) {
  if (input == "") {
    return left(ValueFailure<String>.invalidAmount(failedValue: input));
  }

  final double value = _formatFromCurrency(input);

  if (value >= Amount.MAX_VALUE) {
    return left(ValueFailure<String>.tooBigAmount(failedValue: input));
  } else {
    return right(value);
  }
}

double _formatFromCurrency(String input) {
  final double amount = _parseCurrency(input);
  final bool isNegative = input.contains("-");
  return isNegative ? -amount : amount;
}

double _parseCurrency(String input) {
  num? tryParsedAmount;
  final String absoluteInput = _cleanInput(input);

  try {
    tryParsedAmount = Constants.CURRENCY_FORMAT.parse(absoluteInput); //Can't parse negative amounts
  } on FormatException {}

  // Use tryParsedAmount if it didn't throw an exception, else use absolute input
  final String inputToParse = tryParsedAmount != null ? tryParsedAmount.toString() : absoluteInput;
  return double.tryParse(inputToParse)!;
}

String _cleanInput(String input) {
  String cleanedInput;
  cleanedInput = CurrencyOperations.removeMinusSign(input);
  cleanedInput = CurrencyOperations.removeSymbol(cleanedInput);
  return cleanedInput;
}
