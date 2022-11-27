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
    required TResult Function(String id) selectTransaction,
    required TResult Function() deleteSelectedTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchTransactionsStarted,
    TResult? Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult? Function(bool increment)? cycleAccount,
    TResult? Function(String id)? selectTransaction,
    TResult? Function()? deleteSelectedTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
    TResult Function(String id)? selectTransaction,
    TResult Function()? deleteSelectedTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionWatchStarted value)
        watchTransactionsStarted,
    required TResult Function(_TransactionsReceived value) transactionsReceived,
    required TResult Function(_CycleAccount value) cycleAccount,
    required TResult Function(_TransactionSelected value) selectTransaction,
    required TResult Function(_DeleteSelectedTransactions value)
        deleteSelectedTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult? Function(_TransactionsReceived value)? transactionsReceived,
    TResult? Function(_CycleAccount value)? cycleAccount,
    TResult? Function(_TransactionSelected value)? selectTransaction,
    TResult? Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    TResult Function(_TransactionSelected value)? selectTransaction,
    TResult Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionWatcherEventCopyWith<$Res> {
  factory $TransactionWatcherEventCopyWith(TransactionWatcherEvent value,
          $Res Function(TransactionWatcherEvent) then) =
      _$TransactionWatcherEventCopyWithImpl<$Res, TransactionWatcherEvent>;
}

/// @nodoc
class _$TransactionWatcherEventCopyWithImpl<$Res,
        $Val extends TransactionWatcherEvent>
    implements $TransactionWatcherEventCopyWith<$Res> {
  _$TransactionWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_TransactionWatchStartedCopyWith<$Res> {
  factory _$$_TransactionWatchStartedCopyWith(_$_TransactionWatchStarted value,
          $Res Function(_$_TransactionWatchStarted) then) =
      __$$_TransactionWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_TransactionWatchStartedCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res,
        _$_TransactionWatchStarted>
    implements _$$_TransactionWatchStartedCopyWith<$Res> {
  __$$_TransactionWatchStartedCopyWithImpl(_$_TransactionWatchStarted _value,
      $Res Function(_$_TransactionWatchStarted) _then)
      : super(_value, _then);
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
    required TResult Function(String id) selectTransaction,
    required TResult Function() deleteSelectedTransactions,
  }) {
    return watchTransactionsStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchTransactionsStarted,
    TResult? Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult? Function(bool increment)? cycleAccount,
    TResult? Function(String id)? selectTransaction,
    TResult? Function()? deleteSelectedTransactions,
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
    TResult Function(String id)? selectTransaction,
    TResult Function()? deleteSelectedTransactions,
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
    required TResult Function(_TransactionSelected value) selectTransaction,
    required TResult Function(_DeleteSelectedTransactions value)
        deleteSelectedTransactions,
  }) {
    return watchTransactionsStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult? Function(_TransactionsReceived value)? transactionsReceived,
    TResult? Function(_CycleAccount value)? cycleAccount,
    TResult? Function(_TransactionSelected value)? selectTransaction,
    TResult? Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
  }) {
    return watchTransactionsStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    TResult Function(_TransactionSelected value)? selectTransaction,
    TResult Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
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
  @useResult
  $Res call(
      {Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions});
}

/// @nodoc
class __$$_TransactionsReceivedCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res, _$_TransactionsReceived>
    implements _$$_TransactionsReceivedCopyWith<$Res> {
  __$$_TransactionsReceivedCopyWithImpl(_$_TransactionsReceived _value,
      $Res Function(_$_TransactionsReceived) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? failureOrTransactions = null,
  }) {
    return _then(_$_TransactionsReceived(
      null == failureOrTransactions
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
            (identical(other.failureOrTransactions, failureOrTransactions) ||
                other.failureOrTransactions == failureOrTransactions));
  }

  @override
  int get hashCode => Object.hash(runtimeType, failureOrTransactions);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    required TResult Function(String id) selectTransaction,
    required TResult Function() deleteSelectedTransactions,
  }) {
    return transactionsReceived(failureOrTransactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchTransactionsStarted,
    TResult? Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult? Function(bool increment)? cycleAccount,
    TResult? Function(String id)? selectTransaction,
    TResult? Function()? deleteSelectedTransactions,
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
    TResult Function(String id)? selectTransaction,
    TResult Function()? deleteSelectedTransactions,
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
    required TResult Function(_TransactionSelected value) selectTransaction,
    required TResult Function(_DeleteSelectedTransactions value)
        deleteSelectedTransactions,
  }) {
    return transactionsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult? Function(_TransactionsReceived value)? transactionsReceived,
    TResult? Function(_CycleAccount value)? cycleAccount,
    TResult? Function(_TransactionSelected value)? selectTransaction,
    TResult? Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
  }) {
    return transactionsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    TResult Function(_TransactionSelected value)? selectTransaction,
    TResult Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
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
  @useResult
  $Res call({bool increment});
}

/// @nodoc
class __$$_CycleAccountCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res, _$_CycleAccount>
    implements _$$_CycleAccountCopyWith<$Res> {
  __$$_CycleAccountCopyWithImpl(
      _$_CycleAccount _value, $Res Function(_$_CycleAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? increment = null,
  }) {
    return _then(_$_CycleAccount(
      increment: null == increment
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
            (identical(other.increment, increment) ||
                other.increment == increment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, increment);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
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
    required TResult Function(String id) selectTransaction,
    required TResult Function() deleteSelectedTransactions,
  }) {
    return cycleAccount(increment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchTransactionsStarted,
    TResult? Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult? Function(bool increment)? cycleAccount,
    TResult? Function(String id)? selectTransaction,
    TResult? Function()? deleteSelectedTransactions,
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
    TResult Function(String id)? selectTransaction,
    TResult Function()? deleteSelectedTransactions,
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
    required TResult Function(_TransactionSelected value) selectTransaction,
    required TResult Function(_DeleteSelectedTransactions value)
        deleteSelectedTransactions,
  }) {
    return cycleAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult? Function(_TransactionsReceived value)? transactionsReceived,
    TResult? Function(_CycleAccount value)? cycleAccount,
    TResult? Function(_TransactionSelected value)? selectTransaction,
    TResult? Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
  }) {
    return cycleAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    TResult Function(_TransactionSelected value)? selectTransaction,
    TResult Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
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
abstract class _$$_TransactionSelectedCopyWith<$Res> {
  factory _$$_TransactionSelectedCopyWith(_$_TransactionSelected value,
          $Res Function(_$_TransactionSelected) then) =
      __$$_TransactionSelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_TransactionSelectedCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res, _$_TransactionSelected>
    implements _$$_TransactionSelectedCopyWith<$Res> {
  __$$_TransactionSelectedCopyWithImpl(_$_TransactionSelected _value,
      $Res Function(_$_TransactionSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_TransactionSelected(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TransactionSelected implements _TransactionSelected {
  const _$_TransactionSelected({required this.id});

  @override
  final String id;

  @override
  String toString() {
    return 'TransactionWatcherEvent.selectTransaction(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionSelected &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionSelectedCopyWith<_$_TransactionSelected> get copyWith =>
      __$$_TransactionSelectedCopyWithImpl<_$_TransactionSelected>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchTransactionsStarted,
    required TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)
        transactionsReceived,
    required TResult Function(bool increment) cycleAccount,
    required TResult Function(String id) selectTransaction,
    required TResult Function() deleteSelectedTransactions,
  }) {
    return selectTransaction(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchTransactionsStarted,
    TResult? Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult? Function(bool increment)? cycleAccount,
    TResult? Function(String id)? selectTransaction,
    TResult? Function()? deleteSelectedTransactions,
  }) {
    return selectTransaction?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
    TResult Function(String id)? selectTransaction,
    TResult Function()? deleteSelectedTransactions,
    required TResult orElse(),
  }) {
    if (selectTransaction != null) {
      return selectTransaction(id);
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
    required TResult Function(_TransactionSelected value) selectTransaction,
    required TResult Function(_DeleteSelectedTransactions value)
        deleteSelectedTransactions,
  }) {
    return selectTransaction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult? Function(_TransactionsReceived value)? transactionsReceived,
    TResult? Function(_CycleAccount value)? cycleAccount,
    TResult? Function(_TransactionSelected value)? selectTransaction,
    TResult? Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
  }) {
    return selectTransaction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    TResult Function(_TransactionSelected value)? selectTransaction,
    TResult Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
    required TResult orElse(),
  }) {
    if (selectTransaction != null) {
      return selectTransaction(this);
    }
    return orElse();
  }
}

abstract class _TransactionSelected implements TransactionWatcherEvent {
  const factory _TransactionSelected({required final String id}) =
      _$_TransactionSelected;

  String get id;
  @JsonKey(ignore: true)
  _$$_TransactionSelectedCopyWith<_$_TransactionSelected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteSelectedTransactionsCopyWith<$Res> {
  factory _$$_DeleteSelectedTransactionsCopyWith(
          _$_DeleteSelectedTransactions value,
          $Res Function(_$_DeleteSelectedTransactions) then) =
      __$$_DeleteSelectedTransactionsCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteSelectedTransactionsCopyWithImpl<$Res>
    extends _$TransactionWatcherEventCopyWithImpl<$Res,
        _$_DeleteSelectedTransactions>
    implements _$$_DeleteSelectedTransactionsCopyWith<$Res> {
  __$$_DeleteSelectedTransactionsCopyWithImpl(
      _$_DeleteSelectedTransactions _value,
      $Res Function(_$_DeleteSelectedTransactions) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_DeleteSelectedTransactions implements _DeleteSelectedTransactions {
  const _$_DeleteSelectedTransactions();

  @override
  String toString() {
    return 'TransactionWatcherEvent.deleteSelectedTransactions()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteSelectedTransactions);
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
    required TResult Function(String id) selectTransaction,
    required TResult Function() deleteSelectedTransactions,
  }) {
    return deleteSelectedTransactions();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchTransactionsStarted,
    TResult? Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult? Function(bool increment)? cycleAccount,
    TResult? Function(String id)? selectTransaction,
    TResult? Function()? deleteSelectedTransactions,
  }) {
    return deleteSelectedTransactions?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchTransactionsStarted,
    TResult Function(
            Either<ValueFailure, List<MoneyTransaction>> failureOrTransactions)?
        transactionsReceived,
    TResult Function(bool increment)? cycleAccount,
    TResult Function(String id)? selectTransaction,
    TResult Function()? deleteSelectedTransactions,
    required TResult orElse(),
  }) {
    if (deleteSelectedTransactions != null) {
      return deleteSelectedTransactions();
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
    required TResult Function(_TransactionSelected value) selectTransaction,
    required TResult Function(_DeleteSelectedTransactions value)
        deleteSelectedTransactions,
  }) {
    return deleteSelectedTransactions(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult? Function(_TransactionsReceived value)? transactionsReceived,
    TResult? Function(_CycleAccount value)? cycleAccount,
    TResult? Function(_TransactionSelected value)? selectTransaction,
    TResult? Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
  }) {
    return deleteSelectedTransactions?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    TResult Function(_TransactionsReceived value)? transactionsReceived,
    TResult Function(_CycleAccount value)? cycleAccount,
    TResult Function(_TransactionSelected value)? selectTransaction,
    TResult Function(_DeleteSelectedTransactions value)?
        deleteSelectedTransactions,
    required TResult orElse(),
  }) {
    if (deleteSelectedTransactions != null) {
      return deleteSelectedTransactions(this);
    }
    return orElse();
  }
}

abstract class _DeleteSelectedTransactions implements TransactionWatcherEvent {
  const factory _DeleteSelectedTransactions() = _$_DeleteSelectedTransactions;
}

/// @nodoc
mixin _$TransactionWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)
        loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult? Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult? Function(_TransactionLoadFailure value)? loadFailure,
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
      _$TransactionWatcherStateCopyWithImpl<$Res, TransactionWatcherState>;
}

/// @nodoc
class _$TransactionWatcherStateCopyWithImpl<$Res,
        $Val extends TransactionWatcherState>
    implements $TransactionWatcherStateCopyWith<$Res> {
  _$TransactionWatcherStateCopyWithImpl(this._value, this._then);

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
    extends _$TransactionWatcherStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
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
    required TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)
        loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult? Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult? Function(_TransactionLoadFailure value)? loadFailure,
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
    extends _$TransactionWatcherStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
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
    required TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)
        loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult? Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult? Function(_TransactionLoadFailure value)? loadFailure,
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
  @useResult
  $Res call({List<MoneyTransaction> transactions, Account? currentAccount});

  $AccountCopyWith<$Res>? get currentAccount;
}

/// @nodoc
class __$$_TransactionLoadSuccessCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res,
        _$_TransactionLoadSuccess>
    implements _$$_TransactionLoadSuccessCopyWith<$Res> {
  __$$_TransactionLoadSuccessCopyWithImpl(_$_TransactionLoadSuccess _value,
      $Res Function(_$_TransactionLoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
    Object? currentAccount = freezed,
  }) {
    return _then(_$_TransactionLoadSuccess(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<MoneyTransaction>,
      freezed == currentAccount
          ? _value.currentAccount
          : currentAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res>? get currentAccount {
    if (_value.currentAccount == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.currentAccount!, (value) {
      return _then(_value.copyWith(currentAccount: value));
    });
  }
}

/// @nodoc

class _$_TransactionLoadSuccess implements _TransactionLoadSuccess {
  const _$_TransactionLoadSuccess(
      final List<MoneyTransaction> transactions, this.currentAccount)
      : _transactions = transactions;

  final List<MoneyTransaction> _transactions;
  @override
  List<MoneyTransaction> get transactions {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  final Account? currentAccount;

  @override
  String toString() {
    return 'TransactionWatcherState.loadSuccess(transactions: $transactions, currentAccount: $currentAccount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionLoadSuccess &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions) &&
            (identical(other.currentAccount, currentAccount) ||
                other.currentAccount == currentAccount));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_transactions), currentAccount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionLoadSuccessCopyWith<_$_TransactionLoadSuccess> get copyWith =>
      __$$_TransactionLoadSuccessCopyWithImpl<_$_TransactionLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)
        loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return loadSuccess(transactions, currentAccount);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult? Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return loadSuccess?.call(transactions, currentAccount);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(transactions, currentAccount);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult? Function(_TransactionLoadFailure value)? loadFailure,
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
      final List<MoneyTransaction> transactions,
      final Account? currentAccount) = _$_TransactionLoadSuccess;

  List<MoneyTransaction> get transactions;
  Account? get currentAccount;
  @JsonKey(ignore: true)
  _$$_TransactionLoadSuccessCopyWith<_$_TransactionLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_TransactionLoadFailureCopyWith<$Res> {
  factory _$$_TransactionLoadFailureCopyWith(_$_TransactionLoadFailure value,
          $Res Function(_$_TransactionLoadFailure) then) =
      __$$_TransactionLoadFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({ValueFailure<dynamic> transactionFailure});

  $ValueFailureCopyWith<dynamic, $Res> get transactionFailure;
}

/// @nodoc
class __$$_TransactionLoadFailureCopyWithImpl<$Res>
    extends _$TransactionWatcherStateCopyWithImpl<$Res,
        _$_TransactionLoadFailure>
    implements _$$_TransactionLoadFailureCopyWith<$Res> {
  __$$_TransactionLoadFailureCopyWithImpl(_$_TransactionLoadFailure _value,
      $Res Function(_$_TransactionLoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactionFailure = null,
  }) {
    return _then(_$_TransactionLoadFailure(
      null == transactionFailure
          ? _value.transactionFailure
          : transactionFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
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
            (identical(other.transactionFailure, transactionFailure) ||
                other.transactionFailure == transactionFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transactionFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionLoadFailureCopyWith<_$_TransactionLoadFailure> get copyWith =>
      __$$_TransactionLoadFailureCopyWithImpl<_$_TransactionLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)
        loadSuccess,
    required TResult Function(ValueFailure<dynamic> transactionFailure)
        loadFailure,
  }) {
    return loadFailure(transactionFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult? Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
  }) {
    return loadFailure?.call(transactionFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_TransactionLoadSuccess value)? loadSuccess,
    TResult? Function(_TransactionLoadFailure value)? loadFailure,
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
