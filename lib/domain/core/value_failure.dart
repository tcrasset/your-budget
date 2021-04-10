// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';

part 'value_failure.freezed.dart';

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidTransaction({@required String failedValue}) =
      InvalidTransaction<T>;
  const factory ValueFailure.unexpected({@required String message}) = Unexpected<T>;
}
