// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccountWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAccountsStarted,
    required TResult Function(Account account) deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAccountsStarted,
    TResult? Function(Account account)? deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Account account)? deleteAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountWatchStarted value) watchAccountsStarted,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult? Function(_DeleteAccount value)? deleteAccount,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountWatcherEventCopyWith<$Res> {
  factory $AccountWatcherEventCopyWith(
          AccountWatcherEvent value, $Res Function(AccountWatcherEvent) then) =
      _$AccountWatcherEventCopyWithImpl<$Res, AccountWatcherEvent>;
}

/// @nodoc
class _$AccountWatcherEventCopyWithImpl<$Res, $Val extends AccountWatcherEvent>
    implements $AccountWatcherEventCopyWith<$Res> {
  _$AccountWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_AccountWatchStartedCopyWith<$Res> {
  factory _$$_AccountWatchStartedCopyWith(_$_AccountWatchStarted value,
          $Res Function(_$_AccountWatchStarted) then) =
      __$$_AccountWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountWatchStartedCopyWithImpl<$Res>
    extends _$AccountWatcherEventCopyWithImpl<$Res, _$_AccountWatchStarted>
    implements _$$_AccountWatchStartedCopyWith<$Res> {
  __$$_AccountWatchStartedCopyWithImpl(_$_AccountWatchStarted _value,
      $Res Function(_$_AccountWatchStarted) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AccountWatchStarted implements _AccountWatchStarted {
  const _$_AccountWatchStarted();

  @override
  String toString() {
    return 'AccountWatcherEvent.watchAccountsStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AccountWatchStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAccountsStarted,
    required TResult Function(Account account) deleteAccount,
  }) {
    return watchAccountsStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAccountsStarted,
    TResult? Function(Account account)? deleteAccount,
  }) {
    return watchAccountsStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Account account)? deleteAccount,
    required TResult orElse(),
  }) {
    if (watchAccountsStarted != null) {
      return watchAccountsStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountWatchStarted value) watchAccountsStarted,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    return watchAccountsStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult? Function(_DeleteAccount value)? deleteAccount,
  }) {
    return watchAccountsStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    if (watchAccountsStarted != null) {
      return watchAccountsStarted(this);
    }
    return orElse();
  }
}

abstract class _AccountWatchStarted implements AccountWatcherEvent {
  const factory _AccountWatchStarted() = _$_AccountWatchStarted;
}

/// @nodoc
abstract class _$$_DeleteAccountCopyWith<$Res> {
  factory _$$_DeleteAccountCopyWith(
          _$_DeleteAccount value, $Res Function(_$_DeleteAccount) then) =
      __$$_DeleteAccountCopyWithImpl<$Res>;
  @useResult
  $Res call({Account account});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$$_DeleteAccountCopyWithImpl<$Res>
    extends _$AccountWatcherEventCopyWithImpl<$Res, _$_DeleteAccount>
    implements _$$_DeleteAccountCopyWith<$Res> {
  __$$_DeleteAccountCopyWithImpl(
      _$_DeleteAccount _value, $Res Function(_$_DeleteAccount) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = null,
  }) {
    return _then(_$_DeleteAccount(
      null == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc

class _$_DeleteAccount implements _DeleteAccount {
  const _$_DeleteAccount(this.account);

  @override
  final Account account;

  @override
  String toString() {
    return 'AccountWatcherEvent.deleteAccount(account: $account)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteAccount &&
            (identical(other.account, account) || other.account == account));
  }

  @override
  int get hashCode => Object.hash(runtimeType, account);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteAccountCopyWith<_$_DeleteAccount> get copyWith =>
      __$$_DeleteAccountCopyWithImpl<_$_DeleteAccount>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAccountsStarted,
    required TResult Function(Account account) deleteAccount,
  }) {
    return deleteAccount(account);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? watchAccountsStarted,
    TResult? Function(Account account)? deleteAccount,
  }) {
    return deleteAccount?.call(account);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Account account)? deleteAccount,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount(account);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountWatchStarted value) watchAccountsStarted,
    required TResult Function(_DeleteAccount value) deleteAccount,
  }) {
    return deleteAccount(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult? Function(_DeleteAccount value)? deleteAccount,
  }) {
    return deleteAccount?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_DeleteAccount value)? deleteAccount,
    required TResult orElse(),
  }) {
    if (deleteAccount != null) {
      return deleteAccount(this);
    }
    return orElse();
  }
}

abstract class _DeleteAccount implements AccountWatcherEvent {
  const factory _DeleteAccount(final Account account) = _$_DeleteAccount;

  Account get account;
  @JsonKey(ignore: true)
  _$$_DeleteAccountCopyWith<_$_DeleteAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AccountWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Account> accounts) loadSuccess,
    required TResult Function(ValueFailure<dynamic> accountFailure) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Account> accounts)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> accountFailure)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AccountLoadSuccess value) loadSuccess,
    required TResult Function(_AccountLoadFailure value) loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AccountLoadSuccess value)? loadSuccess,
    TResult? Function(_AccountLoadFailure value)? loadFailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountWatcherStateCopyWith<$Res> {
  factory $AccountWatcherStateCopyWith(
          AccountWatcherState value, $Res Function(AccountWatcherState) then) =
      _$AccountWatcherStateCopyWithImpl<$Res, AccountWatcherState>;
}

/// @nodoc
class _$AccountWatcherStateCopyWithImpl<$Res, $Val extends AccountWatcherState>
    implements $AccountWatcherStateCopyWith<$Res> {
  _$AccountWatcherStateCopyWithImpl(this._value, this._then);

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
    extends _$AccountWatcherStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AccountWatcherState.initial()';
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
    required TResult Function(List<Account> accounts) loadSuccess,
    required TResult Function(ValueFailure<dynamic> accountFailure) loadFailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Account> accounts)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> accountFailure)? loadFailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
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
    required TResult Function(_AccountLoadSuccess value) loadSuccess,
    required TResult Function(_AccountLoadFailure value) loadFailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AccountLoadSuccess value)? loadSuccess,
    TResult? Function(_AccountLoadFailure value)? loadFailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AccountWatcherState {
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
    extends _$AccountWatcherStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'AccountWatcherState.loading()';
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
    required TResult Function(List<Account> accounts) loadSuccess,
    required TResult Function(ValueFailure<dynamic> accountFailure) loadFailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Account> accounts)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> accountFailure)? loadFailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
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
    required TResult Function(_AccountLoadSuccess value) loadSuccess,
    required TResult Function(_AccountLoadFailure value) loadFailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AccountLoadSuccess value)? loadSuccess,
    TResult? Function(_AccountLoadFailure value)? loadFailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AccountWatcherState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_AccountLoadSuccessCopyWith<$Res> {
  factory _$$_AccountLoadSuccessCopyWith(_$_AccountLoadSuccess value,
          $Res Function(_$_AccountLoadSuccess) then) =
      __$$_AccountLoadSuccessCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Account> accounts});
}

/// @nodoc
class __$$_AccountLoadSuccessCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res, _$_AccountLoadSuccess>
    implements _$$_AccountLoadSuccessCopyWith<$Res> {
  __$$_AccountLoadSuccessCopyWithImpl(
      _$_AccountLoadSuccess _value, $Res Function(_$_AccountLoadSuccess) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accounts = null,
  }) {
    return _then(_$_AccountLoadSuccess(
      null == accounts
          ? _value._accounts
          : accounts // ignore: cast_nullable_to_non_nullable
              as List<Account>,
    ));
  }
}

/// @nodoc

class _$_AccountLoadSuccess implements _AccountLoadSuccess {
  const _$_AccountLoadSuccess(final List<Account> accounts)
      : _accounts = accounts;

  final List<Account> _accounts;
  @override
  List<Account> get accounts {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_accounts);
  }

  @override
  String toString() {
    return 'AccountWatcherState.loadSuccess(accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountLoadSuccess &&
            const DeepCollectionEquality().equals(other._accounts, _accounts));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_accounts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountLoadSuccessCopyWith<_$_AccountLoadSuccess> get copyWith =>
      __$$_AccountLoadSuccessCopyWithImpl<_$_AccountLoadSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Account> accounts) loadSuccess,
    required TResult Function(ValueFailure<dynamic> accountFailure) loadFailure,
  }) {
    return loadSuccess(accounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Account> accounts)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> accountFailure)? loadFailure,
  }) {
    return loadSuccess?.call(accounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(accounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AccountLoadSuccess value) loadSuccess,
    required TResult Function(_AccountLoadFailure value) loadFailure,
  }) {
    return loadSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AccountLoadSuccess value)? loadSuccess,
    TResult? Function(_AccountLoadFailure value)? loadFailure,
  }) {
    return loadSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _AccountLoadSuccess implements AccountWatcherState {
  const factory _AccountLoadSuccess(final List<Account> accounts) =
      _$_AccountLoadSuccess;

  List<Account> get accounts;
  @JsonKey(ignore: true)
  _$$_AccountLoadSuccessCopyWith<_$_AccountLoadSuccess> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AccountLoadFailureCopyWith<$Res> {
  factory _$$_AccountLoadFailureCopyWith(_$_AccountLoadFailure value,
          $Res Function(_$_AccountLoadFailure) then) =
      __$$_AccountLoadFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({ValueFailure<dynamic> accountFailure});

  $ValueFailureCopyWith<dynamic, $Res> get accountFailure;
}

/// @nodoc
class __$$_AccountLoadFailureCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res, _$_AccountLoadFailure>
    implements _$$_AccountLoadFailureCopyWith<$Res> {
  __$$_AccountLoadFailureCopyWithImpl(
      _$_AccountLoadFailure _value, $Res Function(_$_AccountLoadFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? accountFailure = null,
  }) {
    return _then(_$_AccountLoadFailure(
      null == accountFailure
          ? _value.accountFailure
          : accountFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $ValueFailureCopyWith<dynamic, $Res> get accountFailure {
    return $ValueFailureCopyWith<dynamic, $Res>(_value.accountFailure, (value) {
      return _then(_value.copyWith(accountFailure: value));
    });
  }
}

/// @nodoc

class _$_AccountLoadFailure implements _AccountLoadFailure {
  const _$_AccountLoadFailure(this.accountFailure);

  @override
  final ValueFailure<dynamic> accountFailure;

  @override
  String toString() {
    return 'AccountWatcherState.loadFailure(accountFailure: $accountFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountLoadFailure &&
            (identical(other.accountFailure, accountFailure) ||
                other.accountFailure == accountFailure));
  }

  @override
  int get hashCode => Object.hash(runtimeType, accountFailure);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AccountLoadFailureCopyWith<_$_AccountLoadFailure> get copyWith =>
      __$$_AccountLoadFailureCopyWithImpl<_$_AccountLoadFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<Account> accounts) loadSuccess,
    required TResult Function(ValueFailure<dynamic> accountFailure) loadFailure,
  }) {
    return loadFailure(accountFailure);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<Account> accounts)? loadSuccess,
    TResult? Function(ValueFailure<dynamic> accountFailure)? loadFailure,
  }) {
    return loadFailure?.call(accountFailure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(accountFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AccountLoadSuccess value) loadSuccess,
    required TResult Function(_AccountLoadFailure value) loadFailure,
  }) {
    return loadFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AccountLoadSuccess value)? loadSuccess,
    TResult? Function(_AccountLoadFailure value)? loadFailure,
  }) {
    return loadFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
    required TResult orElse(),
  }) {
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _AccountLoadFailure implements AccountWatcherState {
  const factory _AccountLoadFailure(
      final ValueFailure<dynamic> accountFailure) = _$_AccountLoadFailure;

  ValueFailure<dynamic> get accountFailure;
  @JsonKey(ignore: true)
  _$$_AccountLoadFailureCopyWith<_$_AccountLoadFailure> get copyWith =>
      throw _privateConstructorUsedError;
}
