// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidTransaction({@required String failedValue}) =
      InvalidTransaction<T>;
  const factory ValueFailure.unexpected({@required String message}) = Unexpected<T>;

  const factory ValueFailure.longName({@required String failedValue}) = _LongName<T>;
  const factory ValueFailure.emptyName({@required String failedValue}) = _EmptyName<T>;

  const factory ValueFailure.invalidAmount({@required String failedValue}) = _InvalidAmount<T>;

  const factory ValueFailure.tooBigAmount({@required String failedValue}) = _TooLargeAmount<T>;
}
