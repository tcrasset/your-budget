// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payee_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PayeeWatcherEventTearOff {
  const _$PayeeWatcherEventTearOff();

// ignore: unused_element
  _PayeeWatchStarted watchPayeesStarted() {
    return const _PayeeWatchStarted();
  }

// ignore: unused_element
  _PayeesReceived payeesReceived(
      Either<ValueFailure, List<Payee>> failureOrPayees) {
    return _PayeesReceived(
      failureOrPayees,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PayeeWatcherEvent = _$PayeeWatcherEventTearOff();

/// @nodoc
mixin _$PayeeWatcherEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchPayeesStarted(),
    @required
        Result payeesReceived(
            Either<ValueFailure, List<Payee>> failureOrPayees),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchPayeesStarted(),
    Result payeesReceived(Either<ValueFailure, List<Payee>> failureOrPayees),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchPayeesStarted(_PayeeWatchStarted value),
    @required Result payeesReceived(_PayeesReceived value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchPayeesStarted(_PayeeWatchStarted value),
    Result payeesReceived(_PayeesReceived value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $PayeeWatcherEventCopyWith<$Res> {
  factory $PayeeWatcherEventCopyWith(
          PayeeWatcherEvent value, $Res Function(PayeeWatcherEvent) then) =
      _$PayeeWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PayeeWatcherEventCopyWithImpl<$Res>
    implements $PayeeWatcherEventCopyWith<$Res> {
  _$PayeeWatcherEventCopyWithImpl(this._value, this._then);

  final PayeeWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(PayeeWatcherEvent) _then;
}

/// @nodoc
abstract class _$PayeeWatchStartedCopyWith<$Res> {
  factory _$PayeeWatchStartedCopyWith(
          _PayeeWatchStarted value, $Res Function(_PayeeWatchStarted) then) =
      __$PayeeWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$PayeeWatchStartedCopyWithImpl<$Res>
    extends _$PayeeWatcherEventCopyWithImpl<$Res>
    implements _$PayeeWatchStartedCopyWith<$Res> {
  __$PayeeWatchStartedCopyWithImpl(
      _PayeeWatchStarted _value, $Res Function(_PayeeWatchStarted) _then)
      : super(_value, (v) => _then(v as _PayeeWatchStarted));

  @override
  _PayeeWatchStarted get _value => super._value as _PayeeWatchStarted;
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
    return identical(this, other) || (other is _PayeeWatchStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchPayeesStarted(),
    @required
        Result payeesReceived(
            Either<ValueFailure, List<Payee>> failureOrPayees),
  }) {
    assert(watchPayeesStarted != null);
    assert(payeesReceived != null);
    return watchPayeesStarted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchPayeesStarted(),
    Result payeesReceived(Either<ValueFailure, List<Payee>> failureOrPayees),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (watchPayeesStarted != null) {
      return watchPayeesStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchPayeesStarted(_PayeeWatchStarted value),
    @required Result payeesReceived(_PayeesReceived value),
  }) {
    assert(watchPayeesStarted != null);
    assert(payeesReceived != null);
    return watchPayeesStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchPayeesStarted(_PayeeWatchStarted value),
    Result payeesReceived(_PayeesReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
abstract class _$PayeesReceivedCopyWith<$Res> {
  factory _$PayeesReceivedCopyWith(
          _PayeesReceived value, $Res Function(_PayeesReceived) then) =
      __$PayeesReceivedCopyWithImpl<$Res>;
  $Res call({Either<ValueFailure, List<Payee>> failureOrPayees});
}

/// @nodoc
class __$PayeesReceivedCopyWithImpl<$Res>
    extends _$PayeeWatcherEventCopyWithImpl<$Res>
    implements _$PayeesReceivedCopyWith<$Res> {
  __$PayeesReceivedCopyWithImpl(
      _PayeesReceived _value, $Res Function(_PayeesReceived) _then)
      : super(_value, (v) => _then(v as _PayeesReceived));

  @override
  _PayeesReceived get _value => super._value as _PayeesReceived;

  @override
  $Res call({
    Object failureOrPayees = freezed,
  }) {
    return _then(_PayeesReceived(
      failureOrPayees == freezed
          ? _value.failureOrPayees
          : failureOrPayees as Either<ValueFailure, List<Payee>>,
    ));
  }
}

/// @nodoc
class _$_PayeesReceived implements _PayeesReceived {
  const _$_PayeesReceived(this.failureOrPayees)
      : assert(failureOrPayees != null);

  @override
  final Either<ValueFailure, List<Payee>> failureOrPayees;

  @override
  String toString() {
    return 'PayeeWatcherEvent.payeesReceived(failureOrPayees: $failureOrPayees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayeesReceived &&
            (identical(other.failureOrPayees, failureOrPayees) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrPayees, failureOrPayees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrPayees);

  @override
  _$PayeesReceivedCopyWith<_PayeesReceived> get copyWith =>
      __$PayeesReceivedCopyWithImpl<_PayeesReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchPayeesStarted(),
    @required
        Result payeesReceived(
            Either<ValueFailure, List<Payee>> failureOrPayees),
  }) {
    assert(watchPayeesStarted != null);
    assert(payeesReceived != null);
    return payeesReceived(failureOrPayees);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchPayeesStarted(),
    Result payeesReceived(Either<ValueFailure, List<Payee>> failureOrPayees),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (payeesReceived != null) {
      return payeesReceived(failureOrPayees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchPayeesStarted(_PayeeWatchStarted value),
    @required Result payeesReceived(_PayeesReceived value),
  }) {
    assert(watchPayeesStarted != null);
    assert(payeesReceived != null);
    return payeesReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchPayeesStarted(_PayeeWatchStarted value),
    Result payeesReceived(_PayeesReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (payeesReceived != null) {
      return payeesReceived(this);
    }
    return orElse();
  }
}

abstract class _PayeesReceived implements PayeeWatcherEvent {
  const factory _PayeesReceived(
      Either<ValueFailure, List<Payee>> failureOrPayees) = _$_PayeesReceived;

  Either<ValueFailure, List<Payee>> get failureOrPayees;
  _$PayeesReceivedCopyWith<_PayeesReceived> get copyWith;
}

/// @nodoc
class _$PayeeWatcherStateTearOff {
  const _$PayeeWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _PayeeLoadSuccess loadSuccess(List<Payee> payees) {
    return _PayeeLoadSuccess(
      payees,
    );
  }

// ignore: unused_element
  _PayeeLoadFailure loadFailure(ValueFailure<dynamic> payeeFailure) {
    return _PayeeLoadFailure(
      payeeFailure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PayeeWatcherState = _$PayeeWatcherStateTearOff();

/// @nodoc
mixin _$PayeeWatcherState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<Payee> payees),
    @required Result loadFailure(ValueFailure<dynamic> payeeFailure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<Payee> payees),
    Result loadFailure(ValueFailure<dynamic> payeeFailure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_PayeeLoadSuccess value),
    @required Result loadFailure(_PayeeLoadFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadSuccess(_PayeeLoadSuccess value),
    Result loadFailure(_PayeeLoadFailure value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $PayeeWatcherStateCopyWith<$Res> {
  factory $PayeeWatcherStateCopyWith(
          PayeeWatcherState value, $Res Function(PayeeWatcherState) then) =
      _$PayeeWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$PayeeWatcherStateCopyWithImpl<$Res>
    implements $PayeeWatcherStateCopyWith<$Res> {
  _$PayeeWatcherStateCopyWithImpl(this._value, this._then);

  final PayeeWatcherState _value;
  // ignore: unused_field
  final $Res Function(PayeeWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res> extends _$PayeeWatcherStateCopyWithImpl<$Res>
    implements _$InitialCopyWith<$Res> {
  __$InitialCopyWithImpl(_Initial _value, $Res Function(_Initial) _then)
      : super(_value, (v) => _then(v as _Initial));

  @override
  _Initial get _value => super._value as _Initial;
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
    return identical(this, other) || (other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<Payee> payees),
    @required Result loadFailure(ValueFailure<dynamic> payeeFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<Payee> payees),
    Result loadFailure(ValueFailure<dynamic> payeeFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_PayeeLoadSuccess value),
    @required Result loadFailure(_PayeeLoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadSuccess(_PayeeLoadSuccess value),
    Result loadFailure(_PayeeLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res> extends _$PayeeWatcherStateCopyWithImpl<$Res>
    implements _$LoadingCopyWith<$Res> {
  __$LoadingCopyWithImpl(_Loading _value, $Res Function(_Loading) _then)
      : super(_value, (v) => _then(v as _Loading));

  @override
  _Loading get _value => super._value as _Loading;
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
    return identical(this, other) || (other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<Payee> payees),
    @required Result loadFailure(ValueFailure<dynamic> payeeFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<Payee> payees),
    Result loadFailure(ValueFailure<dynamic> payeeFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_PayeeLoadSuccess value),
    @required Result loadFailure(_PayeeLoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadSuccess(_PayeeLoadSuccess value),
    Result loadFailure(_PayeeLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
abstract class _$PayeeLoadSuccessCopyWith<$Res> {
  factory _$PayeeLoadSuccessCopyWith(
          _PayeeLoadSuccess value, $Res Function(_PayeeLoadSuccess) then) =
      __$PayeeLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<Payee> payees});
}

/// @nodoc
class __$PayeeLoadSuccessCopyWithImpl<$Res>
    extends _$PayeeWatcherStateCopyWithImpl<$Res>
    implements _$PayeeLoadSuccessCopyWith<$Res> {
  __$PayeeLoadSuccessCopyWithImpl(
      _PayeeLoadSuccess _value, $Res Function(_PayeeLoadSuccess) _then)
      : super(_value, (v) => _then(v as _PayeeLoadSuccess));

  @override
  _PayeeLoadSuccess get _value => super._value as _PayeeLoadSuccess;

  @override
  $Res call({
    Object payees = freezed,
  }) {
    return _then(_PayeeLoadSuccess(
      payees == freezed ? _value.payees : payees as List<Payee>,
    ));
  }
}

/// @nodoc
class _$_PayeeLoadSuccess implements _PayeeLoadSuccess {
  const _$_PayeeLoadSuccess(this.payees) : assert(payees != null);

  @override
  final List<Payee> payees;

  @override
  String toString() {
    return 'PayeeWatcherState.loadSuccess(payees: $payees)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayeeLoadSuccess &&
            (identical(other.payees, payees) ||
                const DeepCollectionEquality().equals(other.payees, payees)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(payees);

  @override
  _$PayeeLoadSuccessCopyWith<_PayeeLoadSuccess> get copyWith =>
      __$PayeeLoadSuccessCopyWithImpl<_PayeeLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<Payee> payees),
    @required Result loadFailure(ValueFailure<dynamic> payeeFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(payees);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<Payee> payees),
    Result loadFailure(ValueFailure<dynamic> payeeFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(payees);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_PayeeLoadSuccess value),
    @required Result loadFailure(_PayeeLoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadSuccess(_PayeeLoadSuccess value),
    Result loadFailure(_PayeeLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _PayeeLoadSuccess implements PayeeWatcherState {
  const factory _PayeeLoadSuccess(List<Payee> payees) = _$_PayeeLoadSuccess;

  List<Payee> get payees;
  _$PayeeLoadSuccessCopyWith<_PayeeLoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$PayeeLoadFailureCopyWith<$Res> {
  factory _$PayeeLoadFailureCopyWith(
          _PayeeLoadFailure value, $Res Function(_PayeeLoadFailure) then) =
      __$PayeeLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> payeeFailure});

  $ValueFailureCopyWith<dynamic, $Res> get payeeFailure;
}

/// @nodoc
class __$PayeeLoadFailureCopyWithImpl<$Res>
    extends _$PayeeWatcherStateCopyWithImpl<$Res>
    implements _$PayeeLoadFailureCopyWith<$Res> {
  __$PayeeLoadFailureCopyWithImpl(
      _PayeeLoadFailure _value, $Res Function(_PayeeLoadFailure) _then)
      : super(_value, (v) => _then(v as _PayeeLoadFailure));

  @override
  _PayeeLoadFailure get _value => super._value as _PayeeLoadFailure;

  @override
  $Res call({
    Object payeeFailure = freezed,
  }) {
    return _then(_PayeeLoadFailure(
      payeeFailure == freezed
          ? _value.payeeFailure
          : payeeFailure as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get payeeFailure {
    if (_value.payeeFailure == null) {
      return null;
    }
    return $ValueFailureCopyWith<dynamic, $Res>(_value.payeeFailure, (value) {
      return _then(_value.copyWith(payeeFailure: value));
    });
  }
}

/// @nodoc
class _$_PayeeLoadFailure implements _PayeeLoadFailure {
  const _$_PayeeLoadFailure(this.payeeFailure) : assert(payeeFailure != null);

  @override
  final ValueFailure<dynamic> payeeFailure;

  @override
  String toString() {
    return 'PayeeWatcherState.loadFailure(payeeFailure: $payeeFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayeeLoadFailure &&
            (identical(other.payeeFailure, payeeFailure) ||
                const DeepCollectionEquality()
                    .equals(other.payeeFailure, payeeFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(payeeFailure);

  @override
  _$PayeeLoadFailureCopyWith<_PayeeLoadFailure> get copyWith =>
      __$PayeeLoadFailureCopyWithImpl<_PayeeLoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<Payee> payees),
    @required Result loadFailure(ValueFailure<dynamic> payeeFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(payeeFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<Payee> payees),
    Result loadFailure(ValueFailure<dynamic> payeeFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(payeeFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_PayeeLoadSuccess value),
    @required Result loadFailure(_PayeeLoadFailure value),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadSuccess(_PayeeLoadSuccess value),
    Result loadFailure(_PayeeLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _PayeeLoadFailure implements PayeeWatcherState {
  const factory _PayeeLoadFailure(ValueFailure<dynamic> payeeFailure) =
      _$_PayeeLoadFailure;

  ValueFailure<dynamic> get payeeFailure;
  _$PayeeLoadFailureCopyWith<_PayeeLoadFailure> get copyWith;
}
