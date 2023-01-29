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
  Account? get account => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account? account) watchTransactionsStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Account? account)? watchTransactionsStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account? account)? watchTransactionsStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionWatchStarted value)
        watchTransactionsStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionWatcherEventCopyWith<TransactionWatcherEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionWatcherEventCopyWith<$Res> {
  factory $TransactionWatcherEventCopyWith(TransactionWatcherEvent value,
          $Res Function(TransactionWatcherEvent) then) =
      _$TransactionWatcherEventCopyWithImpl<$Res>;
  $Res call({Account? account});

  $AccountCopyWith<$Res>? get account;
}

/// @nodoc
class _$TransactionWatcherEventCopyWithImpl<$Res>
    implements $TransactionWatcherEventCopyWith<$Res> {
  _$TransactionWatcherEventCopyWithImpl(this._value, this._then);

  final TransactionWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(TransactionWatcherEvent) _then;

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }

  @override
  $AccountCopyWith<$Res>? get account {
    if (_value.account == null) {
      return null;
    }

    return $AccountCopyWith<$Res>(_value.account!, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
abstract class _$$_TransactionWatchStartedCopyWith<$Res>
    implements $TransactionWatcherEventCopyWith<$Res> {
  factory _$$_TransactionWatchStartedCopyWith(_$_TransactionWatchStarted value,
          $Res Function(_$_TransactionWatchStarted) then) =
      __$$_TransactionWatchStartedCopyWithImpl<$Res>;
  @override
  $Res call({Account? account});

  @override
  $AccountCopyWith<$Res>? get account;
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

  @override
  $Res call({
    Object? account = freezed,
  }) {
    return _then(_$_TransactionWatchStarted(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }
}

/// @nodoc

class _$_TransactionWatchStarted implements _TransactionWatchStarted {
  const _$_TransactionWatchStarted({required this.account});

  @override
  final Account? account;

  @override
  String toString() {
    return 'TransactionWatcherEvent.watchTransactionsStarted(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionWatchStarted &&
            const DeepCollectionEquality().equals(other.account, account));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(account));

  @JsonKey(ignore: true)
  @override
  _$$_TransactionWatchStartedCopyWith<_$_TransactionWatchStarted>
      get copyWith =>
          __$$_TransactionWatchStartedCopyWithImpl<_$_TransactionWatchStarted>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Account? account) watchTransactionsStarted,
  }) {
    return watchTransactionsStarted(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(Account? account)? watchTransactionsStarted,
  }) {
    return watchTransactionsStarted?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Account? account)? watchTransactionsStarted,
    required TResult orElse(),
  }) {
    if (watchTransactionsStarted != null) {
      return watchTransactionsStarted(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TransactionWatchStarted value)
        watchTransactionsStarted,
  }) {
    return watchTransactionsStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
  }) {
    return watchTransactionsStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TransactionWatchStarted value)? watchTransactionsStarted,
    required TResult orElse(),
  }) {
    if (watchTransactionsStarted != null) {
      return watchTransactionsStarted(this);
    }
    return orElse();
  }
}

abstract class _TransactionWatchStarted implements TransactionWatcherEvent {
  const factory _TransactionWatchStarted({required final Account? account}) =
      _$_TransactionWatchStarted;

  @override
  Account? get account;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionWatchStartedCopyWith<_$_TransactionWatchStarted>
      get copyWith => throw _privateConstructorUsedError;
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
  $Res call({List<MoneyTransaction> transactions, Account? currentAccount});

  $AccountCopyWith<$Res>? get currentAccount;
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
    Object? currentAccount = freezed,
  }) {
    return _then(_$_TransactionLoadSuccess(
      transactions == freezed
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<MoneyTransaction>,
      currentAccount == freezed
          ? _value.currentAccount
          : currentAccount // ignore: cast_nullable_to_non_nullable
              as Account?,
    ));
  }

  @override
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
            const DeepCollectionEquality()
                .equals(other.currentAccount, currentAccount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_transactions),
      const DeepCollectionEquality().hash(currentAccount));

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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            List<MoneyTransaction> transactions, Account? currentAccount)?
        loadSuccess,
    TResult Function(ValueFailure<dynamic> transactionFailure)? loadFailure,
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
