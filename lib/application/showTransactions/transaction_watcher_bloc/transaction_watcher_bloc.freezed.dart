// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
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
abstract class _$$_TransactionWatchStartedCopyWith<$Res> {
  factory _$$_TransactionWatchStartedCopyWith(_$_TransactionWatchStarted value,
          $Res Function(_$_TransactionWatchStarted) then) =
      __$$_TransactionWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TransactionWatchStartedCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res>
    implements _$$_TransactionWatchStartedCopyWith<$Res> {
  __$$_TransactionWatchStartedCopyWithImpl(_$_TransactionWatchStarted _value,
      $Res Function(_$_TransactionWatchStarted) _then)
      : super(_value, (v) => _then(v as _$_TransactionWatchStarted));

  @override
  _$_TransactionWatchStarted get _value =>
      super._value as _$_TransactionWatchStarted;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionWatchStarted);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
  }) {
    return watchTransactionsStarted?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
  }) {
    return watchTransactionsStarted?.call(this);
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
abstract class _$$_TransactionsReceivedCopyWith<$Res> {
  factory _$$_TransactionsReceivedCopyWith(_$_TransactionsReceived value,
          $Res Function(_$_TransactionsReceived) then) =
      __$$_TransactionsReceivedCopyWithImpl<$Res>;
  $Res call(
      {Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions});
}

/// @nodoc
class __$$_TransactionsReceivedCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res>
    implements _$$_TransactionsReceivedCopyWith<$Res> {
  __$$_TransactionsReceivedCopyWithImpl(_$_TransactionsReceived _value,
      $Res Function(_$_TransactionsReceived) _then)
      : super(_value, (v) => _then(v as _$_TransactionsReceived));

  @override
  _$_TransactionsReceived get _value => super._value as _$_TransactionsReceived;

  @override
  $Res call({
    Object? failureOrTransactions = freezed,
  }) {
    return _then(_$_TransactionsReceived(
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
        (other.runtimeType == runtimeType &&
            other is _$_TransactionsReceived &&
            const DeepCollectionEquality()
                .equals(other.failureOrTransactions, failureOrTransactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureOrTransactions));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionsReceivedCopyWith<_$_TransactionsReceived> get copyWith =>
      __$$_TransactionsReceivedCopyWithImpl<_$_TransactionsReceived>(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
  }) {
    return transactionsReceived?.call(failureOrTransactions);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
  }) {
    return transactionsReceived?.call(this);
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
      final Either<ValueFailure, List<MoneyTransaction>>
          failureOrTransactions) = _$_TransactionsReceived;

  Either<ValueFailure, List<MoneyTransaction>> get failureOrTransactions;
  @JsonKey(ignore: true)
  _$$_TransactionsReceivedCopyWith<_$_TransactionsReceived> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_CycleAccountCopyWith<$Res> {
  factory _$$_CycleAccountCopyWith(
          _$_CycleAccount value, $Res Function(_$_CycleAccount) then) =
      __$$_CycleAccountCopyWithImpl<$Res>;
  $Res call({bool increment});
}

/// @nodoc
class __$$_CycleAccountCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res>
    implements _$$_CycleAccountCopyWith<$Res> {
  __$$_CycleAccountCopyWithImpl(
      _$_CycleAccount _value, $Res Function(_$_CycleAccount) _then)
      : super(_value, (v) => _then(v as _$_CycleAccount));

  @override
  _$_CycleAccount get _value => super._value as _$_CycleAccount;

  @override
  $Res call({
    Object? increment = freezed,
  }) {
    return _then(_$_CycleAccount(
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
        (other.runtimeType == runtimeType &&
            other is _$_CycleAccount &&
            const DeepCollectionEquality().equals(other.increment, increment));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(increment));

  @JsonKey(ignore: true)
  @override
  _$$_CycleAccountCopyWith<_$_CycleAccount> get copyWith =>
      __$$_CycleAccountCopyWithImpl<_$_CycleAccount>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
  }) {
    return cycleAccount?.call(increment);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
  }) {
    return cycleAccount?.call(this);
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
  const factory _CycleAccount({required final bool increment}) =
      _$_CycleAccount;

  bool get increment;
  @JsonKey(ignore: true)
  _$$_CycleAccountCopyWith<_$_CycleAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
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
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
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
    return 'TransactionWatcherState.initial()';
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
    required TResult Function(List<MoneyTransaction> transactions) loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return initial?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
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
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
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
    return 'TransactionWatcherState.loading()';
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
    required TResult Function(List<MoneyTransaction> transactions) loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return loading?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
  }) {
    return loading?.call(this);
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
abstract class _$$_TransactionLoadSuccessCopyWith<$Res> {
  factory _$$_TransactionLoadSuccessCopyWith(_$_TransactionLoadSuccess value,
          $Res Function(_$_TransactionLoadSuccess) then) =
      __$$_TransactionLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<MoneyTransaction> transactions});
}

/// @nodoc
class __$$_TransactionLoadSuccessCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
    implements _$$_TransactionLoadSuccessCopyWith<$Res> {
  __$$_TransactionLoadSuccessCopyWithImpl(_$_TransactionLoadSuccess _value,
      $Res Function(_$_TransactionLoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_TransactionLoadSuccess));

  @override
  _$_TransactionLoadSuccess get _value =>
      super._value as _$_TransactionLoadSuccess;

  @override
  $Res call({
    Object? transactions = freezed,
  }) {
    return _then(_$_TransactionLoadSuccess(
      transactions == freezed
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<MoneyTransaction>,
    ));
  }
}

/// @nodoc

class _$_TransactionLoadSuccess implements _TransactionLoadSuccess {
  const _$_TransactionLoadSuccess(final List<MoneyTransaction> transactions)
      : _transactions = transactions;

  final List<MoneyTransaction> _transactions;
  @override
  List<MoneyTransaction> get transactions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionWatcherState.loadSuccess(transactions: $transactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionLoadSuccess &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionLoadSuccessCopyWith<_$_TransactionLoadSuccess> get copyWith =>
      __$$_TransactionLoadSuccessCopyWithImpl<_$_TransactionLoadSuccess>(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return loadSuccess?.call(transactions);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
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
  const factory _TransactionLoadSuccess(
      final List<MoneyTransaction> transactions) = _$_TransactionLoadSuccess;

  List<MoneyTransaction> get transactions;
  @JsonKey(ignore: true)
  _$$_TransactionLoadSuccessCopyWith<_$_TransactionLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TransactionLoadFailureCopyWith<$Res> {
  factory _$$_TransactionLoadFailureCopyWith(_$_TransactionLoadFailure value,
          $Res Function(_$_TransactionLoadFailure) then) =
      __$$_TransactionLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> transactionFailure});

  $ValueFailureCopyWith<dynamic, $Res> get transactionFailure;
}

/// @nodoc
class __$$_TransactionLoadFailureCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res>
    implements _$$_TransactionLoadFailureCopyWith<$Res> {
  __$$_TransactionLoadFailureCopyWithImpl(_$_TransactionLoadFailure _value,
      $Res Function(_$_TransactionLoadFailure) _then)
      : super(_value, (v) => _then(v as _$_TransactionLoadFailure));

  @override
  _$_TransactionLoadFailure get _value =>
      super._value as _$_TransactionLoadFailure;

  @override
  $Res call({
    Object? transactionFailure = freezed,
  }) {
    return _then(_$_TransactionLoadFailure(
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
        (other.runtimeType == runtimeType &&
            other is _$_TransactionLoadFailure &&
            const DeepCollectionEquality()
                .equals(other.transactionFailure, transactionFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(transactionFailure));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionLoadFailureCopyWith<_$_TransactionLoadFailure> get copyWith =>
      __$$_TransactionLoadFailureCopyWithImpl<_$_TransactionLoadFailure>(
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<MoneyTransaction> transactions)? loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return loadFailure?.call(transactionFailure);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult Function(_TransactionLoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
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
          final ValueFailure<dynamic> transactionFailure) =
      _$_TransactionLoadFailure;

  ValueFailure<dynamic> get transactionFailure;
  @JsonKey(ignore: true)
  _$$_TransactionLoadFailureCopyWith<_$_TransactionLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
