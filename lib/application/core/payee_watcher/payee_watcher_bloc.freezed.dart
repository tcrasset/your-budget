// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payee_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PayeeWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchPayeesStarted,
    required TResult Function(Either<ValueFailure, List<Payee>> failureOrPayees)
        payeesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchPayeesStarted,
    TResult? Function(Either<ValueFailure, List<Payee>> failureOrPayees)?
        payeesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchPayeesStarted,
    TResult Function(Either<ValueFailure, List<Payee>> failureOrPayees)?
        payeesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PayeeWatchStarted value) watchPayeesStarted,
    required TResult Function(_PayeesReceived value) payeesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PayeeWatchStarted value)? watchPayeesStarted,
    TResult? Function(_PayeesReceived value)? payeesReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PayeeWatchStarted value)? watchPayeesStarted,
    TResult Function(_PayeesReceived value)? payeesReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayeeWatcherEventCopyWith<$Res> {
  factory $PayeeWatcherEventCopyWith(
          PayeeWatcherEvent value, $Res Function(PayeeWatcherEvent) then) =
      _$PayeeWatcherEventCopyWithImpl<$Res, PayeeWatcherEvent>;
}

/// @nodoc
class _$PayeeWatcherEventCopyWithImpl<$Res, $Val extends PayeeWatcherEvent>
    implements $PayeeWatcherEventCopyWith<$Res> {
  _$PayeeWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_PayeeWatchStartedCopyWith<$Res> {
  factory _$$_PayeeWatchStartedCopyWith(_$_PayeeWatchStarted value,
          $Res Function(_$_PayeeWatchStarted) then) =
      __$$_PayeeWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_PayeeWatchStartedCopyWithImpl<$Res>
    extends _$PayeeWatcherEventCopyWithImpl<$Res, _$_PayeeWatchStarted>
    implements _$$_PayeeWatchStartedCopyWith<$Res> {
  __$$_PayeeWatchStartedCopyWithImpl(
      _$_PayeeWatchStarted _value, $Res Function(_$_PayeeWatchStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_PayeeWatchStarted implements _PayeeWatchStarted {
  const _$_PayeeWatchStarted();

  @override
  String toString() {
    return 'PayeeWatcherEvent.watchPayeesStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_PayeeWatchStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchPayeesStarted,
    required TResult Function(Either<ValueFailure, List<Payee>> failureOrPayees)
        payeesReceived,
  }) {
    return watchPayeesStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchPayeesStarted,
    TResult? Function(Either<ValueFailure, List<Payee>> failureOrPayees)?
        payeesReceived,
  }) {
    return watchPayeesStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchPayeesStarted,
    TResult Function(Either<ValueFailure, List<Payee>> failureOrPayees)?
        payeesReceived,
    required TResult orElse(),
  }) {
    if (watchPayeesStarted != null) {
      return watchPayeesStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PayeeWatchStarted value) watchPayeesStarted,
    required TResult Function(_PayeesReceived value) payeesReceived,
  }) {
    return watchPayeesStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PayeeWatchStarted value)? watchPayeesStarted,
    TResult? Function(_PayeesReceived value)? payeesReceived,
  }) {
    return watchPayeesStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PayeeWatchStarted value)? watchPayeesStarted,
    TResult Function(_PayeesReceived value)? payeesReceived,
    required TResult orElse(),
  }) {
    if (watchPayeesStarted != null) {
      return watchPayeesStarted(this);
    }
    return orElse();
  }
}

abstract class _PayeeWatchStarted implements PayeeWatcherEvent {
  const factory _PayeeWatchStarted() = _$_PayeeWatchStarted;
}

/// @nodoc
abstract class _$$_PayeesReceivedCopyWith<$Res> {
  factory _$$_PayeesReceivedCopyWith(
          _$_PayeesReceived value, $Res Function(_$_PayeesReceived) then) =
      __$$_PayeesReceivedCopyWithImpl<$Res>;
  @useResult
  $Res call({Either<ValueFailure, List<Payee>> failureOrPayees});
}

/// @nodoc
class __$$_PayeesReceivedCopyWithImpl<$Res>
    extends _$PayeeWatcherEventCopyWithImpl<$Res, _$_PayeesReceived>
    implements _$$_PayeesReceivedCopyWith<$Res> {
  __$$_PayeesReceivedCopyWithImpl(
      _$_PayeesReceived _value, $Res Function(_$_PayeesReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrPayees = null,
  }) {
    return _then(_$_PayeesReceived(
      null == failureOrPayees
          ? _value.failureOrPayees
          : failureOrPayees // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure, List<Payee>>,
    ));
  }
}

/// @nodoc

class _$_PayeesReceived implements _PayeesReceived {
  const _$_PayeesReceived(this.failureOrPayees);

  @override
  final Either<ValueFailure, List<Payee>> failureOrPayees;

  @override
  String toString() {
    return 'PayeeWatcherEvent.payeesReceived(failureOrPayees: $failureOrPayees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PayeesReceived &&
            (identical(other.failureOrPayees, failureOrPayees) ||
                other.failureOrPayees == failureOrPayees));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrPayees);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PayeesReceivedCopyWith<_$_PayeesReceived> get copyWith =>
      __$$_PayeesReceivedCopyWithImpl<_$_PayeesReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchPayeesStarted,
    required TResult Function(Either<ValueFailure, List<Payee>> failureOrPayees)
        payeesReceived,
  }) {
    return payeesReceived(failureOrPayees);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchPayeesStarted,
    TResult? Function(Either<ValueFailure, List<Payee>> failureOrPayees)?
        payeesReceived,
  }) {
    return payeesReceived?.call(failureOrPayees);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchPayeesStarted,
    TResult Function(Either<ValueFailure, List<Payee>> failureOrPayees)?
        payeesReceived,
    required TResult orElse(),
  }) {
    if (payeesReceived != null) {
      return payeesReceived(failureOrPayees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_PayeeWatchStarted value) watchPayeesStarted,
    required TResult Function(_PayeesReceived value) payeesReceived,
  }) {
    return payeesReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_PayeeWatchStarted value)? watchPayeesStarted,
    TResult? Function(_PayeesReceived value)? payeesReceived,
  }) {
    return payeesReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_PayeeWatchStarted value)? watchPayeesStarted,
    TResult Function(_PayeesReceived value)? payeesReceived,
    required TResult orElse(),
  }) {
    if (payeesReceived != null) {
      return payeesReceived(this);
    }
    return orElse();
  }
}

abstract class _PayeesReceived implements PayeeWatcherEvent {
  const factory _PayeesReceived(
          final Either<ValueFailure, List<Payee>> failureOrPayees) =
      _$_PayeesReceived;

  Either<ValueFailure, List<Payee>> get failureOrPayees;
  @JsonKey(ignore: true)
  _$$_PayeesReceivedCopyWith<_$_PayeesReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PayeeWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Payee> payees) loadSuccess,
    required TResult Function(ValueFailure<dynamic> payeeFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Payee> payees)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Payee> payees)? loadSuccess,
    TResult Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PayeeLoadSuccess value) loadSuccess,
    required TResult Function(_PayeeLoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult? Function(_PayeeLoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult Function(_PayeeLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayeeWatcherStateCopyWith<$Res> {
  factory $PayeeWatcherStateCopyWith(
          PayeeWatcherState value, $Res Function(PayeeWatcherState) then) =
      _$PayeeWatcherStateCopyWithImpl<$Res, PayeeWatcherState>;
}

/// @nodoc
class _$PayeeWatcherStateCopyWithImpl<$Res, $Val extends PayeeWatcherState>
    implements $PayeeWatcherStateCopyWith<$Res> {
  _$PayeeWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$PayeeWatcherStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'PayeeWatcherState.initial()';
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
    required TResult Function(List<Payee> payees) loadSuccess,
    required TResult Function(ValueFailure<dynamic> payeeFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Payee> payees)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Payee> payees)? loadSuccess,
    TResult Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
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
    required TResult Function(_PayeeLoadSuccess value) loadSuccess,
    required TResult Function(_PayeeLoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult? Function(_PayeeLoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult Function(_PayeeLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements PayeeWatcherState {
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
    extends _$PayeeWatcherStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'PayeeWatcherState.loading()';
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
    required TResult Function(List<Payee> payees) loadSuccess,
    required TResult Function(ValueFailure<dynamic> payeeFailure) loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Payee> payees)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Payee> payees)? loadSuccess,
    TResult Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
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
    required TResult Function(_PayeeLoadSuccess value) loadSuccess,
    required TResult Function(_PayeeLoadFailure value) loadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult? Function(_PayeeLoadFailure value)? loadFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult Function(_PayeeLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PayeeWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_PayeeLoadSuccessCopyWith<$Res> {
  factory _$$_PayeeLoadSuccessCopyWith(
          _$_PayeeLoadSuccess value, $Res Function(_$_PayeeLoadSuccess) then) =
      __$$_PayeeLoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Payee> payees});
}

/// @nodoc
class __$$_PayeeLoadSuccessCopyWithImpl<$Res>
    extends _$PayeeWatcherStateCopyWithImpl<$Res, _$_PayeeLoadSuccess>
    implements _$$_PayeeLoadSuccessCopyWith<$Res> {
  __$$_PayeeLoadSuccessCopyWithImpl(
      _$_PayeeLoadSuccess _value, $Res Function(_$_PayeeLoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payees = null,
  }) {
    return _then(_$_PayeeLoadSuccess(
      null == payees
          ? _value._payees
          : payees // ignore: cast_nullable_to_non_nullable
              as List<Payee>,
    ));
  }
}

/// @nodoc

class _$_PayeeLoadSuccess implements _PayeeLoadSuccess {
  const _$_PayeeLoadSuccess(final List<Payee> payees) : _payees = payees;

  final List<Payee> _payees;
  @override
  List<Payee> get payees {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_payees);
  }

  @override
  String toString() {
    return 'PayeeWatcherState.loadSuccess(payees: $payees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PayeeLoadSuccess &&
            const DeepCollectionEquality().equals(other._payees, _payees));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_payees));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PayeeLoadSuccessCopyWith<_$_PayeeLoadSuccess> get copyWith =>
      __$$_PayeeLoadSuccessCopyWithImpl<_$_PayeeLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Payee> payees) loadSuccess,
    required TResult Function(ValueFailure<dynamic> payeeFailure) loadFailure,
  }) {
    return loadSuccess(payees);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Payee> payees)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
  }) {
    return loadSuccess?.call(payees);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Payee> payees)? loadSuccess,
    TResult Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(payees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PayeeLoadSuccess value) loadSuccess,
    required TResult Function(_PayeeLoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult? Function(_PayeeLoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult Function(_PayeeLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _PayeeLoadSuccess implements PayeeWatcherState {
  const factory _PayeeLoadSuccess(final List<Payee> payees) =
      _$_PayeeLoadSuccess;

  List<Payee> get payees;
  @JsonKey(ignore: true)
  _$$_PayeeLoadSuccessCopyWith<_$_PayeeLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_PayeeLoadFailureCopyWith<$Res> {
  factory _$$_PayeeLoadFailureCopyWith(
          _$_PayeeLoadFailure value, $Res Function(_$_PayeeLoadFailure) then) =
      __$$_PayeeLoadFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({ValueFailure<dynamic> payeeFailure});

  $ValueFailureCopyWith<dynamic, $Res> get payeeFailure;
}

/// @nodoc
class __$$_PayeeLoadFailureCopyWithImpl<$Res>
    extends _$PayeeWatcherStateCopyWithImpl<$Res, _$_PayeeLoadFailure>
    implements _$$_PayeeLoadFailureCopyWith<$Res> {
  __$$_PayeeLoadFailureCopyWithImpl(
      _$_PayeeLoadFailure _value, $Res Function(_$_PayeeLoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payeeFailure = null,
  }) {
    return _then(_$_PayeeLoadFailure(
      null == payeeFailure
          ? _value.payeeFailure
          : payeeFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ValueFailureCopyWith<dynamic, $Res> get payeeFailure {
    return $ValueFailureCopyWith<dynamic, $Res>(_value.payeeFailure, (value) {
      return _then(_value.copyWith(payeeFailure: value));
    });
  }
}

/// @nodoc

class _$_PayeeLoadFailure implements _PayeeLoadFailure {
  const _$_PayeeLoadFailure(this.payeeFailure);

  @override
  final ValueFailure<dynamic> payeeFailure;

  @override
  String toString() {
    return 'PayeeWatcherState.loadFailure(payeeFailure: $payeeFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PayeeLoadFailure &&
            (identical(other.payeeFailure, payeeFailure) ||
                other.payeeFailure == payeeFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payeeFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PayeeLoadFailureCopyWith<_$_PayeeLoadFailure> get copyWith =>
      __$$_PayeeLoadFailureCopyWithImpl<_$_PayeeLoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Payee> payees) loadSuccess,
    required TResult Function(ValueFailure<dynamic> payeeFailure) loadFailure,
  }) {
    return loadFailure(payeeFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Payee> payees)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
  }) {
    return loadFailure?.call(payeeFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Payee> payees)? loadSuccess,
    TResult Function(ValueFailure<dynamic> payeeFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(payeeFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_PayeeLoadSuccess value) loadSuccess,
    required TResult Function(_PayeeLoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult? Function(_PayeeLoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_PayeeLoadSuccess value)? loadSuccess,
    TResult Function(_PayeeLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _PayeeLoadFailure implements PayeeWatcherState {
  const factory _PayeeLoadFailure(final ValueFailure<dynamic> payeeFailure) =
      _$_PayeeLoadFailure;

  ValueFailure<dynamic> get payeeFailure;
  @JsonKey(ignore: true)
  _$$_PayeeLoadFailureCopyWith<_$_PayeeLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
