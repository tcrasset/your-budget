// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'transaction_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$TransactionWatcherEventTearOff {
  const _$TransactionWatcherEventTearOff();

// ignore: unused_element
  _TransactionWatchStarted watchTransactionsStarted() {
    return const _TransactionWatchStarted();
  }

// ignore: unused_element
  _TransactionsReceived transactionsReceived(
      List<MoneyTransaction> transactions) {
    return _TransactionsReceived(
      transactions,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionWatcherEvent = _$TransactionWatcherEventTearOff();

/// @nodoc
mixin _$TransactionWatcherEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchTransactionsStarted(),
    @required Result transactionsReceived(List<MoneyTransaction> transactions),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchTransactionsStarted(),
    Result transactionsReceived(List<MoneyTransaction> transactions),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchTransactionsStarted(_TransactionWatchStarted value),
    @required Result transactionsReceived(_TransactionsReceived value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchTransactionsStarted(_TransactionWatchStarted value),
    Result transactionsReceived(_TransactionsReceived value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $TransactionWatcherEventCopyWith<$Res> {
  factory $TransactionWatcherEventCopyWith(TransactionWatcherEvent value,
          $Res Function(TransactionWatcherEvent) then) =
      _$TransactionWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionWatcherEventCopyWithImpl<$Res>
    implements $TransactionWatcherEventCopyWith<$Res> {
  _$TransactionWatcherEventCopyWithImpl(this._value, this._then);

  final TransactionWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(TransactionWatcherEvent) _then;
}

/// @nodoc
abstract class _$TransactionWatchStartedCopyWith<$Res> {
  factory _$TransactionWatchStartedCopyWith(_TransactionWatchStarted value,
          $Res Function(_TransactionWatchStarted) then) =
      __$TransactionWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$TransactionWatchStartedCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res>
    implements _$TransactionWatchStartedCopyWith<$Res> {
  __$TransactionWatchStartedCopyWithImpl(_TransactionWatchStarted _value,
      $Res Function(_TransactionWatchStarted) _then)
      : super(_value, (v) => _then(v as _TransactionWatchStarted));

  @override
  _TransactionWatchStarted get _value =>
      super._value as _TransactionWatchStarted;
}

/// @nodoc
class _$_TransactionWatchStarted implements _TransactionWatchStarted {
  const _$_TransactionWatchStarted();

  @override
  String toString() {
    return 'TransactionWatcherEvent.watchTransactionsStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _TransactionWatchStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchTransactionsStarted(),
    @required Result transactionsReceived(List<MoneyTransaction> transactions),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    return watchTransactionsStarted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchTransactionsStarted(),
    Result transactionsReceived(List<MoneyTransaction> transactions),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (watchTransactionsStarted != null) {
      return watchTransactionsStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchTransactionsStarted(_TransactionWatchStarted value),
    @required Result transactionsReceived(_TransactionsReceived value),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    return watchTransactionsStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchTransactionsStarted(_TransactionWatchStarted value),
    Result transactionsReceived(_TransactionsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (watchTransactionsStarted != null) {
      return watchTransactionsStarted(this);
    }
    return orElse();
  }
}

abstract class _TransactionWatchStarted implements TransactionWatcherEvent {
  const factory _TransactionWatchStarted() = _$_TransactionWatchStarted;
}

/// @nodoc
abstract class _$TransactionsReceivedCopyWith<$Res> {
  factory _$TransactionsReceivedCopyWith(_TransactionsReceived value,
          $Res Function(_TransactionsReceived) then) =
      __$TransactionsReceivedCopyWithImpl<$Res>;
  $Res call({List<MoneyTransaction> transactions});
}

/// @nodoc
class __$TransactionsReceivedCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res>
    implements _$TransactionsReceivedCopyWith<$Res> {
  __$TransactionsReceivedCopyWithImpl(
      _TransactionsReceived _value, $Res Function(_TransactionsReceived) _then)
      : super(_value, (v) => _then(v as _TransactionsReceived));

  @override
  _TransactionsReceived get _value => super._value as _TransactionsReceived;

  @override
  $Res call({
    Object transactions = freezed,
  }) {
    return _then(_TransactionsReceived(
      transactions == freezed
          ? _value.transactions
          : transactions as List<MoneyTransaction>,
    ));
  }
}

/// @nodoc
class _$_TransactionsReceived implements _TransactionsReceived {
  const _$_TransactionsReceived(this.transactions)
      : assert(transactions != null);

  @override
  final List<MoneyTransaction> transactions;

  @override
  String toString() {
    return 'TransactionWatcherEvent.transactionsReceived(transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionsReceived &&
            (identical(other.transactions, transactions) ||
                const DeepCollectionEquality()
                    .equals(other.transactions, transactions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(transactions);

  @override
  _$TransactionsReceivedCopyWith<_TransactionsReceived> get copyWith =>
      __$TransactionsReceivedCopyWithImpl<_TransactionsReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchTransactionsStarted(),
    @required Result transactionsReceived(List<MoneyTransaction> transactions),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    return transactionsReceived(transactions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchTransactionsStarted(),
    Result transactionsReceived(List<MoneyTransaction> transactions),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (transactionsReceived != null) {
      return transactionsReceived(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchTransactionsStarted(_TransactionWatchStarted value),
    @required Result transactionsReceived(_TransactionsReceived value),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    return transactionsReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchTransactionsStarted(_TransactionWatchStarted value),
    Result transactionsReceived(_TransactionsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (transactionsReceived != null) {
      return transactionsReceived(this);
    }
    return orElse();
  }
}

abstract class _TransactionsReceived implements TransactionWatcherEvent {
  const factory _TransactionsReceived(List<MoneyTransaction> transactions) =
      _$_TransactionsReceived;

  List<MoneyTransaction> get transactions;
  _$TransactionsReceivedCopyWith<_TransactionsReceived> get copyWith;
}

/// @nodoc
class _$TransactionWatcherStateTearOff {
  const _$TransactionWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _TransactionLoadSuccess loadSuccess(List<MoneyTransaction> plants) {
    return _TransactionLoadSuccess(
      plants,
    );
  }

// ignore: unused_element
  _TransactionLoadFailure loadFailure(ValueFailure<dynamic> plantFailure) {
    return _TransactionLoadFailure(
      plantFailure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $TransactionWatcherState = _$TransactionWatcherStateTearOff();

/// @nodoc
mixin _$TransactionWatcherState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<MoneyTransaction> plants),
    @required Result loadFailure(ValueFailure<dynamic> plantFailure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<MoneyTransaction> plants),
    Result loadFailure(ValueFailure<dynamic> plantFailure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_TransactionLoadSuccess value),
    @required Result loadFailure(_TransactionLoadFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadSuccess(_TransactionLoadSuccess value),
    Result loadFailure(_TransactionLoadFailure value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $TransactionWatcherStateCopyWith<$Res> {
  factory $TransactionWatcherStateCopyWith(TransactionWatcherState value,
          $Res Function(TransactionWatcherState) then) =
      _$TransactionWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionWatcherStateCopyWithImpl<$Res>
    implements $TransactionWatcherStateCopyWith<$Res> {
  _$TransactionWatcherStateCopyWithImpl(this._value, this._then);

  final TransactionWatcherState _value;
  // ignore: unused_field
  final $Res Function(TransactionWatcherState) _then;
}

/// @nodoc
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
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
    return 'TransactionWatcherState.initial()';
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
    @required Result loadSuccess(List<MoneyTransaction> plants),
    @required Result loadFailure(ValueFailure<dynamic> plantFailure),
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
    Result loadSuccess(List<MoneyTransaction> plants),
    Result loadFailure(ValueFailure<dynamic> plantFailure),
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
    @required Result loadSuccess(_TransactionLoadSuccess value),
    @required Result loadFailure(_TransactionLoadFailure value),
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
    Result loadSuccess(_TransactionLoadSuccess value),
    Result loadFailure(_TransactionLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TransactionWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
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
    return 'TransactionWatcherState.loading()';
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
    @required Result loadSuccess(List<MoneyTransaction> plants),
    @required Result loadFailure(ValueFailure<dynamic> plantFailure),
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
    Result loadSuccess(List<MoneyTransaction> plants),
    Result loadFailure(ValueFailure<dynamic> plantFailure),
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
    @required Result loadSuccess(_TransactionLoadSuccess value),
    @required Result loadFailure(_TransactionLoadFailure value),
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
    Result loadSuccess(_TransactionLoadSuccess value),
    Result loadFailure(_TransactionLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TransactionWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$TransactionLoadSuccessCopyWith<$Res> {
  factory _$TransactionLoadSuccessCopyWith(_TransactionLoadSuccess value,
          $Res Function(_TransactionLoadSuccess) then) =
      __$TransactionLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<MoneyTransaction> plants});
}

/// @nodoc
class __$TransactionLoadSuccessCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
    implements _$TransactionLoadSuccessCopyWith<$Res> {
  __$TransactionLoadSuccessCopyWithImpl(_TransactionLoadSuccess _value,
      $Res Function(_TransactionLoadSuccess) _then)
      : super(_value, (v) => _then(v as _TransactionLoadSuccess));

  @override
  _TransactionLoadSuccess get _value => super._value as _TransactionLoadSuccess;

  @override
  $Res call({
    Object plants = freezed,
  }) {
    return _then(_TransactionLoadSuccess(
      plants == freezed ? _value.plants : plants as List<MoneyTransaction>,
    ));
  }
}

/// @nodoc
class _$_TransactionLoadSuccess implements _TransactionLoadSuccess {
  const _$_TransactionLoadSuccess(this.plants) : assert(plants != null);

  @override
  final List<MoneyTransaction> plants;

  @override
  String toString() {
    return 'TransactionWatcherState.loadSuccess(plants: $plants)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionLoadSuccess &&
            (identical(other.plants, plants) ||
                const DeepCollectionEquality().equals(other.plants, plants)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(plants);

  @override
  _$TransactionLoadSuccessCopyWith<_TransactionLoadSuccess> get copyWith =>
      __$TransactionLoadSuccessCopyWithImpl<_TransactionLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<MoneyTransaction> plants),
    @required Result loadFailure(ValueFailure<dynamic> plantFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(plants);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<MoneyTransaction> plants),
    Result loadFailure(ValueFailure<dynamic> plantFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(plants);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_TransactionLoadSuccess value),
    @required Result loadFailure(_TransactionLoadFailure value),
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
    Result loadSuccess(_TransactionLoadSuccess value),
    Result loadFailure(_TransactionLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _TransactionLoadSuccess implements TransactionWatcherState {
  const factory _TransactionLoadSuccess(List<MoneyTransaction> plants) =
      _$_TransactionLoadSuccess;

  List<MoneyTransaction> get plants;
  _$TransactionLoadSuccessCopyWith<_TransactionLoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$TransactionLoadFailureCopyWith<$Res> {
  factory _$TransactionLoadFailureCopyWith(_TransactionLoadFailure value,
          $Res Function(_TransactionLoadFailure) then) =
      __$TransactionLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> plantFailure});

  $ValueFailureCopyWith<dynamic, $Res> get plantFailure;
}

/// @nodoc
class __$TransactionLoadFailureCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
    implements _$TransactionLoadFailureCopyWith<$Res> {
  __$TransactionLoadFailureCopyWithImpl(_TransactionLoadFailure _value,
      $Res Function(_TransactionLoadFailure) _then)
      : super(_value, (v) => _then(v as _TransactionLoadFailure));

  @override
  _TransactionLoadFailure get _value => super._value as _TransactionLoadFailure;

  @override
  $Res call({
    Object plantFailure = freezed,
  }) {
    return _then(_TransactionLoadFailure(
      plantFailure == freezed
          ? _value.plantFailure
          : plantFailure as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get plantFailure {
    if (_value.plantFailure == null) {
      return null;
    }
    return $ValueFailureCopyWith<dynamic, $Res>(_value.plantFailure, (value) {
      return _then(_value.copyWith(plantFailure: value));
    });
  }
}

/// @nodoc
class _$_TransactionLoadFailure implements _TransactionLoadFailure {
  const _$_TransactionLoadFailure(this.plantFailure)
      : assert(plantFailure != null);

  @override
  final ValueFailure<dynamic> plantFailure;

  @override
  String toString() {
    return 'TransactionWatcherState.loadFailure(plantFailure: $plantFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionLoadFailure &&
            (identical(other.plantFailure, plantFailure) ||
                const DeepCollectionEquality()
                    .equals(other.plantFailure, plantFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(plantFailure);

  @override
  _$TransactionLoadFailureCopyWith<_TransactionLoadFailure> get copyWith =>
      __$TransactionLoadFailureCopyWithImpl<_TransactionLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<MoneyTransaction> plants),
    @required Result loadFailure(ValueFailure<dynamic> plantFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(plantFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<MoneyTransaction> plants),
    Result loadFailure(ValueFailure<dynamic> plantFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(plantFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_TransactionLoadSuccess value),
    @required Result loadFailure(_TransactionLoadFailure value),
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
    Result loadSuccess(_TransactionLoadSuccess value),
    Result loadFailure(_TransactionLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _TransactionLoadFailure implements TransactionWatcherState {
  const factory _TransactionLoadFailure(ValueFailure<dynamic> plantFailure) =
      _$_TransactionLoadFailure;

  ValueFailure<dynamic> get plantFailure;
  _$TransactionLoadFailureCopyWith<_TransactionLoadFailure> get copyWith;
}
