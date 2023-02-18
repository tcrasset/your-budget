// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budget_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) newBudgetRequested,
    required TResult Function(BudgetValue budgetvalue) budgetValueModified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? newBudgetRequested,
    TResult? Function(BudgetValue budgetvalue)? budgetValueModified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? newBudgetRequested,
    TResult Function(BudgetValue budgetvalue)? budgetValueModified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewBudgetRequested value) newBudgetRequested,
    required TResult Function(BudgetValueModified value) budgetValueModified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewBudgetRequested value)? newBudgetRequested,
    TResult? Function(BudgetValueModified value)? budgetValueModified,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewBudgetRequested value)? newBudgetRequested,
    TResult Function(BudgetValueModified value)? budgetValueModified,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetEventCopyWith<$Res> {
  factory $BudgetEventCopyWith(
          BudgetEvent value, $Res Function(BudgetEvent) then) =
      _$BudgetEventCopyWithImpl<$Res, BudgetEvent>;
}

/// @nodoc
class _$BudgetEventCopyWithImpl<$Res, $Val extends BudgetEvent>
    implements $BudgetEventCopyWith<$Res> {
  _$BudgetEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$NewBudgetRequestedCopyWith<$Res> {
  factory _$$NewBudgetRequestedCopyWith(_$NewBudgetRequested value,
          $Res Function(_$NewBudgetRequested) then) =
      __$$NewBudgetRequestedCopyWithImpl<$Res>;
  @useResult
  $Res call({DateTime date});
}

/// @nodoc
class __$$NewBudgetRequestedCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$NewBudgetRequested>
    implements _$$NewBudgetRequestedCopyWith<$Res> {
  __$$NewBudgetRequestedCopyWithImpl(
      _$NewBudgetRequested _value, $Res Function(_$NewBudgetRequested) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
  }) {
    return _then(_$NewBudgetRequested(
      null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$NewBudgetRequested implements NewBudgetRequested {
  const _$NewBudgetRequested(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'BudgetEvent.newBudgetRequested(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewBudgetRequested &&
            (identical(other.date, date) || other.date == date));
  }

  @override
  int get hashCode => Object.hash(runtimeType, date);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NewBudgetRequestedCopyWith<_$NewBudgetRequested> get copyWith =>
      __$$NewBudgetRequestedCopyWithImpl<_$NewBudgetRequested>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) newBudgetRequested,
    required TResult Function(BudgetValue budgetvalue) budgetValueModified,
  }) {
    return newBudgetRequested(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? newBudgetRequested,
    TResult? Function(BudgetValue budgetvalue)? budgetValueModified,
  }) {
    return newBudgetRequested?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? newBudgetRequested,
    TResult Function(BudgetValue budgetvalue)? budgetValueModified,
    required TResult orElse(),
  }) {
    if (newBudgetRequested != null) {
      return newBudgetRequested(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewBudgetRequested value) newBudgetRequested,
    required TResult Function(BudgetValueModified value) budgetValueModified,
  }) {
    return newBudgetRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewBudgetRequested value)? newBudgetRequested,
    TResult? Function(BudgetValueModified value)? budgetValueModified,
  }) {
    return newBudgetRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewBudgetRequested value)? newBudgetRequested,
    TResult Function(BudgetValueModified value)? budgetValueModified,
    required TResult orElse(),
  }) {
    if (newBudgetRequested != null) {
      return newBudgetRequested(this);
    }
    return orElse();
  }
}

abstract class NewBudgetRequested implements BudgetEvent {
  const factory NewBudgetRequested(final DateTime date) = _$NewBudgetRequested;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$NewBudgetRequestedCopyWith<_$NewBudgetRequested> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BudgetValueModifiedCopyWith<$Res> {
  factory _$$BudgetValueModifiedCopyWith(_$BudgetValueModified value,
          $Res Function(_$BudgetValueModified) then) =
      __$$BudgetValueModifiedCopyWithImpl<$Res>;
  @useResult
  $Res call({BudgetValue budgetvalue});

  $BudgetValueCopyWith<$Res> get budgetvalue;
}

/// @nodoc
class __$$BudgetValueModifiedCopyWithImpl<$Res>
    extends _$BudgetEventCopyWithImpl<$Res, _$BudgetValueModified>
    implements _$$BudgetValueModifiedCopyWith<$Res> {
  __$$BudgetValueModifiedCopyWithImpl(
      _$BudgetValueModified _value, $Res Function(_$BudgetValueModified) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budgetvalue = null,
  }) {
    return _then(_$BudgetValueModified(
      null == budgetvalue
          ? _value.budgetvalue
          : budgetvalue // ignore: cast_nullable_to_non_nullable
              as BudgetValue,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $BudgetValueCopyWith<$Res> get budgetvalue {
    return $BudgetValueCopyWith<$Res>(_value.budgetvalue, (value) {
      return _then(_value.copyWith(budgetvalue: value));
    });
  }
}

/// @nodoc

class _$BudgetValueModified implements BudgetValueModified {
  const _$BudgetValueModified(this.budgetvalue);

  @override
  final BudgetValue budgetvalue;

  @override
  String toString() {
    return 'BudgetEvent.budgetValueModified(budgetvalue: $budgetvalue)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BudgetValueModified &&
            (identical(other.budgetvalue, budgetvalue) ||
                other.budgetvalue == budgetvalue));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budgetvalue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BudgetValueModifiedCopyWith<_$BudgetValueModified> get copyWith =>
      __$$BudgetValueModifiedCopyWithImpl<_$BudgetValueModified>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) newBudgetRequested,
    required TResult Function(BudgetValue budgetvalue) budgetValueModified,
  }) {
    return budgetValueModified(budgetvalue);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(DateTime date)? newBudgetRequested,
    TResult? Function(BudgetValue budgetvalue)? budgetValueModified,
  }) {
    return budgetValueModified?.call(budgetvalue);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? newBudgetRequested,
    TResult Function(BudgetValue budgetvalue)? budgetValueModified,
    required TResult orElse(),
  }) {
    if (budgetValueModified != null) {
      return budgetValueModified(budgetvalue);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NewBudgetRequested value) newBudgetRequested,
    required TResult Function(BudgetValueModified value) budgetValueModified,
  }) {
    return budgetValueModified(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NewBudgetRequested value)? newBudgetRequested,
    TResult? Function(BudgetValueModified value)? budgetValueModified,
  }) {
    return budgetValueModified?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NewBudgetRequested value)? newBudgetRequested,
    TResult Function(BudgetValueModified value)? budgetValueModified,
    required TResult orElse(),
  }) {
    if (budgetValueModified != null) {
      return budgetValueModified(this);
    }
    return orElse();
  }
}

abstract class BudgetValueModified implements BudgetEvent {
  const factory BudgetValueModified(final BudgetValue budgetvalue) =
      _$BudgetValueModified;

  BudgetValue get budgetvalue;
  @JsonKey(ignore: true)
  _$$BudgetValueModifiedCopyWith<_$BudgetValueModified> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetState {
  Budget? get budget => throw _privateConstructorUsedError;
  BudgetOverviewStatus get status => throw _privateConstructorUsedError;
  ValueFailure<dynamic>? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetStateCopyWith<BudgetState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetStateCopyWith<$Res> {
  factory $BudgetStateCopyWith(
          BudgetState value, $Res Function(BudgetState) then) =
      _$BudgetStateCopyWithImpl<$Res, BudgetState>;
  @useResult
  $Res call(
      {Budget? budget,
      BudgetOverviewStatus status,
      ValueFailure<dynamic>? error});

  $ValueFailureCopyWith<dynamic, $Res>? get error;
}

/// @nodoc
class _$BudgetStateCopyWithImpl<$Res, $Val extends BudgetState>
    implements $BudgetStateCopyWith<$Res> {
  _$BudgetStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BudgetOverviewStatus,
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
abstract class _$$_BudgetStateCopyWith<$Res>
    implements $BudgetStateCopyWith<$Res> {
  factory _$$_BudgetStateCopyWith(
          _$_BudgetState value, $Res Function(_$_BudgetState) then) =
      __$$_BudgetStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Budget? budget,
      BudgetOverviewStatus status,
      ValueFailure<dynamic>? error});

  @override
  $ValueFailureCopyWith<dynamic, $Res>? get error;
}

/// @nodoc
class __$$_BudgetStateCopyWithImpl<$Res>
    extends _$BudgetStateCopyWithImpl<$Res, _$_BudgetState>
    implements _$$_BudgetStateCopyWith<$Res> {
  __$$_BudgetStateCopyWithImpl(
      _$_BudgetState _value, $Res Function(_$_BudgetState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? budget = freezed,
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$_BudgetState(
      budget: freezed == budget
          ? _value.budget
          : budget // ignore: cast_nullable_to_non_nullable
              as Budget?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as BudgetOverviewStatus,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>?,
    ));
  }
}

/// @nodoc

class _$_BudgetState implements _BudgetState {
  const _$_BudgetState(
      {this.budget, this.status = BudgetOverviewStatus.initial, this.error});

  @override
  final Budget? budget;
  @override
  @JsonKey()
  final BudgetOverviewStatus status;
  @override
  final ValueFailure<dynamic>? error;

  @override
  String toString() {
    return 'BudgetState(budget: $budget, status: $status, error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetState &&
            (identical(other.budget, budget) || other.budget == budget) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, budget, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetStateCopyWith<_$_BudgetState> get copyWith =>
      __$$_BudgetStateCopyWithImpl<_$_BudgetState>(this, _$identity);
}

abstract class _BudgetState implements BudgetState {
  const factory _BudgetState(
      {final Budget? budget,
      final BudgetOverviewStatus status,
      final ValueFailure<dynamic>? error}) = _$_BudgetState;

  @override
  Budget? get budget;
  @override
  BudgetOverviewStatus get status;
  @override
  ValueFailure<dynamic>? get error;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetStateCopyWith<_$_BudgetState> get copyWith =>
      throw _privateConstructorUsedError;
}
