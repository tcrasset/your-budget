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

// ignore: unused_element
  _LongName<T> longName<T>({@required String failedValue}) {
    return _LongName<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  _EmptyName<T> emptyName<T>({@required String failedValue}) {
    return _EmptyName<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  _InvalidAmount<T> invalidAmount<T>({@required String failedValue}) {
    return _InvalidAmount<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  _TooLargeAmount<T> tooBigAmount<T>({@required String failedValue}) {
    return _TooLargeAmount<T>(
      failedValue: failedValue,
    );
  }

// ignore: unused_element
  _UniqueName<T> uniqueName<T>({@required String failedValue}) {
    return _UniqueName<T>(
      failedValue: failedValue,
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
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $ValueFailureCopyWith<T, $Res> {
  factory $ValueFailureCopyWith(
          ValueFailure<T> value, $Res Function(ValueFailure<T>) then) =
      _$ValueFailureCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  final ValueFailure<T> _value;
  // ignore: unused_field
  final $Res Function(ValueFailure<T>) _then;
}

/// @nodoc
abstract class $InvalidTransactionCopyWith<T, $Res> {
  factory $InvalidTransactionCopyWith(InvalidTransaction<T> value,
          $Res Function(InvalidTransaction<T>) then) =
      _$InvalidTransactionCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class _$InvalidTransactionCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
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
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$InvalidTransaction<T> implements InvalidTransaction<T> {
  const _$InvalidTransaction({@required this.failedValue})
      : assert(failedValue != null);

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
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  $InvalidTransactionCopyWith<T, InvalidTransaction<T>> get copyWith =>
      _$InvalidTransactionCopyWithImpl<T, InvalidTransaction<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return invalidTransaction(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
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
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return invalidTransaction(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
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
  const factory InvalidTransaction({@required String failedValue}) =
      _$InvalidTransaction<T>;

  String get failedValue;
  $InvalidTransactionCopyWith<T, InvalidTransaction<T>> get copyWith;
}

/// @nodoc
abstract class $UnexpectedCopyWith<T, $Res> {
  factory $UnexpectedCopyWith(
          Unexpected<T> value, $Res Function(Unexpected<T>) then) =
      _$UnexpectedCopyWithImpl<T, $Res>;
  $Res call({String message});
}

/// @nodoc
class _$UnexpectedCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements $UnexpectedCopyWith<T, $Res> {
  _$UnexpectedCopyWithImpl(
      Unexpected<T> _value, $Res Function(Unexpected<T>) _then)
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
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(message);

  @override
  $UnexpectedCopyWith<T, Unexpected<T>> get copyWith =>
      _$UnexpectedCopyWithImpl<T, Unexpected<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
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
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
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

/// @nodoc
abstract class _$LongNameCopyWith<T, $Res> {
  factory _$LongNameCopyWith(
          _LongName<T> value, $Res Function(_LongName<T>) then) =
      __$LongNameCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$LongNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$LongNameCopyWith<T, $Res> {
  __$LongNameCopyWithImpl(
      _LongName<T> _value, $Res Function(_LongName<T>) _then)
      : super(_value, (v) => _then(v as _LongName<T>));

  @override
  _LongName<T> get _value => super._value as _LongName<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_LongName<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$_LongName<T> implements _LongName<T> {
  const _$_LongName({@required this.failedValue}) : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.longName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _LongName<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$LongNameCopyWith<T, _LongName<T>> get copyWith =>
      __$LongNameCopyWithImpl<T, _LongName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return longName(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (longName != null) {
      return longName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return longName(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (longName != null) {
      return longName(this);
    }
    return orElse();
  }
}

abstract class _LongName<T> implements ValueFailure<T> {
  const factory _LongName({@required String failedValue}) = _$_LongName<T>;

  String get failedValue;
  _$LongNameCopyWith<T, _LongName<T>> get copyWith;
}

/// @nodoc
abstract class _$EmptyNameCopyWith<T, $Res> {
  factory _$EmptyNameCopyWith(
          _EmptyName<T> value, $Res Function(_EmptyName<T>) then) =
      __$EmptyNameCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$EmptyNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$EmptyNameCopyWith<T, $Res> {
  __$EmptyNameCopyWithImpl(
      _EmptyName<T> _value, $Res Function(_EmptyName<T>) _then)
      : super(_value, (v) => _then(v as _EmptyName<T>));

  @override
  _EmptyName<T> get _value => super._value as _EmptyName<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_EmptyName<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$_EmptyName<T> implements _EmptyName<T> {
  const _$_EmptyName({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.emptyName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _EmptyName<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$EmptyNameCopyWith<T, _EmptyName<T>> get copyWith =>
      __$EmptyNameCopyWithImpl<T, _EmptyName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return emptyName(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyName != null) {
      return emptyName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return emptyName(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emptyName != null) {
      return emptyName(this);
    }
    return orElse();
  }
}

abstract class _EmptyName<T> implements ValueFailure<T> {
  const factory _EmptyName({@required String failedValue}) = _$_EmptyName<T>;

  String get failedValue;
  _$EmptyNameCopyWith<T, _EmptyName<T>> get copyWith;
}

/// @nodoc
abstract class _$InvalidAmountCopyWith<T, $Res> {
  factory _$InvalidAmountCopyWith(
          _InvalidAmount<T> value, $Res Function(_InvalidAmount<T>) then) =
      __$InvalidAmountCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$InvalidAmountCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$InvalidAmountCopyWith<T, $Res> {
  __$InvalidAmountCopyWithImpl(
      _InvalidAmount<T> _value, $Res Function(_InvalidAmount<T>) _then)
      : super(_value, (v) => _then(v as _InvalidAmount<T>));

  @override
  _InvalidAmount<T> get _value => super._value as _InvalidAmount<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_InvalidAmount<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$_InvalidAmount<T> implements _InvalidAmount<T> {
  const _$_InvalidAmount({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.invalidAmount(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _InvalidAmount<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$InvalidAmountCopyWith<T, _InvalidAmount<T>> get copyWith =>
      __$InvalidAmountCopyWithImpl<T, _InvalidAmount<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return invalidAmount(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidAmount != null) {
      return invalidAmount(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return invalidAmount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidAmount != null) {
      return invalidAmount(this);
    }
    return orElse();
  }
}

abstract class _InvalidAmount<T> implements ValueFailure<T> {
  const factory _InvalidAmount({@required String failedValue}) =
      _$_InvalidAmount<T>;

  String get failedValue;
  _$InvalidAmountCopyWith<T, _InvalidAmount<T>> get copyWith;
}

/// @nodoc
abstract class _$TooLargeAmountCopyWith<T, $Res> {
  factory _$TooLargeAmountCopyWith(
          _TooLargeAmount<T> value, $Res Function(_TooLargeAmount<T>) then) =
      __$TooLargeAmountCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$TooLargeAmountCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$TooLargeAmountCopyWith<T, $Res> {
  __$TooLargeAmountCopyWithImpl(
      _TooLargeAmount<T> _value, $Res Function(_TooLargeAmount<T>) _then)
      : super(_value, (v) => _then(v as _TooLargeAmount<T>));

  @override
  _TooLargeAmount<T> get _value => super._value as _TooLargeAmount<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_TooLargeAmount<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$_TooLargeAmount<T> implements _TooLargeAmount<T> {
  const _$_TooLargeAmount({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.tooBigAmount(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TooLargeAmount<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$TooLargeAmountCopyWith<T, _TooLargeAmount<T>> get copyWith =>
      __$TooLargeAmountCopyWithImpl<T, _TooLargeAmount<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return tooBigAmount(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tooBigAmount != null) {
      return tooBigAmount(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return tooBigAmount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (tooBigAmount != null) {
      return tooBigAmount(this);
    }
    return orElse();
  }
}

abstract class _TooLargeAmount<T> implements ValueFailure<T> {
  const factory _TooLargeAmount({@required String failedValue}) =
      _$_TooLargeAmount<T>;

  String get failedValue;
  _$TooLargeAmountCopyWith<T, _TooLargeAmount<T>> get copyWith;
}

/// @nodoc
abstract class _$UniqueNameCopyWith<T, $Res> {
  factory _$UniqueNameCopyWith(
          _UniqueName<T> value, $Res Function(_UniqueName<T>) then) =
      __$UniqueNameCopyWithImpl<T, $Res>;
  $Res call({String failedValue});
}

/// @nodoc
class __$UniqueNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res>
    implements _$UniqueNameCopyWith<T, $Res> {
  __$UniqueNameCopyWithImpl(
      _UniqueName<T> _value, $Res Function(_UniqueName<T>) _then)
      : super(_value, (v) => _then(v as _UniqueName<T>));

  @override
  _UniqueName<T> get _value => super._value as _UniqueName<T>;

  @override
  $Res call({
    Object failedValue = freezed,
  }) {
    return _then(_UniqueName<T>(
      failedValue:
          failedValue == freezed ? _value.failedValue : failedValue as String,
    ));
  }
}

/// @nodoc
class _$_UniqueName<T> implements _UniqueName<T> {
  const _$_UniqueName({@required this.failedValue})
      : assert(failedValue != null);

  @override
  final String failedValue;

  @override
  String toString() {
    return 'ValueFailure<$T>.uniqueName(failedValue: $failedValue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UniqueName<T> &&
            (identical(other.failedValue, failedValue) ||
                const DeepCollectionEquality()
                    .equals(other.failedValue, failedValue)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failedValue);

  @override
  _$UniqueNameCopyWith<T, _UniqueName<T>> get copyWith =>
      __$UniqueNameCopyWithImpl<T, _UniqueName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result invalidTransaction(String failedValue),
    @required Result unexpected(String message),
    @required Result longName(String failedValue),
    @required Result emptyName(String failedValue),
    @required Result invalidAmount(String failedValue),
    @required Result tooBigAmount(String failedValue),
    @required Result uniqueName(String failedValue),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return uniqueName(failedValue);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result invalidTransaction(String failedValue),
    Result unexpected(String message),
    Result longName(String failedValue),
    Result emptyName(String failedValue),
    Result invalidAmount(String failedValue),
    Result tooBigAmount(String failedValue),
    Result uniqueName(String failedValue),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uniqueName != null) {
      return uniqueName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result invalidTransaction(InvalidTransaction<T> value),
    @required Result unexpected(Unexpected<T> value),
    @required Result longName(_LongName<T> value),
    @required Result emptyName(_EmptyName<T> value),
    @required Result invalidAmount(_InvalidAmount<T> value),
    @required Result tooBigAmount(_TooLargeAmount<T> value),
    @required Result uniqueName(_UniqueName<T> value),
  }) {
    assert(invalidTransaction != null);
    assert(unexpected != null);
    assert(longName != null);
    assert(emptyName != null);
    assert(invalidAmount != null);
    assert(tooBigAmount != null);
    assert(uniqueName != null);
    return uniqueName(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result invalidTransaction(InvalidTransaction<T> value),
    Result unexpected(Unexpected<T> value),
    Result longName(_LongName<T> value),
    Result emptyName(_EmptyName<T> value),
    Result invalidAmount(_InvalidAmount<T> value),
    Result tooBigAmount(_TooLargeAmount<T> value),
    Result uniqueName(_UniqueName<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (uniqueName != null) {
      return uniqueName(this);
    }
    return orElse();
  }
}

abstract class _UniqueName<T> implements ValueFailure<T> {
  const factory _UniqueName({@required String failedValue}) = _$_UniqueName<T>;

  String get failedValue;
  _$UniqueNameCopyWith<T, _UniqueName<T>> get copyWith;
}
