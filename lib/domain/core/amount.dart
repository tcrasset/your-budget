// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/currency_input_formatter.dart';
import 'value_failure.dart';
import 'value_object.dart';

class Amount extends ValueObject<double> {
  @override
  final Either<ValueFailure<String>, double> value;

  static const maxValue = 999999999.99;

  factory Amount(String input) {
    return Amount._(_validateAmount(input));
  }

  const Amount._(this.value) : assert(value != null);
}

Either<ValueFailure<String>, double> _validateAmount(String input) {
  final bool isNegative = input.contains("-");
  final String absoluteInput = input.replaceAll("-", "");
  num? tryParsedAmount;
  double amount;

  try {
    tryParsedAmount = Constants.CURRENCY_FORMAT.parse(absoluteInput); //Can't parse negative amounts
  } on FormatException catch (e) {
    print(e);
  } finally {
    amount = double.tryParse(tryParsedAmount?.toString() ?? absoluteInput)!;
    if (isNegative) amount = -amount;
  }

  if (amount == null) {
    return left(ValueFailure<String>.invalidAmount(failedValue: input));
  } else if (amount >= Amount.maxValue) {
    return left(ValueFailure<String>.tooBigAmount(failedValue: input));
  } else {
    return right(amount);
  }
}
