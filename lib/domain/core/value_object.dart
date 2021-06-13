// Package imports:
import 'package:dartz/dartz.dart';

// Project imports:
import 'errors.dart';
import 'value_failure.dart';

abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<dynamic>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    return value.fold(
      ((f) => throw UnexpectedValueError(f)) as T Function(ValueFailure<dynamic>),
      (right) => right,
    );
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (l) => left(l),
      (r) => right(unit),
    );
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}
