// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'transaction_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TransactionWatcherEventTearOff {
  const _$TransactionWatcherEventTearOff();

  _TransactionWatchStarted watchTransactionsStarted() {
    return const _TransactionWatchStarted();
  }

  _TransactionsReceived transactionsReceived(
      Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions) {
    return _TransactionsReceived(
      failureOrTransactions,
    );
  }

  _CycleAccount cycleAccount({required bool increment}) {
    return _CycleAccount(
      increment: increment,
    );
  }
}

/// @nodoc
const $TransactionWatcherEvent = _$TransactionWatcherEventTearOff();

/// @nodoc
mixin _$TransactionWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchTransactionsStarted,
    required TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)
        transactionsReceived,
    required TResult Function(bool increment) cycleAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionWatchStarted value)
        watchTransactionsStarted,
    required TResult Function(_TransactionsReceived value) transactionsReceived,
    required TResult Function(_CycleAccount value) cycleAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() watchTransactionsStarted,
    required TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)
        transactionsReceived,
    required TResult Function(bool increment) cycleAccount,
  }) {
    return watchTransactionsStarted();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
    required TResult orElse(),
  }) {
    if (watchTransactionsStarted != null) {
      return watchTransactionsStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionWatchStarted value)
        watchTransactionsStarted,
    required TResult Function(_TransactionsReceived value) transactionsReceived,
    required TResult Function(_CycleAccount value) cycleAccount,
  }) {
    return watchTransactionsStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    required TResult orElse(),
  }) {
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
    Object? failureOrTransactions = freezed,
  }) {
    return _then(_TransactionsReceived(
      failureOrTransactions == freezed
          ? _value.failureOrTransactions
          : failureOrTransactions // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure, List<MoneyTransaction>>,
    ));
  }
}

/// @nodoc

class _$_TransactionsReceived implements _TransactionsReceived {
  const _$_TransactionsReceived(this.failureOrTransactions);

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

  @JsonKey(ignore: true)
  @override
  _$TransactionsReceivedCopyWith<_TransactionsReceived> get copyWith =>
      __$TransactionsReceivedCopyWithImpl<_TransactionsReceived>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchTransactionsStarted,
    required TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)
        transactionsReceived,
    required TResult Function(bool increment) cycleAccount,
  }) {
    return transactionsReceived(failureOrTransactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
    required TResult orElse(),
  }) {
    if (transactionsReceived != null) {
      return transactionsReceived(failureOrTransactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionWatchStarted value)
        watchTransactionsStarted,
    required TResult Function(_TransactionsReceived value) transactionsReceived,
    required TResult Function(_CycleAccount value) cycleAccount,
  }) {
    return transactionsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    required TResult orElse(),
  }) {
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

  Either<ValueFailure, List<MoneyTransaction>> get failureOrTransactions =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TransactionsReceivedCopyWith<_TransactionsReceived> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? increment = freezed,
  }) {
    return _then(_CycleAccount(
      increment: increment == freezed
          ? _value.increment
          : increment // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CycleAccount implements _CycleAccount {
  const _$_CycleAccount({required this.increment});

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

  @JsonKey(ignore: true)
  @override
  _$CycleAccountCopyWith<_CycleAccount> get copyWith =>
      __$CycleAccountCopyWithImpl<_CycleAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchTransactionsStarted,
    required TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)
        transactionsReceived,
    required TResult Function(bool increment) cycleAccount,
  }) {
    return cycleAccount(increment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
    required TResult orElse(),
  }) {
    if (cycleAccount != null) {
      return cycleAccount(increment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionWatchStarted value)
        watchTransactionsStarted,
    required TResult Function(_TransactionsReceived value) transactionsReceived,
    required TResult Function(_CycleAccount value) cycleAccount,
  }) {
    return cycleAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    required TResult orElse(),
  }) {
    if (cycleAccount != null) {
      return cycleAccount(this);
    }
    return orElse();
  }
}

abstract class _CycleAccount implements TransactionWatcherEvent {
  const factory _CycleAccount({required bool increment}) = _$_CycleAccount;

  bool get increment => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$CycleAccountCopyWith<_CycleAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
class _$TransactionWatcherStateTearOff {
  const _$TransactionWatcherStateTearOff();

  _Initial initial() {
    return const _Initial();
  }

  _Loading loading() {
    return const _Loading();
  }

  _TransactionLoadSuccess loadSuccess(List<MoneyTransaction> transactions) {
    return _TransactionLoadSuccess(
      transactions,
    );
  }

  _TransactionLoadFailure loadFailure(
      ValueFailure<dynamic> transactionFailure) {
    return _TransactionLoadFailure(
      transactionFailure,
    );
  }
}

/// @nodoc
const $TransactionWatcherState = _$TransactionWatcherStateTearOff();

/// @nodoc
mixin _$TransactionWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MoneyTransaction> transactions) loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TransactionLoadSuccess value) loadSuccess,
    required TResult Function(_TransactionLoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MoneyTransaction> transactions) loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
    required TResult Function(_TransactionLoadSuccess value) loadSuccess,
    required TResult Function(_TransactionLoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
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
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MoneyTransaction> transactions) loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
    required TResult Function(_TransactionLoadSuccess value) loadSuccess,
    required TResult Function(_TransactionLoadFailure value) loadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
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
    Object? transactions = freezed,
  }) {
    return _then(_TransactionLoadSuccess(
      transactions == freezed
          ? _value.transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<MoneyTransaction>,
    ));
  }
}

/// @nodoc

class _$_TransactionLoadSuccess implements _TransactionLoadSuccess {
  const _$_TransactionLoadSuccess(this.transactions);

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

  @JsonKey(ignore: true)
  @override
  _$TransactionLoadSuccessCopyWith<_TransactionLoadSuccess> get copyWith =>
      __$TransactionLoadSuccessCopyWithImpl<_TransactionLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MoneyTransaction> transactions) loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return loadSuccess(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TransactionLoadSuccess value) loadSuccess,
    required TResult Function(_TransactionLoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _TransactionLoadSuccess implements TransactionWatcherState {
  const factory _TransactionLoadSuccess(List<MoneyTransaction> transactions) =
      _$_TransactionLoadSuccess;

  List<MoneyTransaction> get transactions => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TransactionLoadSuccessCopyWith<_TransactionLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
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
    Object? transactionFailure = freezed,
  }) {
    return _then(_TransactionLoadFailure(
      transactionFailure == freezed
          ? _value.transactionFailure
          : transactionFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get transactionFailure {
    return $ValueFailureCopyWith<dynamic, $Res>(_value.transactionFailure,
        (value) {
      return _then(_value.copyWith(transactionFailure: value));
    });
  }
}

/// @nodoc

class _$_TransactionLoadFailure implements _TransactionLoadFailure {
  const _$_TransactionLoadFailure(this.transactionFailure);

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

  @JsonKey(ignore: true)
  @override
  _$TransactionLoadFailureCopyWith<_TransactionLoadFailure> get copyWith =>
      __$TransactionLoadFailureCopyWithImpl<_TransactionLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<MoneyTransaction> transactions) loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return loadFailure(transactionFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(transactionFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_TransactionLoadSuccess value) loadSuccess,
    required TResult Function(_TransactionLoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _TransactionLoadFailure implements TransactionWatcherState {
  const factory _TransactionLoadFailure(
      ValueFailure<dynamic> transactionFailure) = _$_TransactionLoadFailure;

  ValueFailure<dynamic> get transactionFailure =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$TransactionLoadFailureCopyWith<_TransactionLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
