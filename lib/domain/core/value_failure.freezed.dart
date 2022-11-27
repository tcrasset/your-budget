// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'value_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
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
      _$ValueFailureCopyWithImpl<T, $Res, ValueFailure<T>>;
}

/// @nodoc
class _$ValueFailureCopyWithImpl<T, $Res, $Val extends ValueFailure<T>>
    implements $ValueFailureCopyWith<T, $Res> {
  _$ValueFailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InvalidTransactionCopyWith<T, $Res> {
  factory _$$InvalidTransactionCopyWith(_$InvalidTransaction<T> value,
          $Res Function(_$InvalidTransaction<T>) then) =
      __$$InvalidTransactionCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$InvalidTransactionCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$InvalidTransaction<T>>
    implements _$$InvalidTransactionCopyWith<T, $Res> {
  __$$InvalidTransactionCopyWithImpl(_$InvalidTransaction<T> _value,
      $Res Function(_$InvalidTransaction<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$InvalidTransaction<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$InvalidTransaction<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidTransactionCopyWith<T, _$InvalidTransaction<T>> get copyWith =>
      __$$InvalidTransactionCopyWithImpl<T, _$InvalidTransaction<T>>(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
  }) {
    return invalidTransaction?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
  }) {
    return invalidTransaction?.call(this);
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
  const factory InvalidTransaction({required final String failedValue}) =
      _$InvalidTransaction<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$InvalidTransactionCopyWith<T, _$InvalidTransaction<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnexpectedCopyWith<T, $Res> {
  factory _$$UnexpectedCopyWith(
          _$Unexpected<T> value, $Res Function(_$Unexpected<T>) then) =
      __$$UnexpectedCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnexpectedCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$Unexpected<T>>
    implements _$$UnexpectedCopyWith<T, $Res> {
  __$$UnexpectedCopyWithImpl(
      _$Unexpected<T> _value, $Res Function(_$Unexpected<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$Unexpected<T>(
      message: null == message
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
        (other.runtimeType == runtimeType &&
            other is _$Unexpected<T> &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UnexpectedCopyWith<T, _$Unexpected<T>> get copyWith =>
      __$$UnexpectedCopyWithImpl<T, _$Unexpected<T>>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
  }) {
    return unexpected?.call(message);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
  }) {
    return unexpected?.call(this);
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
  const factory Unexpected({required final String message}) = _$Unexpected<T>;

  String get message;
  @JsonKey(ignore: true)
  _$$UnexpectedCopyWith<T, _$Unexpected<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LongNameCopyWith<T, $Res> {
  factory _$$_LongNameCopyWith(
          _$_LongName<T> value, $Res Function(_$_LongName<T>) then) =
      __$$_LongNameCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$_LongNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_LongName<T>>
    implements _$$_LongNameCopyWith<T, $Res> {
  __$$_LongNameCopyWithImpl(
      _$_LongName<T> _value, $Res Function(_$_LongName<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$_LongName<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$_LongName<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LongNameCopyWith<T, _$_LongName<T>> get copyWith =>
      __$$_LongNameCopyWithImpl<T, _$_LongName<T>>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
  }) {
    return longName?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
  }) {
    return longName?.call(this);
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
  const factory _LongName({required final String failedValue}) = _$_LongName<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$_LongNameCopyWith<T, _$_LongName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_EmptyNameCopyWith<T, $Res> {
  factory _$$_EmptyNameCopyWith(
          _$_EmptyName<T> value, $Res Function(_$_EmptyName<T>) then) =
      __$$_EmptyNameCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$_EmptyNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_EmptyName<T>>
    implements _$$_EmptyNameCopyWith<T, $Res> {
  __$$_EmptyNameCopyWithImpl(
      _$_EmptyName<T> _value, $Res Function(_$_EmptyName<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$_EmptyName<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$_EmptyName<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmptyNameCopyWith<T, _$_EmptyName<T>> get copyWith =>
      __$$_EmptyNameCopyWithImpl<T, _$_EmptyName<T>>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
  }) {
    return emptyName?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
  }) {
    return emptyName?.call(this);
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
  const factory _EmptyName({required final String failedValue}) =
      _$_EmptyName<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$_EmptyNameCopyWith<T, _$_EmptyName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UniqueNameCopyWith<T, $Res> {
  factory _$$_UniqueNameCopyWith(
          _$_UniqueName<T> value, $Res Function(_$_UniqueName<T>) then) =
      __$$_UniqueNameCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$_UniqueNameCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_UniqueName<T>>
    implements _$$_UniqueNameCopyWith<T, $Res> {
  __$$_UniqueNameCopyWithImpl(
      _$_UniqueName<T> _value, $Res Function(_$_UniqueName<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$_UniqueName<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$_UniqueName<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UniqueNameCopyWith<T, _$_UniqueName<T>> get copyWith =>
      __$$_UniqueNameCopyWithImpl<T, _$_UniqueName<T>>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
  }) {
    return uniqueName?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
  }) {
    return uniqueName?.call(this);
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
  const factory _UniqueName({required final String failedValue}) =
      _$_UniqueName<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$_UniqueNameCopyWith<T, _$_UniqueName<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_InvalidAmountCopyWith<T, $Res> {
  factory _$$_InvalidAmountCopyWith(
          _$_InvalidAmount<T> value, $Res Function(_$_InvalidAmount<T>) then) =
      __$$_InvalidAmountCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$_InvalidAmountCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_InvalidAmount<T>>
    implements _$$_InvalidAmountCopyWith<T, $Res> {
  __$$_InvalidAmountCopyWithImpl(
      _$_InvalidAmount<T> _value, $Res Function(_$_InvalidAmount<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$_InvalidAmount<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$_InvalidAmount<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InvalidAmountCopyWith<T, _$_InvalidAmount<T>> get copyWith =>
      __$$_InvalidAmountCopyWithImpl<T, _$_InvalidAmount<T>>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
  }) {
    return invalidAmount?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
  }) {
    return invalidAmount?.call(this);
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
  const factory _InvalidAmount({required final String failedValue}) =
      _$_InvalidAmount<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$_InvalidAmountCopyWith<T, _$_InvalidAmount<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TooLargeAmountCopyWith<T, $Res> {
  factory _$$_TooLargeAmountCopyWith(_$_TooLargeAmount<T> value,
          $Res Function(_$_TooLargeAmount<T>) then) =
      __$$_TooLargeAmountCopyWithImpl<T, $Res>;
  @useResult
  $Res call({String failedValue});
}

/// @nodoc
class __$$_TooLargeAmountCopyWithImpl<T, $Res>
    extends _$ValueFailureCopyWithImpl<T, $Res, _$_TooLargeAmount<T>>
    implements _$$_TooLargeAmountCopyWith<T, $Res> {
  __$$_TooLargeAmountCopyWithImpl(
      _$_TooLargeAmount<T> _value, $Res Function(_$_TooLargeAmount<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failedValue = null,
  }) {
    return _then(_$_TooLargeAmount<T>(
      failedValue: null == failedValue
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
        (other.runtimeType == runtimeType &&
            other is _$_TooLargeAmount<T> &&
            (identical(other.failedValue, failedValue) ||
                other.failedValue == failedValue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failedValue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TooLargeAmountCopyWith<T, _$_TooLargeAmount<T>> get copyWith =>
      __$$_TooLargeAmountCopyWithImpl<T, _$_TooLargeAmount<T>>(
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
    return tooBigAmount(failedValue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String failedValue)? invalidTransaction,
    TResult? Function(String message)? unexpected,
    TResult? Function(String failedValue)? longName,
    TResult? Function(String failedValue)? emptyName,
    TResult? Function(String failedValue)? uniqueName,
    TResult? Function(String failedValue)? invalidAmount,
    TResult? Function(String failedValue)? tooBigAmount,
  }) {
    return tooBigAmount?.call(failedValue);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(InvalidTransaction<T> value)? invalidTransaction,
    TResult? Function(Unexpected<T> value)? unexpected,
    TResult? Function(_LongName<T> value)? longName,
    TResult? Function(_EmptyName<T> value)? emptyName,
    TResult? Function(_UniqueName<T> value)? uniqueName,
    TResult? Function(_InvalidAmount<T> value)? invalidAmount,
    TResult? Function(_TooLargeAmount<T> value)? tooBigAmount,
  }) {
    return tooBigAmount?.call(this);
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
  const factory _TooLargeAmount({required final String failedValue}) =
      _$_TooLargeAmount<T>;

  String get failedValue;
  @JsonKey(ignore: true)
  _$$_TooLargeAmountCopyWith<T, _$_TooLargeAmount<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
