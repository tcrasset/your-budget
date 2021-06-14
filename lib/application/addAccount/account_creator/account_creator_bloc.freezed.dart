// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'account_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AccountCreatorEventTearOff {
  const _$AccountCreatorEventTearOff();

  _Initialized initialized() {
    return const _Initialized();
  }

  _NameChanged nameChanged(String name) {
    return _NameChanged(
      name,
    );
  }

  _BalanceChanged balanceChanged(String balance) {
    return _BalanceChanged(
      balance,
    );
  }

  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
const $AccountCreatorEvent = _$AccountCreatorEventTearOff();

/// @nodoc
mixin _$AccountCreatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function(String balance) balanceChanged,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BalanceChanged value) balanceChanged,
    required TResult Function(_Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccountCreatorEventCopyWith<$Res> {
  factory $AccountCreatorEventCopyWith(
          AccountCreatorEvent value, $Res Function(AccountCreatorEvent) then) =
      _$AccountCreatorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AccountCreatorEventCopyWithImpl<$Res>
    implements $AccountCreatorEventCopyWith<$Res> {
  _$AccountCreatorEventCopyWithImpl(this._value, this._then);

  final AccountCreatorEvent _value;
  // ignore: unused_field
  final $Res Function(AccountCreatorEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(
          _Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res>
    extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(
      _Initialized _value, $Res Function(_Initialized) _then)
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
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function(String balance) balanceChanged,
    required TResult Function() saved,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BalanceChanged value) balanceChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
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
  factory _$NameChangedCopyWith(
          _NameChanged value, $Res Function(_NameChanged) then) =
      __$NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$NameChangedCopyWithImpl<$Res>
    extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$NameChangedCopyWith<$Res> {
  __$NameChangedCopyWithImpl(
      _NameChanged _value, $Res Function(_NameChanged) _then)
      : super(_value, (v) => _then(v as _NameChanged));

  @override
  _NameChanged get _value => super._value as _NameChanged;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_NameChanged(
      name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.name);

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
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(name);

  @JsonKey(ignore: true)
  @override
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      __$NameChangedCopyWithImpl<_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function(String balance) balanceChanged,
    required TResult Function() saved,
  }) {
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BalanceChanged value) balanceChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements AccountCreatorEvent {
  const factory _NameChanged(String name) = _$_NameChanged;

  String get name => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$NameChangedCopyWith<_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$BalanceChangedCopyWith<$Res> {
  factory _$BalanceChangedCopyWith(
          _BalanceChanged value, $Res Function(_BalanceChanged) then) =
      __$BalanceChangedCopyWithImpl<$Res>;
  $Res call({String balance});
}

/// @nodoc
class __$BalanceChangedCopyWithImpl<$Res>
    extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$BalanceChangedCopyWith<$Res> {
  __$BalanceChangedCopyWithImpl(
      _BalanceChanged _value, $Res Function(_BalanceChanged) _then)
      : super(_value, (v) => _then(v as _BalanceChanged));

  @override
  _BalanceChanged get _value => super._value as _BalanceChanged;

  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_BalanceChanged(
      balance == freezed
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BalanceChanged implements _BalanceChanged {
  const _$_BalanceChanged(this.balance);

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
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(balance);

  @JsonKey(ignore: true)
  @override
  _$BalanceChangedCopyWith<_BalanceChanged> get copyWith =>
      __$BalanceChangedCopyWithImpl<_BalanceChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function(String balance) balanceChanged,
    required TResult Function() saved,
  }) {
    return balanceChanged(balance);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (balanceChanged != null) {
      return balanceChanged(balance);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BalanceChanged value) balanceChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return balanceChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (balanceChanged != null) {
      return balanceChanged(this);
    }
    return orElse();
  }
}

abstract class _BalanceChanged implements AccountCreatorEvent {
  const factory _BalanceChanged(String balance) = _$_BalanceChanged;

  String get balance => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$BalanceChangedCopyWith<_BalanceChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) =
      __$SavedCopyWithImpl<$Res>;
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
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function(String balance) balanceChanged,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (saved != null) {
      return saved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BalanceChanged value) balanceChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
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

  _AccountCreatorState call(
      {required Account account,
      required bool showErrorMessages,
      required bool isSaving,
      required bool isEditing,
      required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) {
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
const $AccountCreatorState = _$AccountCreatorStateTearOff();

/// @nodoc
mixin _$AccountCreatorState {
/*required*/
  Account get account => throw _privateConstructorUsedError; /*required*/
  bool get showErrorMessages => throw _privateConstructorUsedError; /*required*/
  bool get isSaving => throw _privateConstructorUsedError; /*required*/
  bool get isEditing => throw _privateConstructorUsedError; /*required*/
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccountCreatorStateCopyWith<AccountCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
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
class _$AccountCreatorStateCopyWithImpl<$Res>
    implements $AccountCreatorStateCopyWith<$Res> {
  _$AccountCreatorStateCopyWithImpl(this._value, this._then);

  final AccountCreatorState _value;
  // ignore: unused_field
  final $Res Function(AccountCreatorState) _then;

  @override
  $Res call({
    Object? account = freezed,
    Object? showErrorMessages = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, Unit>>,
    ));
  }

  @override
  $AccountCopyWith<$Res> get account {
    return $AccountCopyWith<$Res>(_value.account, (value) {
      return _then(_value.copyWith(account: value));
    });
  }
}

/// @nodoc
abstract class _$AccountCreatorStateCopyWith<$Res>
    implements $AccountCreatorStateCopyWith<$Res> {
  factory _$AccountCreatorStateCopyWith(_AccountCreatorState value,
          $Res Function(_AccountCreatorState) then) =
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
class __$AccountCreatorStateCopyWithImpl<$Res>
    extends _$AccountCreatorStateCopyWithImpl<$Res>
    implements _$AccountCreatorStateCopyWith<$Res> {
  __$AccountCreatorStateCopyWithImpl(
      _AccountCreatorState _value, $Res Function(_AccountCreatorState) _then)
      : super(_value, (v) => _then(v as _AccountCreatorState));

  @override
  _AccountCreatorState get _value => super._value as _AccountCreatorState;

  @override
  $Res call({
    Object? account = freezed,
    Object? showErrorMessages = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_AccountCreatorState(
      account: account == freezed
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as Account,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: isSaving == freezed
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: isEditing == freezed
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption == freezed
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_AccountCreatorState implements _AccountCreatorState {
  const _$_AccountCreatorState(
      {required this.account,
      required this.showErrorMessages,
      required this.isSaving,
      required this.isEditing,
      required this.saveFailureOrSuccessOption});

  @override /*required*/
  final Account account;
  @override /*required*/
  final bool showErrorMessages;
  @override /*required*/
  final bool isSaving;
  @override /*required*/
  final bool isEditing;
  @override /*required*/
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
                const DeepCollectionEquality()
                    .equals(other.account, account)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSaving, isSaving) ||
                const DeepCollectionEquality()
                    .equals(other.isSaving, isSaving)) &&
            (identical(other.isEditing, isEditing) ||
                const DeepCollectionEquality()
                    .equals(other.isEditing, isEditing)) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(account) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  _$AccountCreatorStateCopyWith<_AccountCreatorState> get copyWith =>
      __$AccountCreatorStateCopyWithImpl<_AccountCreatorState>(
          this, _$identity);
}

abstract class _AccountCreatorState implements AccountCreatorState {
  const factory _AccountCreatorState(
      {required Account account,
      required bool showErrorMessages,
      required bool isSaving,
      required bool isEditing,
      required Option<Either<ValueFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_AccountCreatorState;

  @override /*required*/
  Account get account => throw _privateConstructorUsedError;
  @override /*required*/
  bool get showErrorMessages => throw _privateConstructorUsedError;
  @override /*required*/
  bool get isSaving => throw _privateConstructorUsedError;
  @override /*required*/
  bool get isEditing => throw _privateConstructorUsedError;
  @override /*required*/
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AccountCreatorStateCopyWith<_AccountCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
