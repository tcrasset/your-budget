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
      Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions) {
    return _TransactionsReceived(
      failureOrTransactions,
    );
  }

// ignore: unused_element
  _CycleAccount cycleAccount({@required bool increment}) {
    return _CycleAccount(
      increment: increment,
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
    @required
        Result transactionsReceived(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    @required Result cycleAccount(bool increment),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchTransactionsStarted(),
    Result transactionsReceived(
        Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    Result cycleAccount(bool increment),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchTransactionsStarted(_TransactionWatchStarted value),
    @required Result transactionsReceived(_TransactionsReceived value),
    @required Result cycleAccount(_CycleAccount value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchTransactionsStarted(_TransactionWatchStarted value),
    Result transactionsReceived(_TransactionsReceived value),
    Result cycleAccount(_CycleAccount value),
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
    @required
        Result transactionsReceived(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    @required Result cycleAccount(bool increment),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    assert(cycleAccount != null);
    return watchTransactionsStarted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchTransactionsStarted(),
    Result transactionsReceived(
        Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    Result cycleAccount(bool increment),
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
    @required Result cycleAccount(_CycleAccount value),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    assert(cycleAccount != null);
    return watchTransactionsStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchTransactionsStarted(_TransactionWatchStarted value),
    Result transactionsReceived(_TransactionsReceived value),
    Result cycleAccount(_CycleAccount value),
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
  $Res call(
      {Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions});
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
    Object failureOrTransactions = freezed,
  }) {
    return _then(_TransactionsReceived(
      failureOrTransactions == freezed
          ? _value.failureOrTransactions
          : failureOrTransactions
              as Either<ValueFailure, List<MoneyTransaction>>,
    ));
  }
}

/// @nodoc
class _$_TransactionsReceived implements _TransactionsReceived {
  const _$_TransactionsReceived(this.failureOrTransactions)
      : assert(failureOrTransactions != null);

  @override
  final Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions;

  @override
  String toString() {
    return 'TransactionWatcherEvent.transactionsReceived(failureOrTransactions: $failureOrTransactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionsReceived &&
            (identical(other.failureOrTransactions, failureOrTransactions) ||
                const DeepCollectionEquality().equals(
                    other.failureOrTransactions, failureOrTransactions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrTransactions);

  @override
  _$TransactionsReceivedCopyWith<_TransactionsReceived> get copyWith =>
      __$TransactionsReceivedCopyWithImpl<_TransactionsReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchTransactionsStarted(),
    @required
        Result transactionsReceived(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    @required Result cycleAccount(bool increment),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    assert(cycleAccount != null);
    return transactionsReceived(failureOrTransactions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchTransactionsStarted(),
    Result transactionsReceived(
        Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    Result cycleAccount(bool increment),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (transactionsReceived != null) {
      return transactionsReceived(failureOrTransactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchTransactionsStarted(_TransactionWatchStarted value),
    @required Result transactionsReceived(_TransactionsReceived value),
    @required Result cycleAccount(_CycleAccount value),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    assert(cycleAccount != null);
    return transactionsReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchTransactionsStarted(_TransactionWatchStarted value),
    Result transactionsReceived(_TransactionsReceived value),
    Result cycleAccount(_CycleAccount value),
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
  const factory _TransactionsReceived(
          Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions) =
      _$_TransactionsReceived;

  Either<ValueFailure, List<MoneyTransaction>> get failureOrTransactions;
  _$TransactionsReceivedCopyWith<_TransactionsReceived> get copyWith;
}

/// @nodoc
abstract class _$CycleAccountCopyWith<$Res> {
  factory _$CycleAccountCopyWith(
          _CycleAccount value, $Res Function(_CycleAccount) then) =
      __$CycleAccountCopyWithImpl<$Res>;
  $Res call({bool increment});
}

/// @nodoc
class __$CycleAccountCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res>
    implements _$CycleAccountCopyWith<$Res> {
  __$CycleAccountCopyWithImpl(
      _CycleAccount _value, $Res Function(_CycleAccount) _then)
      : super(_value, (v) => _then(v as _CycleAccount));

  @override
  _CycleAccount get _value => super._value as _CycleAccount;

  @override
  $Res call({
    Object increment = freezed,
  }) {
    return _then(_CycleAccount(
      increment: increment == freezed ? _value.increment : increment as bool,
    ));
  }
}

/// @nodoc
class _$_CycleAccount implements _CycleAccount {
  const _$_CycleAccount({@required this.increment}) : assert(increment != null);

  @override
  final bool increment;

  @override
  String toString() {
    return 'TransactionWatcherEvent.cycleAccount(increment: $increment)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _CycleAccount &&
            (identical(other.increment, increment) ||
                const DeepCollectionEquality()
                    .equals(other.increment, increment)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(increment);

  @override
  _$CycleAccountCopyWith<_CycleAccount> get copyWith =>
      __$CycleAccountCopyWithImpl<_CycleAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchTransactionsStarted(),
    @required
        Result transactionsReceived(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    @required Result cycleAccount(bool increment),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    assert(cycleAccount != null);
    return cycleAccount(increment);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchTransactionsStarted(),
    Result transactionsReceived(
        Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions),
    Result cycleAccount(bool increment),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cycleAccount != null) {
      return cycleAccount(increment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchTransactionsStarted(_TransactionWatchStarted value),
    @required Result transactionsReceived(_TransactionsReceived value),
    @required Result cycleAccount(_CycleAccount value),
  }) {
    assert(watchTransactionsStarted != null);
    assert(transactionsReceived != null);
    assert(cycleAccount != null);
    return cycleAccount(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchTransactionsStarted(_TransactionWatchStarted value),
    Result transactionsReceived(_TransactionsReceived value),
    Result cycleAccount(_CycleAccount value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cycleAccount != null) {
      return cycleAccount(this);
    }
    return orElse();
  }
}

abstract class _CycleAccount implements TransactionWatcherEvent {
  const factory _CycleAccount({@required bool increment}) = _$_CycleAccount;

  bool get increment;
  _$CycleAccountCopyWith<_CycleAccount> get copyWith;
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
  _TransactionLoadSuccess loadSuccess(List<MoneyTransaction> transactions) {
    return _TransactionLoadSuccess(
      transactions,
    );
  }

// ignore: unused_element
  _TransactionLoadFailure loadFailure(
      ValueFailure<dynamic> transactionFailure) {
    return _TransactionLoadFailure(
      transactionFailure,
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
    @required Result loadSuccess(List<MoneyTransaction> transactions),
    @required Result loadFailure(ValueFailure<dynamic> transactionFailure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<MoneyTransaction> transactions),
    Result loadFailure(ValueFailure<dynamic> transactionFailure),
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
    @required Result loadSuccess(List<MoneyTransaction> transactions),
    @required Result loadFailure(ValueFailure<dynamic> transactionFailure),
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
    Result loadSuccess(List<MoneyTransaction> transactions),
    Result loadFailure(ValueFailure<dynamic> transactionFailure),
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
    @required Result loadSuccess(List<MoneyTransaction> transactions),
    @required Result loadFailure(ValueFailure<dynamic> transactionFailure),
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
    Result loadSuccess(List<MoneyTransaction> transactions),
    Result loadFailure(ValueFailure<dynamic> transactionFailure),
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
  $Res call({List<MoneyTransaction> transactions});
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
    Object transactions = freezed,
  }) {
    return _then(_TransactionLoadSuccess(
      transactions == freezed
          ? _value.transactions
          : transactions as List<MoneyTransaction>,
    ));
  }
}

/// @nodoc
class _$_TransactionLoadSuccess implements _TransactionLoadSuccess {
  const _$_TransactionLoadSuccess(this.transactions)
      : assert(transactions != null);

  @override
  final List<MoneyTransaction> transactions;

  @override
  String toString() {
    return 'TransactionWatcherState.loadSuccess(transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionLoadSuccess &&
            (identical(other.transactions, transactions) ||
                const DeepCollectionEquality()
                    .equals(other.transactions, transactions)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(transactions);

  @override
  _$TransactionLoadSuccessCopyWith<_TransactionLoadSuccess> get copyWith =>
      __$TransactionLoadSuccessCopyWithImpl<_TransactionLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<MoneyTransaction> transactions),
    @required Result loadFailure(ValueFailure<dynamic> transactionFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(transactions);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<MoneyTransaction> transactions),
    Result loadFailure(ValueFailure<dynamic> transactionFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(transactions);
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
  const factory _TransactionLoadSuccess(List<MoneyTransaction> transactions) =
      _$_TransactionLoadSuccess;

  List<MoneyTransaction> get transactions;
  _$TransactionLoadSuccessCopyWith<_TransactionLoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$TransactionLoadFailureCopyWith<$Res> {
  factory _$TransactionLoadFailureCopyWith(_TransactionLoadFailure value,
          $Res Function(_TransactionLoadFailure) then) =
      __$TransactionLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> transactionFailure});

  $ValueFailureCopyWith<dynamic, $Res> get transactionFailure;
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
    Object transactionFailure = freezed,
  }) {
    return _then(_TransactionLoadFailure(
      transactionFailure == freezed
          ? _value.transactionFailure
          : transactionFailure as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get transactionFailure {
    if (_value.transactionFailure == null) {
      return null;
    }
    return $ValueFailureCopyWith<dynamic, $Res>(_value.transactionFailure,
        (value) {
      return _then(_value.copyWith(transactionFailure: value));
    });
  }
}

/// @nodoc
class _$_TransactionLoadFailure implements _TransactionLoadFailure {
  const _$_TransactionLoadFailure(this.transactionFailure)
      : assert(transactionFailure != null);

  @override
  final ValueFailure<dynamic> transactionFailure;

  @override
  String toString() {
    return 'TransactionWatcherState.loadFailure(transactionFailure: $transactionFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _TransactionLoadFailure &&
            (identical(other.transactionFailure, transactionFailure) ||
                const DeepCollectionEquality()
                    .equals(other.transactionFailure, transactionFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(transactionFailure);

  @override
  _$TransactionLoadFailureCopyWith<_TransactionLoadFailure> get copyWith =>
      __$TransactionLoadFailureCopyWithImpl<_TransactionLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<MoneyTransaction> transactions),
    @required Result loadFailure(ValueFailure<dynamic> transactionFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(transactionFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<MoneyTransaction> transactions),
    Result loadFailure(ValueFailure<dynamic> transactionFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(transactionFailure);
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
  const factory _TransactionLoadFailure(
      ValueFailure<dynamic> transactionFailure) = _$_TransactionLoadFailure;

  ValueFailure<dynamic> get transactionFailure;
  _$TransactionLoadFailureCopyWith<_TransactionLoadFailure> get copyWith;
}
