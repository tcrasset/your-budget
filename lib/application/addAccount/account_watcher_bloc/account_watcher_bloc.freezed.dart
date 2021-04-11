// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'account_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AccountWatcherEventTearOff {
  const _$AccountWatcherEventTearOff();

// ignore: unused_element
  _AccountWatchStarted watchAccountsStarted() {
    return const _AccountWatchStarted();
  }

// ignore: unused_element
  _AccountsReceived accountsReceived(
      Either<ValueFailure, List<NewAccount>> failureOrAccounts) {
    return _AccountsReceived(
      failureOrAccounts,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AccountWatcherEvent = _$AccountWatcherEventTearOff();

/// @nodoc
mixin _$AccountWatcherEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchAccountsStarted(),
    @required
        Result accountsReceived(
            Either<ValueFailure, List<NewAccount>> failureOrAccounts),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchAccountsStarted(),
    Result accountsReceived(
        Either<ValueFailure, List<NewAccount>> failureOrAccounts),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchAccountsStarted(_AccountWatchStarted value),
    @required Result accountsReceived(_AccountsReceived value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchAccountsStarted(_AccountWatchStarted value),
    Result accountsReceived(_AccountsReceived value),
    @required Result orElse(),
  });
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
abstract class _$AccountWatchStartedCopyWith<$Res> {
  factory _$AccountWatchStartedCopyWith(_AccountWatchStarted value,
          $Res Function(_AccountWatchStarted) then) =
      __$AccountWatchStartedCopyWithImpl<$Res>;
}

/// @nodoc
class __$AccountWatchStartedCopyWithImpl<$Res>
    extends _$AccountWatcherEventCopyWithImpl<$Res>
    implements _$AccountWatchStartedCopyWith<$Res> {
  __$AccountWatchStartedCopyWithImpl(
      _AccountWatchStarted _value, $Res Function(_AccountWatchStarted) _then)
      : super(_value, (v) => _then(v as _AccountWatchStarted));

  @override
  _AccountWatchStarted get _value => super._value as _AccountWatchStarted;
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
    return identical(this, other) || (other is _AccountWatchStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchAccountsStarted(),
    @required
        Result accountsReceived(
            Either<ValueFailure, List<NewAccount>> failureOrAccounts),
  }) {
    assert(watchAccountsStarted != null);
    assert(accountsReceived != null);
    return watchAccountsStarted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchAccountsStarted(),
    Result accountsReceived(
        Either<ValueFailure, List<NewAccount>> failureOrAccounts),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (watchAccountsStarted != null) {
      return watchAccountsStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchAccountsStarted(_AccountWatchStarted value),
    @required Result accountsReceived(_AccountsReceived value),
  }) {
    assert(watchAccountsStarted != null);
    assert(accountsReceived != null);
    return watchAccountsStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchAccountsStarted(_AccountWatchStarted value),
    Result accountsReceived(_AccountsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
abstract class _$AccountsReceivedCopyWith<$Res> {
  factory _$AccountsReceivedCopyWith(
          _AccountsReceived value, $Res Function(_AccountsReceived) then) =
      __$AccountsReceivedCopyWithImpl<$Res>;
  $Res call({Either<ValueFailure, List<NewAccount>> failureOrAccounts});
}

/// @nodoc
class __$AccountsReceivedCopyWithImpl<$Res>
    extends _$AccountWatcherEventCopyWithImpl<$Res>
    implements _$AccountsReceivedCopyWith<$Res> {
  __$AccountsReceivedCopyWithImpl(
      _AccountsReceived _value, $Res Function(_AccountsReceived) _then)
      : super(_value, (v) => _then(v as _AccountsReceived));

  @override
  _AccountsReceived get _value => super._value as _AccountsReceived;

  @override
  $Res call({
    Object failureOrAccounts = freezed,
  }) {
    return _then(_AccountsReceived(
      failureOrAccounts == freezed
          ? _value.failureOrAccounts
          : failureOrAccounts as Either<ValueFailure, List<NewAccount>>,
    ));
  }
}

/// @nodoc
class _$_AccountsReceived implements _AccountsReceived {
  const _$_AccountsReceived(this.failureOrAccounts)
      : assert(failureOrAccounts != null);

  @override
  final Either<ValueFailure, List<NewAccount>> failureOrAccounts;

  @override
  String toString() {
    return 'AccountWatcherEvent.accountsReceived(failureOrAccounts: $failureOrAccounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountsReceived &&
            (identical(other.failureOrAccounts, failureOrAccounts) ||
                const DeepCollectionEquality()
                    .equals(other.failureOrAccounts, failureOrAccounts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(failureOrAccounts);

  @override
  _$AccountsReceivedCopyWith<_AccountsReceived> get copyWith =>
      __$AccountsReceivedCopyWithImpl<_AccountsReceived>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result watchAccountsStarted(),
    @required
        Result accountsReceived(
            Either<ValueFailure, List<NewAccount>> failureOrAccounts),
  }) {
    assert(watchAccountsStarted != null);
    assert(accountsReceived != null);
    return accountsReceived(failureOrAccounts);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result watchAccountsStarted(),
    Result accountsReceived(
        Either<ValueFailure, List<NewAccount>> failureOrAccounts),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (accountsReceived != null) {
      return accountsReceived(failureOrAccounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result watchAccountsStarted(_AccountWatchStarted value),
    @required Result accountsReceived(_AccountsReceived value),
  }) {
    assert(watchAccountsStarted != null);
    assert(accountsReceived != null);
    return accountsReceived(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result watchAccountsStarted(_AccountWatchStarted value),
    Result accountsReceived(_AccountsReceived value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (accountsReceived != null) {
      return accountsReceived(this);
    }
    return orElse();
  }
}

abstract class _AccountsReceived implements AccountWatcherEvent {
  const factory _AccountsReceived(
          Either<ValueFailure, List<NewAccount>> failureOrAccounts) =
      _$_AccountsReceived;

  Either<ValueFailure, List<NewAccount>> get failureOrAccounts;
  _$AccountsReceivedCopyWith<_AccountsReceived> get copyWith;
}

/// @nodoc
class _$AccountWatcherStateTearOff {
  const _$AccountWatcherStateTearOff();

// ignore: unused_element
  _Initial initial() {
    return const _Initial();
  }

// ignore: unused_element
  _Loading loading() {
    return const _Loading();
  }

// ignore: unused_element
  _AccountLoadSuccess loadSuccess(List<NewAccount> accounts) {
    return _AccountLoadSuccess(
      accounts,
    );
  }

// ignore: unused_element
  _AccountLoadFailure loadFailure(ValueFailure<dynamic> accountFailure) {
    return _AccountLoadFailure(
      accountFailure,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AccountWatcherState = _$AccountWatcherStateTearOff();

/// @nodoc
mixin _$AccountWatcherState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<NewAccount> accounts),
    @required Result loadFailure(ValueFailure<dynamic> accountFailure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<NewAccount> accounts),
    Result loadFailure(ValueFailure<dynamic> accountFailure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_AccountLoadSuccess value),
    @required Result loadFailure(_AccountLoadFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(_Initial value),
    Result loading(_Loading value),
    Result loadSuccess(_AccountLoadSuccess value),
    Result loadFailure(_AccountLoadFailure value),
    @required Result orElse(),
  });
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
abstract class _$InitialCopyWith<$Res> {
  factory _$InitialCopyWith(_Initial value, $Res Function(_Initial) then) =
      __$InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitialCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res>
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
    return 'AccountWatcherState.initial()';
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
    @required Result loadSuccess(List<NewAccount> accounts),
    @required Result loadFailure(ValueFailure<dynamic> accountFailure),
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
    Result loadSuccess(List<NewAccount> accounts),
    Result loadFailure(ValueFailure<dynamic> accountFailure),
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
    @required Result loadSuccess(_AccountLoadSuccess value),
    @required Result loadFailure(_AccountLoadFailure value),
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
    Result loadSuccess(_AccountLoadSuccess value),
    Result loadFailure(_AccountLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
abstract class _$LoadingCopyWith<$Res> {
  factory _$LoadingCopyWith(_Loading value, $Res Function(_Loading) then) =
      __$LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$LoadingCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res>
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
    return 'AccountWatcherState.loading()';
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
    @required Result loadSuccess(List<NewAccount> accounts),
    @required Result loadFailure(ValueFailure<dynamic> accountFailure),
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
    Result loadSuccess(List<NewAccount> accounts),
    Result loadFailure(ValueFailure<dynamic> accountFailure),
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
    @required Result loadSuccess(_AccountLoadSuccess value),
    @required Result loadFailure(_AccountLoadFailure value),
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
    Result loadSuccess(_AccountLoadSuccess value),
    Result loadFailure(_AccountLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
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
abstract class _$AccountLoadSuccessCopyWith<$Res> {
  factory _$AccountLoadSuccessCopyWith(
          _AccountLoadSuccess value, $Res Function(_AccountLoadSuccess) then) =
      __$AccountLoadSuccessCopyWithImpl<$Res>;
  $Res call({List<NewAccount> accounts});
}

/// @nodoc
class __$AccountLoadSuccessCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res>
    implements _$AccountLoadSuccessCopyWith<$Res> {
  __$AccountLoadSuccessCopyWithImpl(
      _AccountLoadSuccess _value, $Res Function(_AccountLoadSuccess) _then)
      : super(_value, (v) => _then(v as _AccountLoadSuccess));

  @override
  _AccountLoadSuccess get _value => super._value as _AccountLoadSuccess;

  @override
  $Res call({
    Object accounts = freezed,
  }) {
    return _then(_AccountLoadSuccess(
      accounts == freezed ? _value.accounts : accounts as List<NewAccount>,
    ));
  }
}

/// @nodoc
class _$_AccountLoadSuccess implements _AccountLoadSuccess {
  const _$_AccountLoadSuccess(this.accounts) : assert(accounts != null);

  @override
  final List<NewAccount> accounts;

  @override
  String toString() {
    return 'AccountWatcherState.loadSuccess(accounts: $accounts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountLoadSuccess &&
            (identical(other.accounts, accounts) ||
                const DeepCollectionEquality()
                    .equals(other.accounts, accounts)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(accounts);

  @override
  _$AccountLoadSuccessCopyWith<_AccountLoadSuccess> get copyWith =>
      __$AccountLoadSuccessCopyWithImpl<_AccountLoadSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<NewAccount> accounts),
    @required Result loadFailure(ValueFailure<dynamic> accountFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadSuccess(accounts);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<NewAccount> accounts),
    Result loadFailure(ValueFailure<dynamic> accountFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(accounts);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_AccountLoadSuccess value),
    @required Result loadFailure(_AccountLoadFailure value),
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
    Result loadSuccess(_AccountLoadSuccess value),
    Result loadFailure(_AccountLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadSuccess != null) {
      return loadSuccess(this);
    }
    return orElse();
  }
}

abstract class _AccountLoadSuccess implements AccountWatcherState {
  const factory _AccountLoadSuccess(List<NewAccount> accounts) =
      _$_AccountLoadSuccess;

  List<NewAccount> get accounts;
  _$AccountLoadSuccessCopyWith<_AccountLoadSuccess> get copyWith;
}

/// @nodoc
abstract class _$AccountLoadFailureCopyWith<$Res> {
  factory _$AccountLoadFailureCopyWith(
          _AccountLoadFailure value, $Res Function(_AccountLoadFailure) then) =
      __$AccountLoadFailureCopyWithImpl<$Res>;
  $Res call({ValueFailure<dynamic> accountFailure});

  $ValueFailureCopyWith<dynamic, $Res> get accountFailure;
}

/// @nodoc
class __$AccountLoadFailureCopyWithImpl<$Res>
    extends _$AccountWatcherStateCopyWithImpl<$Res>
    implements _$AccountLoadFailureCopyWith<$Res> {
  __$AccountLoadFailureCopyWithImpl(
      _AccountLoadFailure _value, $Res Function(_AccountLoadFailure) _then)
      : super(_value, (v) => _then(v as _AccountLoadFailure));

  @override
  _AccountLoadFailure get _value => super._value as _AccountLoadFailure;

  @override
  $Res call({
    Object accountFailure = freezed,
  }) {
    return _then(_AccountLoadFailure(
      accountFailure == freezed
          ? _value.accountFailure
          : accountFailure as ValueFailure<dynamic>,
    ));
  }

  @override
  $ValueFailureCopyWith<dynamic, $Res> get accountFailure {
    if (_value.accountFailure == null) {
      return null;
    }
    return $ValueFailureCopyWith<dynamic, $Res>(_value.accountFailure, (value) {
      return _then(_value.copyWith(accountFailure: value));
    });
  }
}

/// @nodoc
class _$_AccountLoadFailure implements _AccountLoadFailure {
  const _$_AccountLoadFailure(this.accountFailure)
      : assert(accountFailure != null);

  @override
  final ValueFailure<dynamic> accountFailure;

  @override
  String toString() {
    return 'AccountWatcherState.loadFailure(accountFailure: $accountFailure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountLoadFailure &&
            (identical(other.accountFailure, accountFailure) ||
                const DeepCollectionEquality()
                    .equals(other.accountFailure, accountFailure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accountFailure);

  @override
  _$AccountLoadFailureCopyWith<_AccountLoadFailure> get copyWith =>
      __$AccountLoadFailureCopyWithImpl<_AccountLoadFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result loading(),
    @required Result loadSuccess(List<NewAccount> accounts),
    @required Result loadFailure(ValueFailure<dynamic> accountFailure),
  }) {
    assert(initial != null);
    assert(loading != null);
    assert(loadSuccess != null);
    assert(loadFailure != null);
    return loadFailure(accountFailure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result loading(),
    Result loadSuccess(List<NewAccount> accounts),
    Result loadFailure(ValueFailure<dynamic> accountFailure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(accountFailure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(_Initial value),
    @required Result loading(_Loading value),
    @required Result loadSuccess(_AccountLoadSuccess value),
    @required Result loadFailure(_AccountLoadFailure value),
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
    Result loadSuccess(_AccountLoadSuccess value),
    Result loadFailure(_AccountLoadFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loadFailure != null) {
      return loadFailure(this);
    }
    return orElse();
  }
}

abstract class _AccountLoadFailure implements AccountWatcherState {
  const factory _AccountLoadFailure(ValueFailure<dynamic> accountFailure) =
      _$_AccountLoadFailure;

  ValueFailure<dynamic> get accountFailure;
  _$AccountLoadFailureCopyWith<_AccountLoadFailure> get copyWith;
}
