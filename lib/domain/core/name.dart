// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/core/value_object.dart';

class Name extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  static const int maxLength = 30;
  factory Name(String input) {
    return Name._(_validateName(input));
  }

  const Name._(this.value) : assert(value != null);
}

Either<ValueFailure<String>, String> _validateName(String input) {
  if (input.isEmpty) {
    return left(ValueFailure<String>.emptyName(failedValue: input));
  } else if (input.length >= Name.maxLength) {
    return left(ValueFailure<String>.longName(failedValue: input));
  } else {
    return right(input);
  }
}
