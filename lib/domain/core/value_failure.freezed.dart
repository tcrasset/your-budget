// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

// ignore: unused_element
  InvalidTransaction<T> invalidTransaction<T>({@required String failedValue}) {
    return InvalidTransaction<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  Unexpected<T> unexpected<T>({@required String message}) {
    return Unexpected<T>(
      message: message,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res> implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;
}

/// @nodoc
abstract class $InvalidTransactionCopyWith<T, $Res> {
  factory $InvalidTransactionCopyWith(
          InvalidTransaction<T> value, $Res Function(InvalidTransaction<T>) then) =
      _$InvalidTransactionCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidTransactionCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $InvalidTransactionCopyWith<T, $Res> {
  _$InvalidTransactionCopyWithImpl(
      InvalidTransaction<T> _value, $Res Function(InvalidTransaction<T>) _then)
      : super(_value, (v) => _then(v as InvalidTransaction<T>));

  @override
  InvalidTransaction<T> get _value => super._value as InvalidTransaction<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(InvalidTransaction<T>(
      failedValue: failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$InvalidTransaction<T> implements InvalidTransaction<T> {
  const _$InvalidTransaction({@required this.failedValue}) : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidTransaction(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidTransaction<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality().equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidTransactionCopyWith<T, InvalidTransaction<T>> get copyWith =>
      _$InvalidTransactionCopyWithImpl<T, InvalidTransaction<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    return invalidTransaction(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidTransaction != null) {
      return invalidTransaction(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    return invalidTransaction(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidTransaction != null) {
      return invalidTransaction(this);
    }
    return orElse();
  }
}

abstract class InvalidTransaction<T> implements ValueFailure<T> {
  const factory InvalidTransaction({@required String failedValue}) = _$InvalidTransaction<T>;

  String get failedValue;
  $InvalidTransactionCopyWith<T, InvalidTransaction<T>> get copyWith;
}

/// @nodoc
abstract class $UnexpectedCopyWith<T, $Res> {
  factory $UnexpectedCopyWith(Unexpected<T> value, $Res Function(Unexpected<T>) then) =
      _$UnexpectedCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class _$UnexpectedCopyWithImpl<T, $Res> extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $UnexpectedCopyWith<T, $Res> {
  _$UnexpectedCopyWithImpl(Unexpected<T> _value, $Res Function(Unexpected<T>) _then)
      : super(_value, (v) => _then(v as Unexpected<T>));

  @override
  Unexpected<T> get _value => super._value as Unexpected<T>;

  @override
  $Res call({
    Object message = freezed,
  }) {
    return _then(Unexpected<T>(
      message: message == freezed ? _value.message : message as String,
    ));
  }
}

/// @nodoc
class _$Unexpected<T> implements Unexpected<T> {
  const _$Unexpected({@required this.message}) : assert(message != null);

  @override
  final String message;

  @override
  String toString() {
    return 'ValueFailure<$T>.unexpected(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Unexpected<T> &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $UnexpectedCopyWith<T, Unexpected<T>> get copyWith =>
      _$UnexpectedCopyWithImpl<T, Unexpected<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected<T> implements ValueFailure<T> {
  const factory Unexpected({@required String message}) = _$Unexpected<T>;

  String get message;
  $UnexpectedCopyWith<T, Unexpected<T>> get copyWith;
}
