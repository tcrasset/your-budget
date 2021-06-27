// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ValueFailureTearOff {
  const _$ValueFailureTearOff();

  InvalidTransaction<T> invalidTransaction<T>({required String failedValue}) {
    return InvalidTransaction<T>(
      failedValue: failedValue,
    );
  }

  Unexpected<T> unexpected<T>({required String message}) {
    return Unexpected<T>(
      message: message,
    );
  }

  _LongName<T> longName<T>({required String failedValue}) {
    return _LongName<T>(
      failedValue: failedValue,
    );
  }

  _EmptyName<T> emptyName<T>({required String failedValue}) {
    return _EmptyName<T>(
      failedValue: failedValue,
    );
  }

  _UniqueName<T> uniqueName<T>({required String failedValue}) {
    return _UniqueName<T>(
      failedValue: failedValue,
    );
  }

  _InvalidAmount<T> invalidAmount<T>({required String failedValue}) {
    return _InvalidAmount<T>(
      failedValue: failedValue,
    );
  }

  _TooLargeAmount<T> tooBigAmount<T>({required String failedValue}) {
    return _TooLargeAmount<T>(
      failedValue: failedValue,
    );
  }
}

/// @nodoc
const $ValueFailure = _$ValueFailureTearOff();

/// @nodoc
mixin _$ValueFailure<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
    Object? failedValue = freezed,
  }) {
    return _then(InvalidTransaction<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$InvalidTransaction<T> implements InvalidTransaction<T> {
  const _$InvalidTransaction({required this.failedValue});

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

  @JsonKey(ignore: true)
  @override
  $InvalidTransactionCopyWith<T, InvalidTransaction<T>> get copyWith =>
      _$InvalidTransactionCopyWithImpl<T, InvalidTransaction<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) {
    return invalidTransaction(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (invalidTransaction != null) {
      return invalidTransaction(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) {
    return invalidTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (invalidTransaction != null) {
      return invalidTransaction(this);
    }
    return orElse();
  }
}

abstract class InvalidTransaction<T> implements ValueFailure<T> {
  const factory InvalidTransaction({required String failedValue}) =
      _$InvalidTransaction<T>;

  String get failedValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvalidTransactionCopyWith<T, InvalidTransaction<T>> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? message = freezed,
  }) {
    return _then(Unexpected<T>(
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Unexpected<T> implements Unexpected<T> {
  const _$Unexpected({required this.message});

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

  @JsonKey(ignore: true)
  @override
  $UnexpectedCopyWith<T, Unexpected<T>> get copyWith =>
      _$UnexpectedCopyWithImpl<T, Unexpected<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) {
    return unexpected(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) {
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class Unexpected<T> implements ValueFailure<T> {
  const factory Unexpected({required String message}) = _$Unexpected<T>;

  String get message => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UnexpectedCopyWith<T, Unexpected<T>> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? failedValue = freezed,
  }) {
    return _then(_LongName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LongName<T> implements _LongName<T> {
  const _$_LongName({required this.failedValue});

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

  @JsonKey(ignore: true)
  @override
  _$LongNameCopyWith<T, _LongName<T>> get copyWith =>
      __$LongNameCopyWithImpl<T, _LongName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) {
    return longName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (longName != null) {
      return longName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) {
    return longName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (longName != null) {
      return longName(this);
    }
    return orElse();
  }
}

abstract class _LongName<T> implements ValueFailure<T> {
  const factory _LongName({required String failedValue}) = _$_LongName<T>;

  String get failedValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$LongNameCopyWith<T, _LongName<T>> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? failedValue = freezed,
  }) {
    return _then(_EmptyName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_EmptyName<T> implements _EmptyName<T> {
  const _$_EmptyName({required this.failedValue});

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

  @JsonKey(ignore: true)
  @override
  _$EmptyNameCopyWith<T, _EmptyName<T>> get copyWith =>
      __$EmptyNameCopyWithImpl<T, _EmptyName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) {
    return emptyName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (emptyName != null) {
      return emptyName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) {
    return emptyName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (emptyName != null) {
      return emptyName(this);
    }
    return orElse();
  }
}

abstract class _EmptyName<T> implements ValueFailure<T> {
  const factory _EmptyName({required String failedValue}) = _$_EmptyName<T>;

  String get failedValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$EmptyNameCopyWith<T, _EmptyName<T>> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? failedValue = freezed,
  }) {
    return _then(_UniqueName<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UniqueName<T> implements _UniqueName<T> {
  const _$_UniqueName({required this.failedValue});

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

  @JsonKey(ignore: true)
  @override
  _$UniqueNameCopyWith<T, _UniqueName<T>> get copyWith =>
      __$UniqueNameCopyWithImpl<T, _UniqueName<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) {
    return uniqueName(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (uniqueName != null) {
      return uniqueName(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) {
    return uniqueName(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (uniqueName != null) {
      return uniqueName(this);
    }
    return orElse();
  }
}

abstract class _UniqueName<T> implements ValueFailure<T> {
  const factory _UniqueName({required String failedValue}) = _$_UniqueName<T>;

  String get failedValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$UniqueNameCopyWith<T, _UniqueName<T>> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? failedValue = freezed,
  }) {
    return _then(_InvalidAmount<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_InvalidAmount<T> implements _InvalidAmount<T> {
  const _$_InvalidAmount({required this.failedValue});

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

  @JsonKey(ignore: true)
  @override
  _$InvalidAmountCopyWith<T, _InvalidAmount<T>> get copyWith =>
      __$InvalidAmountCopyWithImpl<T, _InvalidAmount<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) {
    return invalidAmount(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (invalidAmount != null) {
      return invalidAmount(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) {
    return invalidAmount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (invalidAmount != null) {
      return invalidAmount(this);
    }
    return orElse();
  }
}

abstract class _InvalidAmount<T> implements ValueFailure<T> {
  const factory _InvalidAmount({required String failedValue}) =
      _$_InvalidAmount<T>;

  String get failedValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$InvalidAmountCopyWith<T, _InvalidAmount<T>> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? failedValue = freezed,
  }) {
    return _then(_TooLargeAmount<T>(
      failedValue: failedValue == freezed
          ? _value.failedValue
          : failedValue // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TooLargeAmount<T> implements _TooLargeAmount<T> {
  const _$_TooLargeAmount({required this.failedValue});

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

  @JsonKey(ignore: true)
  @override
  _$TooLargeAmountCopyWith<T, _TooLargeAmount<T>> get copyWith =>
      __$TooLargeAmountCopyWithImpl<T, _TooLargeAmount<T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String failedValue) invalidTransaction,
    required TResult Function(String message) unexpected,
    required TResult Function(String failedValue) longName,
    required TResult Function(String failedValue) emptyName,
    required TResult Function(String failedValue) uniqueName,
    required TResult Function(String failedValue) invalidAmount,
    required TResult Function(String failedValue) tooBigAmount,
  }) {
    return tooBigAmount(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String failedValue)? invalidTransaction,
    TResult Function(String message)? unexpected,
    TResult Function(String failedValue)? longName,
    TResult Function(String failedValue)? emptyName,
    TResult Function(String failedValue)? uniqueName,
    TResult Function(String failedValue)? invalidAmount,
    TResult Function(String failedValue)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (tooBigAmount != null) {
      return tooBigAmount(failedValue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidTransaction<T> value) invalidTransaction,
    required TResult Function(Unexpected<T> value) unexpected,
    required TResult Function(_LongName<T> value) longName,
    required TResult Function(_EmptyName<T> value) emptyName,
    required TResult Function(_UniqueName<T> value) uniqueName,
    required TResult Function(_InvalidAmount<T> value) invalidAmount,
    required TResult Function(_TooLargeAmount<T> value) tooBigAmount,
  }) {
    return tooBigAmount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult Function(Unexpected<T> value)? unexpected,
    TResult Function(_LongName<T> value)? longName,
    TResult Function(_EmptyName<T> value)? emptyName,
    TResult Function(_UniqueName<T> value)? uniqueName,
    TResult Function(_InvalidAmount<T> value)? invalidAmount,
    TResult Function(_TooLargeAmount<T> value)? tooBigAmount,
    required TResult orElse(),
  }) {
    if (tooBigAmount != null) {
      return tooBigAmount(this);
    }
    return orElse();
  }
}

abstract class _TooLargeAmount<T> implements ValueFailure<T> {
  const factory _TooLargeAmount({required String failedValue}) =
      _$_TooLargeAmount<T>;

  String get failedValue => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TooLargeAmountCopyWith<T, _TooLargeAmount<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
