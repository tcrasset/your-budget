// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'account_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$AccountCreatorEventTearOff {
  const _$AccountCreatorEventTearOff();

// ignore: unused_element
  _Initialized initialized() {
    return const _Initialized();
  }

// ignore: unused_element
  _NameChanged nameChanged(String name) {
    return _NameChanged(
      name,
    );
  }

// ignore: unused_element
  _BalanceChanged balanceChanged(String balance) {
    return _BalanceChanged(
      balance,
    );
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $AccountCreatorEvent = _$AccountCreatorEventTearOff();

/// @nodoc
mixin _$AccountCreatorEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result nameChanged(String name),
    @required Result balanceChanged(String balance),
    @required Result saved(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result nameChanged(String name),
    Result balanceChanged(String balance),
    Result saved(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result nameChanged(_NameChanged value),
    @required Result balanceChanged(_BalanceChanged value),
    @required Result saved(_Saved value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
    Result balanceChanged(_BalanceChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $AccountCreatorEventCopyWith<$Res> {
  factory $AccountCreatorEventCopyWith(
          AccountCreatorEvent value, $Res Function(AccountCreatorEvent) then) =
      _$AccountCreatorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountCreatorEventCopyWithImpl<$Res> implements $AccountCreatorEventCopyWith<$Res> {
  _$AccountCreatorEventCopyWithImpl(this._value, this._then);

  final AccountCreatorEvent _value;
  // ignore: unused_field
  final $Res Function(AccountCreatorEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(_Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res> extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(_Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;
}

/// @nodoc
class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'AccountCreatorEvent.initialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Initialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result nameChanged(String name),
    @required Result balanceChanged(String balance),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return initialized();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result nameChanged(String name),
    Result balanceChanged(String balance),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result nameChanged(_NameChanged value),
    @required Result balanceChanged(_BalanceChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
    Result balanceChanged(_BalanceChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements AccountCreatorEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$NameChangedCopyWith<$Res> {
  factory _$NameChangedCopyWith(_NameChanged value, $Res Function(_NameChanged) then) =
      __$NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$NameChangedCopyWithImpl<$Res> extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(_NameChanged _value, $Res Function(_NameChanged) _then)
      : super(_value, (v) => _then(v as _NameChanged));

  @override
  _NameChanged get _value => super._value as _NameChanged;

  @override
  $Res call({
    Object name = freezed,
  }) {
    return _then(_NameChanged(
      name == freezed ? _value.name : name as String,
    ));
  }
}

/// @nodoc
class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.name) : assert(name != null);

  @override
  final String name;

  @override
  String toString() {
    return 'AccountCreatorEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _NameChanged &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @override
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result nameChanged(String name),
    @required Result balanceChanged(String balance),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result nameChanged(String name),
    Result balanceChanged(String balance),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result nameChanged(_NameChanged value),
    @required Result balanceChanged(_BalanceChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
    Result balanceChanged(_BalanceChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements AccountCreatorEvent {
  const factory _NameChanged(String name) = _$_NameChanged;

  String get name;
  _$NameChangedCopyWith<_NameChanged> get copyWith;
}

/// @nodoc
abstract class _$BalanceChangedCopyWith<$Res> {
  factory _$BalanceChangedCopyWith(_BalanceChanged value, $Res Function(_BalanceChanged) then) =
      __$BalanceChangedCopyWithImpl<$Res>;
  $Res call({String balance});
}

/// @nodoc
class __$BalanceChangedCopyWithImpl<$Res> extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$BalanceChangedCopyWith<$Res> {
  __$BalanceChangedCopyWithImpl(_BalanceChanged _value, $Res Function(_BalanceChanged) _then)
      : super(_value, (v) => _then(v as _BalanceChanged));

  @override
  _BalanceChanged get _value => super._value as _BalanceChanged;

  @override
  $Res call({
    Object balance = freezed,
  }) {
    return _then(_BalanceChanged(
      balance == freezed ? _value.balance : balance as String,
    ));
  }
}

/// @nodoc
class _$_BalanceChanged implements _BalanceChanged {
  const _$_BalanceChanged(this.balance) : assert(balance != null);

  @override
  final String balance;

  @override
  String toString() {
    return 'AccountCreatorEvent.balanceChanged(balance: $balance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BalanceChanged &&
            (identical(other.balance, balance) ||
                const DeepCollectionEquality().equals(other.balance, balance)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(balance);

  @override
  _$BalanceChangedCopyWith<_BalanceChanged> get copyWith =>
      __$BalanceChangedCopyWithImpl<_BalanceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result nameChanged(String name),
    @required Result balanceChanged(String balance),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return balanceChanged(balance);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result nameChanged(String name),
    Result balanceChanged(String balance),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (balanceChanged != null) {
      return balanceChanged(balance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result nameChanged(_NameChanged value),
    @required Result balanceChanged(_BalanceChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return balanceChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
    Result balanceChanged(_BalanceChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (balanceChanged != null) {
      return balanceChanged(this);
    }
    return orElse();
  }
}

abstract class _BalanceChanged implements AccountCreatorEvent {
  const factory _BalanceChanged(String balance) = _$_BalanceChanged;

  String get balance;
  _$BalanceChangedCopyWith<_BalanceChanged> get copyWith;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) = __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$SavedCopyWith<$Res> {
  __$SavedCopyWithImpl(_Saved _value, $Res Function(_Saved) _then)
      : super(_value, (v) => _then(v as _Saved));

  @override
  _Saved get _value => super._value as _Saved;
}

/// @nodoc
class _$_Saved implements _Saved {
  const _$_Saved();

  @override
  String toString() {
    return 'AccountCreatorEvent.saved()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(),
    @required Result nameChanged(String name),
    @required Result balanceChanged(String balance),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(),
    Result nameChanged(String name),
    Result balanceChanged(String balance),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result nameChanged(_NameChanged value),
    @required Result balanceChanged(_BalanceChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(balanceChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
    Result balanceChanged(_BalanceChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (saved != null) {
      return saved(this);
    }
    return orElse();
  }
}

abstract class _Saved implements AccountCreatorEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$AccountCreatorStateTearOff {
  const _$AccountCreatorStateTearOff();

// ignore: unused_element
  _AccountCreatorState call(
      {@required Account account,
      @required bool showErrorMessages,
      @required bool isSaving,
      @required bool isEditing,
      @required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) {
    return _AccountCreatorState(
      account: account,
      showErrorMessages: showErrorMessages,
      isSaving: isSaving,
      isEditing: isEditing,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $AccountCreatorState = _$AccountCreatorStateTearOff();

/// @nodoc
mixin _$AccountCreatorState {
  Account get account;
  bool get showErrorMessages;
  bool get isSaving;
  bool get isEditing;
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption;

  $AccountCreatorStateCopyWith<AccountCreatorState> get copyWith;
}

/// @nodoc
abstract class $AccountCreatorStateCopyWith<$Res> {
  factory $AccountCreatorStateCopyWith(
          AccountCreatorState value, $Res Function(AccountCreatorState) then) =
      _$AccountCreatorStateCopyWithImpl<$Res>;
  $Res call(
      {Account account,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption});

  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class _$AccountCreatorStateCopyWithImpl<$Res> implements $AccountCreatorStateCopyWith<$Res> {
  _$AccountCreatorStateCopyWithImpl(this._value, this._then);

  final AccountCreatorState _value;
  // ignore: unused_field
  final $Res Function(AccountCreatorState) _then;

  @override
  $Res call({
    Object account = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed ? _value.account : account as Account,
      showErrorMessages:
          showErrorMessages == freezed ? _value.showErrorMessages : showErrorMessages as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<ValueFailure, Unit>>,
    ));
  }

  @override
  $AccountCopyWith<$Res> get account {
    if (_value.account == null) {
      return null;
    }
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
abstract class _$AccountCreatorStateCopyWith<$Res> implements $AccountCreatorStateCopyWith<$Res> {
  factory _$AccountCreatorStateCopyWith(
          _AccountCreatorState value, $Res Function(_AccountCreatorState) then) =
      __$AccountCreatorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Account account,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $AccountCopyWith<$Res> get account;
}

/// @nodoc
class __$AccountCreatorStateCopyWithImpl<$Res> extends _$AccountCreatorStateCopyWithImpl<$Res>
    implements _$AccountCreatorStateCopyWith<$Res> {
  __$AccountCreatorStateCopyWithImpl(
      _AccountCreatorState _value, $Res Function(_AccountCreatorState) _then)
      : super(_value, (v) => _then(v as _AccountCreatorState));

  @override
  _AccountCreatorState get _value => super._value as _AccountCreatorState;

  @override
  $Res call({
    Object account = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_AccountCreatorState(
      account: account == freezed ? _value.account : account as Account,
      showErrorMessages:
          showErrorMessages == freezed ? _value.showErrorMessages : showErrorMessages as bool,
      isSaving: isSaving == freezed ? _value.isSaving : isSaving as bool,
      isEditing: isEditing == freezed ? _value.isEditing : isEditing as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption as Option<Either<ValueFailure, Unit>>,
    ));
  }
}

/// @nodoc
class _$_AccountCreatorState implements _AccountCreatorState {
  const _$_AccountCreatorState(
      {@required this.account,
      @required this.showErrorMessages,
      @required this.isSaving,
      @required this.isEditing,
      @required this.saveFailureOrSuccessOption})
      : assert(account != null),
        assert(showErrorMessages != null),
        assert(isSaving != null),
        assert(isEditing != null),
        assert(saveFailureOrSuccessOption != null);

  @override
  final Account account;
  @override
  final bool showErrorMessages;
  @override
  final bool isSaving;
  @override
  final bool isEditing;
  @override
  final Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'AccountCreatorState(account: $account, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AccountCreatorState &&
            (identical(other.account, account) ||
                const DeepCollectionEquality().equals(other.account, account)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality().equals(other.isSaving, isSaving)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality().equals(other.isEditing, isEditing)) &&
            (identical(other.saveFailureOrSuccessOption, saveFailureOrSuccessOption) ||
                const DeepCollectionEquality()
                    .equals(other.saveFailureOrSuccessOption, saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @override
  _$AccountCreatorStateCopyWith<_AccountCreatorState> get copyWith =>
      __$AccountCreatorStateCopyWithImpl<_AccountCreatorState>(this, _$identity);
}

abstract class _AccountCreatorState implements AccountCreatorState {
  const factory _AccountCreatorState(
          {@required Account account,
          @required bool showErrorMessages,
          @required bool isSaving,
          @required bool isEditing,
          @required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) =
      _$_AccountCreatorState;

  @override
  Account get account;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  bool get isEditing;
  @override
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  _$AccountCreatorStateCopyWith<_AccountCreatorState> get copyWith;
}
