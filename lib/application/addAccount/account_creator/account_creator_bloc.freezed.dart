// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'account_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
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
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, (v) => _then(v as _$_Initialized));

  @override
  _$_Initialized get _value => super._value as _$_Initialized;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initialized);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
  }) {
    return initialized?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return initialized?.call(this);
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
abstract class _$$_NameChangedCopyWith<$Res> {
  factory _$$_NameChangedCopyWith(
          _$_NameChanged value, $Res Function(_$_NameChanged) then) =
      __$$_NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$$_NameChangedCopyWithImpl<$Res>
    extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$$_NameChangedCopyWith<$Res> {
  __$$_NameChangedCopyWithImpl(
      _$_NameChanged _value, $Res Function(_$_NameChanged) _then)
      : super(_value, (v) => _then(v as _$_NameChanged));

  @override
  _$_NameChanged get _value => super._value as _$_NameChanged;

  @override
  $Res call({
    Object? name = freezed,
  }) {
    return _then(_$_NameChanged(
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
        (other.runtimeType == runtimeType &&
            other is _$_NameChanged &&
            const DeepCollectionEquality().equals(other.name, name));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(name));

  @JsonKey(ignore: true)
  @override
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      __$$_NameChangedCopyWithImpl<_$_NameChanged>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
  }) {
    return nameChanged?.call(name);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return nameChanged?.call(this);
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
  const factory _NameChanged(final String name) = _$_NameChanged;

  String get name;
  @JsonKey(ignore: true)
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_BalanceChangedCopyWith<$Res> {
  factory _$$_BalanceChangedCopyWith(
          _$_BalanceChanged value, $Res Function(_$_BalanceChanged) then) =
      __$$_BalanceChangedCopyWithImpl<$Res>;
  $Res call({String balance});
}

/// @nodoc
class __$$_BalanceChangedCopyWithImpl<$Res>
    extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$$_BalanceChangedCopyWith<$Res> {
  __$$_BalanceChangedCopyWithImpl(
      _$_BalanceChanged _value, $Res Function(_$_BalanceChanged) _then)
      : super(_value, (v) => _then(v as _$_BalanceChanged));

  @override
  _$_BalanceChanged get _value => super._value as _$_BalanceChanged;

  @override
  $Res call({
    Object? balance = freezed,
  }) {
    return _then(_$_BalanceChanged(
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
        (other.runtimeType == runtimeType &&
            other is _$_BalanceChanged &&
            const DeepCollectionEquality().equals(other.balance, balance));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(balance));

  @JsonKey(ignore: true)
  @override
  _$$_BalanceChangedCopyWith<_$_BalanceChanged> get copyWith =>
      __$$_BalanceChangedCopyWithImpl<_$_BalanceChanged>(this, _$identity);

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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
  }) {
    return balanceChanged?.call(balance);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return balanceChanged?.call(this);
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
  const factory _BalanceChanged(final String balance) = _$_BalanceChanged;

  String get balance;
  @JsonKey(ignore: true)
  _$$_BalanceChangedCopyWith<_$_BalanceChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavedCopyWith<$Res> {
  factory _$$_SavedCopyWith(_$_Saved value, $Res Function(_$_Saved) then) =
      __$$_SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SavedCopyWithImpl<$Res>
    extends _$AccountCreatorEventCopyWithImpl<$Res>
    implements _$$_SavedCopyWith<$Res> {
  __$$_SavedCopyWithImpl(_$_Saved _value, $Res Function(_$_Saved) _then)
      : super(_value, (v) => _then(v as _$_Saved));

  @override
  _$_Saved get _value => super._value as _$_Saved;
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Saved);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function(String balance)? balanceChanged,
    TResult Function()? saved,
  }) {
    return saved?.call();
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BalanceChanged value)? balanceChanged,
    TResult Function(_Saved value)? saved,
  }) {
    return saved?.call(this);
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
abstract class _$$_AccountCreatorStateCopyWith<$Res>
    implements $AccountCreatorStateCopyWith<$Res> {
  factory _$$_AccountCreatorStateCopyWith(_$_AccountCreatorState value,
          $Res Function(_$_AccountCreatorState) then) =
      __$$_AccountCreatorStateCopyWithImpl<$Res>;
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
class __$$_AccountCreatorStateCopyWithImpl<$Res>
    extends _$AccountCreatorStateCopyWithImpl<$Res>
    implements _$$_AccountCreatorStateCopyWith<$Res> {
  __$$_AccountCreatorStateCopyWithImpl(_$_AccountCreatorState _value,
      $Res Function(_$_AccountCreatorState) _then)
      : super(_value, (v) => _then(v as _$_AccountCreatorState));

  @override
  _$_AccountCreatorState get _value => super._value as _$_AccountCreatorState;

  @override
  $Res call({
    Object? account = freezed,
    Object? showErrorMessages = freezed,
    Object? isSaving = freezed,
    Object? isEditing = freezed,
    Object? saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_$_AccountCreatorState(
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

/*required*/
  @override
  final Account account;
/*required*/
  @override
  final bool showErrorMessages;
/*required*/
  @override
  final bool isSaving;
/*required*/
  @override
  final bool isEditing;
/*required*/
  @override
  final Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption;

  @override
  String toString() {
    return 'AccountCreatorState(account: $account, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AccountCreatorState &&
            const DeepCollectionEquality().equals(other.account, account) &&
            const DeepCollectionEquality()
                .equals(other.showErrorMessages, showErrorMessages) &&
            const DeepCollectionEquality().equals(other.isSaving, isSaving) &&
            const DeepCollectionEquality().equals(other.isEditing, isEditing) &&
            const DeepCollectionEquality().equals(
                other.saveFailureOrSuccessOption, saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(account),
      const DeepCollectionEquality().hash(showErrorMessages),
      const DeepCollectionEquality().hash(isSaving),
      const DeepCollectionEquality().hash(isEditing),
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption));

  @JsonKey(ignore: true)
  @override
  _$$_AccountCreatorStateCopyWith<_$_AccountCreatorState> get copyWith =>
      __$$_AccountCreatorStateCopyWithImpl<_$_AccountCreatorState>(
          this, _$identity);
}

abstract class _AccountCreatorState implements AccountCreatorState {
  const factory _AccountCreatorState(
      {required final Account account,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final bool isEditing,
      required final Option<Either<ValueFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_AccountCreatorState;

  @override /*required*/
  Account get account;
  @override /*required*/
  bool get showErrorMessages;
  @override /*required*/
  bool get isSaving;
  @override /*required*/
  bool get isEditing;
  @override /*required*/
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  @JsonKey(ignore: true)
  _$$_AccountCreatorStateCopyWith<_$_AccountCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
