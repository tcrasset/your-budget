// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'to_be_budgeted_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ToBeBudgetedEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchToBeBudgetedRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchToBeBudgetedRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchToBeBudgetedRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchToBeBudgetedRequested value)
        watchToBeBudgetedRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchToBeBudgetedRequested value)?
        watchToBeBudgetedRequested,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchToBeBudgetedRequested value)?
        watchToBeBudgetedRequested,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToBeBudgetedEventCopyWith<$Res> {
  factory $ToBeBudgetedEventCopyWith(
          ToBeBudgetedEvent value, $Res Function(ToBeBudgetedEvent) then) =
      _$ToBeBudgetedEventCopyWithImpl<$Res, ToBeBudgetedEvent>;
}

/// @nodoc
class _$ToBeBudgetedEventCopyWithImpl<$Res, $Val extends ToBeBudgetedEvent>
    implements $ToBeBudgetedEventCopyWith<$Res> {
  _$ToBeBudgetedEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$WatchToBeBudgetedRequestedCopyWith<$Res> {
  factory _$$WatchToBeBudgetedRequestedCopyWith(
          _$WatchToBeBudgetedRequested value,
          $Res Function(_$WatchToBeBudgetedRequested) then) =
      __$$WatchToBeBudgetedRequestedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WatchToBeBudgetedRequestedCopyWithImpl<$Res>
    extends _$ToBeBudgetedEventCopyWithImpl<$Res, _$WatchToBeBudgetedRequested>
    implements _$$WatchToBeBudgetedRequestedCopyWith<$Res> {
  __$$WatchToBeBudgetedRequestedCopyWithImpl(
      _$WatchToBeBudgetedRequested _value,
      $Res Function(_$WatchToBeBudgetedRequested) _then)
      : super(_value, _then);
}

/// @nodoc

class _$WatchToBeBudgetedRequested implements WatchToBeBudgetedRequested {
  const _$WatchToBeBudgetedRequested();

  @override
  String toString() {
    return 'ToBeBudgetedEvent.watchToBeBudgetedRequested()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchToBeBudgetedRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchToBeBudgetedRequested,
  }) {
    return watchToBeBudgetedRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchToBeBudgetedRequested,
  }) {
    return watchToBeBudgetedRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchToBeBudgetedRequested,
    required TResult orElse(),
  }) {
    if (watchToBeBudgetedRequested != null) {
      return watchToBeBudgetedRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(WatchToBeBudgetedRequested value)
        watchToBeBudgetedRequested,
  }) {
    return watchToBeBudgetedRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(WatchToBeBudgetedRequested value)?
        watchToBeBudgetedRequested,
  }) {
    return watchToBeBudgetedRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(WatchToBeBudgetedRequested value)?
        watchToBeBudgetedRequested,
    required TResult orElse(),
  }) {
    if (watchToBeBudgetedRequested != null) {
      return watchToBeBudgetedRequested(this);
    }
    return orElse();
  }
}

abstract class WatchToBeBudgetedRequested implements ToBeBudgetedEvent {
  const factory WatchToBeBudgetedRequested() = _$WatchToBeBudgetedRequested;
}

/// @nodoc
mixin _$ToBeBudgetedState {
  Amount get amount => throw _privateConstructorUsedError;
  ToBeBudgetedStatus get status => throw _privateConstructorUsedError;
  ValueFailure<dynamic>? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ToBeBudgetedStateCopyWith<ToBeBudgetedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ToBeBudgetedStateCopyWith<$Res> {
  factory $ToBeBudgetedStateCopyWith(
          ToBeBudgetedState value, $Res Function(ToBeBudgetedState) then) =
      _$ToBeBudgetedStateCopyWithImpl<$Res, ToBeBudgetedState>;
  @useResult
  $Res call(
      {Amount amount, ToBeBudgetedStatus status, ValueFailure<dynamic>? error});

  $ValueFailureCopyWith<dynamic, $Res>? get error;
}

/// @nodoc
class _$ToBeBudgetedStateCopyWithImpl<$Res, $Val extends ToBeBudgetedState>
    implements $ToBeBudgetedStateCopyWith<$Res> {
  _$ToBeBudgetedStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ToBeBudgetedStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ValueFailureCopyWith<dynamic, $Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $ValueFailureCopyWith<dynamic, $Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ToBeBudgetedStateCopyWith<$Res>
    implements $ToBeBudgetedStateCopyWith<$Res> {
  factory _$$_ToBeBudgetedStateCopyWith(_$_ToBeBudgetedState value,
          $Res Function(_$_ToBeBudgetedState) then) =
      __$$_ToBeBudgetedStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Amount amount, ToBeBudgetedStatus status, ValueFailure<dynamic>? error});

  @override
  $ValueFailureCopyWith<dynamic, $Res>? get error;
}

/// @nodoc
class __$$_ToBeBudgetedStateCopyWithImpl<$Res>
    extends _$ToBeBudgetedStateCopyWithImpl<$Res, _$_ToBeBudgetedState>
    implements _$$_ToBeBudgetedStateCopyWith<$Res> {
  __$$_ToBeBudgetedStateCopyWithImpl(
      _$_ToBeBudgetedState _value, $Res Function(_$_ToBeBudgetedState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$_ToBeBudgetedState(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as Amount,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ToBeBudgetedStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>?,
    ));
  }
}

/// @nodoc

class _$_ToBeBudgetedState implements _ToBeBudgetedState {
  const _$_ToBeBudgetedState(
      {required this.amount,
      this.status = ToBeBudgetedStatus.initial,
      this.error});

  @override
  final Amount amount;
  @override
  @JsonKey()
  final ToBeBudgetedStatus status;
  @override
  final ValueFailure<dynamic>? error;

  @override
  String toString() {
    return 'ToBeBudgetedState(amount: $amount, status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToBeBudgetedState &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, amount, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToBeBudgetedStateCopyWith<_$_ToBeBudgetedState> get copyWith =>
      __$$_ToBeBudgetedStateCopyWithImpl<_$_ToBeBudgetedState>(
          this, _$identity);
}

abstract class _ToBeBudgetedState implements ToBeBudgetedState {
  const factory _ToBeBudgetedState(
      {required final Amount amount,
      final ToBeBudgetedStatus status,
      final ValueFailure<dynamic>? error}) = _$_ToBeBudgetedState;

  @override
  Amount get amount;
  @override
  ToBeBudgetedStatus get status;
  @override
  ValueFailure<dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_ToBeBudgetedStateCopyWith<_$_ToBeBudgetedState> get copyWith =>
      throw _privateConstructorUsedError;
}
