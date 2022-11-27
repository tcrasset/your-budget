// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budgetvalue_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetValueWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) watchBudgetValuesStarted,
    required TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)
        budgetvaluesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? watchBudgetValuesStarted,
    TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)?
        budgetvaluesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? watchBudgetValuesStarted,
    TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)?
        budgetvaluesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BudgetValueWatchStarted value)
        watchBudgetValuesStarted,
    required TResult Function(_BudgetValuesReceived value) budgetvaluesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BudgetValueWatchStarted value)? watchBudgetValuesStarted,
    TResult Function(_BudgetValuesReceived value)? budgetvaluesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BudgetValueWatchStarted value)? watchBudgetValuesStarted,
    TResult Function(_BudgetValuesReceived value)? budgetvaluesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetValueWatcherEventCopyWith<$Res> {
  factory $BudgetValueWatcherEventCopyWith(BudgetValueWatcherEvent value,
          $Res Function(BudgetValueWatcherEvent) then) =
      _$BudgetValueWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$BudgetValueWatcherEventCopyWithImpl<$Res>
    implements $BudgetValueWatcherEventCopyWith<$Res> {
  _$BudgetValueWatcherEventCopyWithImpl(this._value, this._then);

  final BudgetValueWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(BudgetValueWatcherEvent) _then;
}

/// @nodoc
abstract class _$$_BudgetValueWatchStartedCopyWith<$Res> {
  factory _$$_BudgetValueWatchStartedCopyWith(_$_BudgetValueWatchStarted value,
          $Res Function(_$_BudgetValueWatchStarted) then) =
      __$$_BudgetValueWatchStartedCopyWithImpl<$Res>;
  $Res call({DateTime date});
}

/// @nodoc
class __$$_BudgetValueWatchStartedCopyWithImpl<$Res>
    extends _$BudgetValueWatcherEventCopyWithImpl<$Res>
    implements _$$_BudgetValueWatchStartedCopyWith<$Res> {
  __$$_BudgetValueWatchStartedCopyWithImpl(_$_BudgetValueWatchStarted _value,
      $Res Function(_$_BudgetValueWatchStarted) _then)
      : super(_value, (v) => _then(v as _$_BudgetValueWatchStarted));

  @override
  _$_BudgetValueWatchStarted get _value =>
      super._value as _$_BudgetValueWatchStarted;

  @override
  $Res call({
    Object? date = freezed,
  }) {
    return _then(_$_BudgetValueWatchStarted(
      date == freezed
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_BudgetValueWatchStarted implements _BudgetValueWatchStarted {
  const _$_BudgetValueWatchStarted(this.date);

  @override
  final DateTime date;

  @override
  String toString() {
    return 'BudgetValueWatcherEvent.watchBudgetValuesStarted(date: $date)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetValueWatchStarted &&
            const DeepCollectionEquality().equals(other.date, date));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(date));

  @JsonKey(ignore: true)
  @override
  _$$_BudgetValueWatchStartedCopyWith<_$_BudgetValueWatchStarted>
      get copyWith =>
          __$$_BudgetValueWatchStartedCopyWithImpl<_$_BudgetValueWatchStarted>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) watchBudgetValuesStarted,
    required TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)
        budgetvaluesReceived,
  }) {
    return watchBudgetValuesStarted(date);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? watchBudgetValuesStarted,
    TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)?
        budgetvaluesReceived,
  }) {
    return watchBudgetValuesStarted?.call(date);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? watchBudgetValuesStarted,
    TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)?
        budgetvaluesReceived,
    required TResult orElse(),
  }) {
    if (watchBudgetValuesStarted != null) {
      return watchBudgetValuesStarted(date);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BudgetValueWatchStarted value)
        watchBudgetValuesStarted,
    required TResult Function(_BudgetValuesReceived value) budgetvaluesReceived,
  }) {
    return watchBudgetValuesStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BudgetValueWatchStarted value)? watchBudgetValuesStarted,
    TResult Function(_BudgetValuesReceived value)? budgetvaluesReceived,
  }) {
    return watchBudgetValuesStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BudgetValueWatchStarted value)? watchBudgetValuesStarted,
    TResult Function(_BudgetValuesReceived value)? budgetvaluesReceived,
    required TResult orElse(),
  }) {
    if (watchBudgetValuesStarted != null) {
      return watchBudgetValuesStarted(this);
    }
    return orElse();
  }
}

abstract class _BudgetValueWatchStarted implements BudgetValueWatcherEvent {
  const factory _BudgetValueWatchStarted(final DateTime date) =
      _$_BudgetValueWatchStarted;

  DateTime get date;
  @JsonKey(ignore: true)
  _$$_BudgetValueWatchStartedCopyWith<_$_BudgetValueWatchStarted>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BudgetValuesReceivedCopyWith<$Res> {
  factory _$$_BudgetValuesReceivedCopyWith(_$_BudgetValuesReceived value,
          $Res Function(_$_BudgetValuesReceived) then) =
      __$$_BudgetValuesReceivedCopyWithImpl<$Res>;
  $Res call({Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues});
}

/// @nodoc
class __$$_BudgetValuesReceivedCopyWithImpl<$Res>
    extends _$BudgetValueWatcherEventCopyWithImpl<$Res>
    implements _$$_BudgetValuesReceivedCopyWith<$Res> {
  __$$_BudgetValuesReceivedCopyWithImpl(_$_BudgetValuesReceived _value,
      $Res Function(_$_BudgetValuesReceived) _then)
      : super(_value, (v) => _then(v as _$_BudgetValuesReceived));

  @override
  _$_BudgetValuesReceived get _value => super._value as _$_BudgetValuesReceived;

  @override
  $Res call({
    Object? failureOrBudgetvalues = freezed,
  }) {
    return _then(_$_BudgetValuesReceived(
      failureOrBudgetvalues == freezed
          ? _value.failureOrBudgetvalues
          : failureOrBudgetvalues // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure, List<BudgetValue>>,
    ));
  }
}

/// @nodoc

class _$_BudgetValuesReceived implements _BudgetValuesReceived {
  const _$_BudgetValuesReceived(this.failureOrBudgetvalues);

  @override
  final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues;

  @override
  String toString() {
    return 'BudgetValueWatcherEvent.budgetvaluesReceived(failureOrBudgetvalues: $failureOrBudgetvalues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetValuesReceived &&
            const DeepCollectionEquality()
                .equals(other.failureOrBudgetvalues, failureOrBudgetvalues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureOrBudgetvalues));

  @JsonKey(ignore: true)
  @override
  _$$_BudgetValuesReceivedCopyWith<_$_BudgetValuesReceived> get copyWith =>
      __$$_BudgetValuesReceivedCopyWithImpl<_$_BudgetValuesReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(DateTime date) watchBudgetValuesStarted,
    required TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)
        budgetvaluesReceived,
  }) {
    return budgetvaluesReceived(failureOrBudgetvalues);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(DateTime date)? watchBudgetValuesStarted,
    TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)?
        budgetvaluesReceived,
  }) {
    return budgetvaluesReceived?.call(failureOrBudgetvalues);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(DateTime date)? watchBudgetValuesStarted,
    TResult Function(
            Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues)?
        budgetvaluesReceived,
    required TResult orElse(),
  }) {
    if (budgetvaluesReceived != null) {
      return budgetvaluesReceived(failureOrBudgetvalues);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_BudgetValueWatchStarted value)
        watchBudgetValuesStarted,
    required TResult Function(_BudgetValuesReceived value) budgetvaluesReceived,
  }) {
    return budgetvaluesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_BudgetValueWatchStarted value)? watchBudgetValuesStarted,
    TResult Function(_BudgetValuesReceived value)? budgetvaluesReceived,
  }) {
    return budgetvaluesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_BudgetValueWatchStarted value)? watchBudgetValuesStarted,
    TResult Function(_BudgetValuesReceived value)? budgetvaluesReceived,
    required TResult orElse(),
  }) {
    if (budgetvaluesReceived != null) {
      return budgetvaluesReceived(this);
    }
    return orElse();
  }
}

abstract class _BudgetValuesReceived implements BudgetValueWatcherEvent {
  const factory _BudgetValuesReceived(
          final Either<ValueFailure, List<BudgetValue>> failureOrBudgetvalues) =
      _$_BudgetValuesReceived;

  Either<ValueFailure, List<BudgetValue>> get failureOrBudgetvalues;
  @JsonKey(ignore: true)
  _$$_BudgetValuesReceivedCopyWith<_$_BudgetValuesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetValueWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BudgetValue> budgetvalues) loadSuccess,
    required TResult Function(ValueFailure<dynamic> budgetvalueFailure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BudgetValueLoadSuccess value) loadSuccess,
    required TResult Function(_BudgetValueLoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetValueWatcherStateCopyWith<$Res> {
  factory $BudgetValueWatcherStateCopyWith(BudgetValueWatcherState value,
          $Res Function(BudgetValueWatcherState) then) =
      _$BudgetValueWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BudgetValueWatcherStateCopyWithImpl<$Res>
    implements $BudgetValueWatcherStateCopyWith<$Res> {
  _$BudgetValueWatcherStateCopyWithImpl(this._value, this._then);

  final BudgetValueWatcherState _value;
  // ignore: unused_field
  final $Res Function(BudgetValueWatcherState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$BudgetValueWatcherStateCopyWithImpl<$Res>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, (v) => _then(v as _$_Initial));

  @override
  _$_Initial get _value => super._value as _$_Initial;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'BudgetValueWatcherState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BudgetValue> budgetvalues) loadSuccess,
    required TResult Function(ValueFailure<dynamic> budgetvalueFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BudgetValueLoadSuccess value) loadSuccess,
    required TResult Function(_BudgetValueLoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements BudgetValueWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$BudgetValueWatcherStateCopyWithImpl<$Res>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, (v) => _then(v as _$_Loading));

  @override
  _$_Loading get _value => super._value as _$_Loading;
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'BudgetValueWatcherState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BudgetValue> budgetvalues) loadSuccess,
    required TResult Function(ValueFailure<dynamic> budgetvalueFailure)
        loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BudgetValueLoadSuccess value) loadSuccess,
    required TResult Function(_BudgetValueLoadFailure value) loadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements BudgetValueWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_BudgetValueLoadSuccessCopyWith<$Res> {
  factory _$$_BudgetValueLoadSuccessCopyWith(_$_BudgetValueLoadSuccess value,
          $Res Function(_$_BudgetValueLoadSuccess) then) =
      __$$_BudgetValueLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<BudgetValue> budgetvalues});
}

/// @nodoc
class __$$_BudgetValueLoadSuccessCopyWithImpl<$Res>
    extends _$BudgetValueWatcherStateCopyWithImpl<$Res>
    implements _$$_BudgetValueLoadSuccessCopyWith<$Res> {
  __$$_BudgetValueLoadSuccessCopyWithImpl(_$_BudgetValueLoadSuccess _value,
      $Res Function(_$_BudgetValueLoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_BudgetValueLoadSuccess));

  @override
  _$_BudgetValueLoadSuccess get _value =>
      super._value as _$_BudgetValueLoadSuccess;

  @override
  $Res call({
    Object? budgetvalues = freezed,
  }) {
    return _then(_$_BudgetValueLoadSuccess(
      budgetvalues == freezed
          ? _value._budgetvalues
          : budgetvalues // ignore: cast_nullable_to_non_nullable
              as List<BudgetValue>,
    ));
  }
}

/// @nodoc

class _$_BudgetValueLoadSuccess implements _BudgetValueLoadSuccess {
  const _$_BudgetValueLoadSuccess(final List<BudgetValue> budgetvalues)
      : _budgetvalues = budgetvalues;

  final List<BudgetValue> _budgetvalues;
  @override
  List<BudgetValue> get budgetvalues {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_budgetvalues);
  }

  @override
  String toString() {
    return 'BudgetValueWatcherState.loadSuccess(budgetvalues: $budgetvalues)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetValueLoadSuccess &&
            const DeepCollectionEquality()
                .equals(other._budgetvalues, _budgetvalues));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_budgetvalues));

  @JsonKey(ignore: true)
  @override
  _$$_BudgetValueLoadSuccessCopyWith<_$_BudgetValueLoadSuccess> get copyWith =>
      __$$_BudgetValueLoadSuccessCopyWithImpl<_$_BudgetValueLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BudgetValue> budgetvalues) loadSuccess,
    required TResult Function(ValueFailure<dynamic> budgetvalueFailure)
        loadFailure,
  }) {
    return loadSuccess(budgetvalues);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
  }) {
    return loadSuccess?.call(budgetvalues);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(budgetvalues);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BudgetValueLoadSuccess value) loadSuccess,
    required TResult Function(_BudgetValueLoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _BudgetValueLoadSuccess implements BudgetValueWatcherState {
  const factory _BudgetValueLoadSuccess(final List<BudgetValue> budgetvalues) =
      _$_BudgetValueLoadSuccess;

  List<BudgetValue> get budgetvalues;
  @JsonKey(ignore: true)
  _$$_BudgetValueLoadSuccessCopyWith<_$_BudgetValueLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BudgetValueLoadFailureCopyWith<$Res> {
  factory _$$_BudgetValueLoadFailureCopyWith(_$_BudgetValueLoadFailure value,
          $Res Function(_$_BudgetValueLoadFailure) then) =
      __$$_BudgetValueLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> budgetvalueFailure});

  $ValueFailureCopyWith<dynamic, $Res> get budgetvalueFailure;
}

/// @nodoc
class __$$_BudgetValueLoadFailureCopyWithImpl<$Res>
    extends _$BudgetValueWatcherStateCopyWithImpl<$Res>
    implements _$$_BudgetValueLoadFailureCopyWith<$Res> {
  __$$_BudgetValueLoadFailureCopyWithImpl(_$_BudgetValueLoadFailure _value,
      $Res Function(_$_BudgetValueLoadFailure) _then)
      : super(_value, (v) => _then(v as _$_BudgetValueLoadFailure));

  @override
  _$_BudgetValueLoadFailure get _value =>
      super._value as _$_BudgetValueLoadFailure;

  @override
  $Res call({
    Object? budgetvalueFailure = freezed,
  }) {
    return _then(_$_BudgetValueLoadFailure(
      budgetvalueFailure == freezed
          ? _value.budgetvalueFailure
          : budgetvalueFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get budgetvalueFailure {
    return $ValueFailureCopyWith<dynamic, $Res>(_value.budgetvalueFailure,
        (value) {
      return _then(_value.copyWith(budgetvalueFailure: value));
    });
  }
}

/// @nodoc

class _$_BudgetValueLoadFailure implements _BudgetValueLoadFailure {
  const _$_BudgetValueLoadFailure(this.budgetvalueFailure);

  @override
  final ValueFailure<dynamic> budgetvalueFailure;

  @override
  String toString() {
    return 'BudgetValueWatcherState.loadFailure(budgetvalueFailure: $budgetvalueFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetValueLoadFailure &&
            const DeepCollectionEquality()
                .equals(other.budgetvalueFailure, budgetvalueFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(budgetvalueFailure));

  @JsonKey(ignore: true)
  @override
  _$$_BudgetValueLoadFailureCopyWith<_$_BudgetValueLoadFailure> get copyWith =>
      __$$_BudgetValueLoadFailureCopyWithImpl<_$_BudgetValueLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<BudgetValue> budgetvalues) loadSuccess,
    required TResult Function(ValueFailure<dynamic> budgetvalueFailure)
        loadFailure,
  }) {
    return loadFailure(budgetvalueFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
  }) {
    return loadFailure?.call(budgetvalueFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<BudgetValue> budgetvalues)? loadSuccess,
    TResult Function(ValueFailure<dynamic> budgetvalueFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(budgetvalueFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_BudgetValueLoadSuccess value) loadSuccess,
    required TResult Function(_BudgetValueLoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_BudgetValueLoadSuccess value)? loadSuccess,
    TResult Function(_BudgetValueLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _BudgetValueLoadFailure implements BudgetValueWatcherState {
  const factory _BudgetValueLoadFailure(
          final ValueFailure<dynamic> budgetvalueFailure) =
      _$_BudgetValueLoadFailure;

  ValueFailure<dynamic> get budgetvalueFailure;
  @JsonKey(ignore: true)
  _$$_BudgetValueLoadFailureCopyWith<_$_BudgetValueLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
