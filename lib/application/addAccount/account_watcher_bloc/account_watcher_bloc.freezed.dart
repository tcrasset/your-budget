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
    required TResult Function(
            Either<ValueFailure, List<Account>> failureOrAccounts)
        accountsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Either<ValueFailure, List<Account>> failureOrAccounts)?
        accountsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Either<ValueFailure, List<Account>> failureOrAccounts)?
        accountsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountWatchStarted value) watchAccountsStarted,
    required TResult Function(_AccountsReceived value) accountsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_AccountsReceived value)? accountsReceived,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_AccountsReceived value)? accountsReceived,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountWatcherEventCopyWith<$Res> {
  factory $AccountWatcherEventCopyWith(
          AccountWatcherEvent value, $Res Function(AccountWatcherEvent) then) =
      _$AccountWatcherEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountWatcherEventCopyWithImpl<$Res>
    implements $AccountWatcherEventCopyWith<$Res> {
  _$AccountWatcherEventCopyWithImpl(this._value, this._then);

  final AccountWatcherEvent _value;
  // ignore: unused_field
  final $Res Function(AccountWatcherEvent) _then;
}

/// @nodoc
abstract class _$$_AccountWatchStartedCopyWith<$Res> {
  factory _$$_AccountWatchStartedCopyWith(_$_AccountWatchStarted value,
          $Res Function(_$_AccountWatchStarted) then) =
      __$$_AccountWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AccountWatchStartedCopyWithImpl<$Res>
    extends _$AccountWatcherEventCopyWithImpl<$Res>
    implements _$$_AccountWatchStartedCopyWith<$Res> {
  __$$_AccountWatchStartedCopyWithImpl(_$_AccountWatchStarted _value,
      $Res Function(_$_AccountWatchStarted) _then)
      : super(_value, (v) => _then(v as _$_AccountWatchStarted));

  @override
  _$_AccountWatchStarted get _value => super._value as _$_AccountWatchStarted;
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
    required TResult Function(
            Either<ValueFailure, List<Account>> failureOrAccounts)
        accountsReceived,
  }) {
    return watchAccountsStarted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Either<ValueFailure, List<Account>> failureOrAccounts)?
        accountsReceived,
  }) {
    return watchAccountsStarted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Either<ValueFailure, List<Account>> failureOrAccounts)?
        accountsReceived,
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
    required TResult Function(_AccountsReceived value) accountsReceived,
  }) {
    return watchAccountsStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_AccountsReceived value)? accountsReceived,
  }) {
    return watchAccountsStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_AccountsReceived value)? accountsReceived,
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
abstract class _$$_AccountsReceivedCopyWith<$Res> {
  factory _$$_AccountsReceivedCopyWith(
          _$_AccountsReceived value, $Res Function(_$_AccountsReceived) then) =
      __$$_AccountsReceivedCopyWithImpl<$Res>;
  $Res call({Either<ValueFailure, List<Account>> failureOrAccounts});
}

/// @nodoc
class __$$_AccountsReceivedCopyWithImpl<$Res>
    extends _$AccountWatcherEventCopyWithImpl<$Res>
    implements _$$_AccountsReceivedCopyWith<$Res> {
  __$$_AccountsReceivedCopyWithImpl(
      _$_AccountsReceived _value, $Res Function(_$_AccountsReceived) _then)
      : super(_value, (v) => _then(v as _$_AccountsReceived));

  @override
  _$_AccountsReceived get _value => super._value as _$_AccountsReceived;

  @override
  $Res call({
    Object? failureOrAccounts = freezed,
  }) {
    return _then(_$_AccountsReceived(
      failureOrAccounts == freezed
          ? _value.failureOrAccounts
          : failureOrAccounts // ignore: cast_nullable_to_non_nullable
              as Either<ValueFailure, List<Account>>,
    ));
  }
}

/// @nodoc

class _$_AccountsReceived implements _AccountsReceived {
  const _$_AccountsReceived(this.failureOrAccounts);

  @override
  final Either<ValueFailure, List<Account>> failureOrAccounts;

  @override
  String toString() {
    return 'AccountWatcherEvent.accountsReceived(failureOrAccounts: $failureOrAccounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountsReceived &&
            const DeepCollectionEquality()
                .equals(other.failureOrAccounts, failureOrAccounts));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(failureOrAccounts));

  @JsonKey(ignore: true)
  @override
  _$$_AccountsReceivedCopyWith<_$_AccountsReceived> get copyWith =>
      __$$_AccountsReceivedCopyWithImpl<_$_AccountsReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() watchAccountsStarted,
    required TResult Function(
            Either<ValueFailure, List<Account>> failureOrAccounts)
        accountsReceived,
  }) {
    return accountsReceived(failureOrAccounts);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Either<ValueFailure, List<Account>> failureOrAccounts)?
        accountsReceived,
  }) {
    return accountsReceived?.call(failureOrAccounts);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? watchAccountsStarted,
    TResult Function(Either<ValueFailure, List<Account>> failureOrAccounts)?
        accountsReceived,
    required TResult orElse(),
  }) {
    if (accountsReceived != null) {
      return accountsReceived(failureOrAccounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AccountWatchStarted value) watchAccountsStarted,
    required TResult Function(_AccountsReceived value) accountsReceived,
  }) {
    return accountsReceived(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_AccountsReceived value)? accountsReceived,
  }) {
    return accountsReceived?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AccountWatchStarted value)? watchAccountsStarted,
    TResult Function(_AccountsReceived value)? accountsReceived,
    required TResult orElse(),
  }) {
    if (accountsReceived != null) {
      return accountsReceived(this);
    }
    return orElse();
  }
}

abstract class _AccountsReceived implements AccountWatcherEvent {
  const factory _AccountsReceived(
          final Either<ValueFailure, List<Account>> failureOrAccounts) =
      _$_AccountsReceived;

  Either<ValueFailure, List<Account>> get failureOrAccounts;
  @JsonKey(ignore: true)
  _$$_AccountsReceivedCopyWith<_$_AccountsReceived> get copyWith =>
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
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
      _$AccountWatcherStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountWatcherStateCopyWithImpl<$Res>
    implements $AccountWatcherStateCopyWith<$Res> {
  _$AccountWatcherStateCopyWithImpl(this._value, this._then);

  final AccountWatcherState _value;
  // ignore: unused_field
  final $Res Function(AccountWatcherState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res>
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
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
    extends _$AccountWatcherStateCopyWithImpl<$Res>
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
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
  $Res call({List<Account> accounts});
}

/// @nodoc
class __$$_AccountLoadSuccessCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res>
    implements _$$_AccountLoadSuccessCopyWith<$Res> {
  __$$_AccountLoadSuccessCopyWithImpl(
      _$_AccountLoadSuccess _value, $Res Function(_$_AccountLoadSuccess) _then)
      : super(_value, (v) => _then(v as _$_AccountLoadSuccess));

  @override
  _$_AccountLoadSuccess get _value => super._value as _$_AccountLoadSuccess;

  @override
  $Res call({
    Object? accounts = freezed,
  }) {
    return _then(_$_AccountLoadSuccess(
      accounts == freezed
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
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
  $Res call({ValueFailure<dynamic> accountFailure});

  $ValueFailureCopyWith<dynamic, $Res> get accountFailure;
}

/// @nodoc
class __$$_AccountLoadFailureCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res>
    implements _$$_AccountLoadFailureCopyWith<$Res> {
  __$$_AccountLoadFailureCopyWithImpl(
      _$_AccountLoadFailure _value, $Res Function(_$_AccountLoadFailure) _then)
      : super(_value, (v) => _then(v as _$_AccountLoadFailure));

  @override
  _$_AccountLoadFailure get _value => super._value as _$_AccountLoadFailure;

  @override
  $Res call({
    Object? accountFailure = freezed,
  }) {
    return _then(_$_AccountLoadFailure(
      accountFailure == freezed
          ? _value.accountFailure
          : accountFailure // ignore: cast_nullable_to_non_nullable
              as ValueFailure<dynamic>,
    ));
  }

  @override
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
            const DeepCollectionEquality()
                .equals(other.accountFailure, accountFailure));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(accountFailure));

  @JsonKey(ignore: true)
  @override
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<Account> accounts)? loadSuccess,
    TResult Function(ValueFailure<dynamic> accountFailure)? loadFailure,
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AccountLoadSuccess value)? loadSuccess,
    TResult Function(_AccountLoadFailure value)? loadFailure,
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
