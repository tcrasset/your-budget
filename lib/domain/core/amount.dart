// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
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
  final double amount = double.tryParse(input);
  if (amount == null) {
    return left(ValueFailure<String>.invalidAmount(failedValue: input));
  } else if (amount >= Amount.maxValue) {
    return left(ValueFailure<String>.tooBigAmount(failedValue: input));
  } else {
    return right(amount);
  }
}
