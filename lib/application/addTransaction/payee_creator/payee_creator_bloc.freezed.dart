// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'payee_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$PayeeCreatorEventTearOff {
  const _$PayeeCreatorEventTearOff();

// ignore: unused_element
  _Initialized initialized(Option<Name> initialNameOption) {
    return _Initialized(
      initialNameOption,
    );
  }

// ignore: unused_element
  _NameChanged nameChanged(String name) {
    return _NameChanged(
      name,
    );
  }

// ignore: unused_element
  _Saved saved() {
    return const _Saved();
  }
}

/// @nodoc
// ignore: unused_element
const $PayeeCreatorEvent = _$PayeeCreatorEventTearOff();

/// @nodoc
mixin _$PayeeCreatorEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Name> initialNameOption),
    @required Result nameChanged(String name),
    @required Result saved(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Name> initialNameOption),
    Result nameChanged(String name),
    Result saved(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result nameChanged(_NameChanged value),
    @required Result saved(_Saved value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
    Result saved(_Saved value),
    @required Result orElse(),
  });
}

/// @nodoc
abstract class $PayeeCreatorEventCopyWith<$Res> {
  factory $PayeeCreatorEventCopyWith(
          PayeeCreatorEvent value, $Res Function(PayeeCreatorEvent) then) =
      _$PayeeCreatorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$PayeeCreatorEventCopyWithImpl<$Res> implements $PayeeCreatorEventCopyWith<$Res> {
  _$PayeeCreatorEventCopyWithImpl(this._value, this._then);

  final PayeeCreatorEvent _value;
  // ignore: unused_field
  final $Res Function(PayeeCreatorEvent) _then;
}

/// @nodoc
abstract class _$InitializedCopyWith<$Res> {
  factory _$InitializedCopyWith(_Initialized value, $Res Function(_Initialized) then) =
      __$InitializedCopyWithImpl<$Res>;
  $Res call({Option<Name> initialNameOption});
}

/// @nodoc
class __$InitializedCopyWithImpl<$Res> extends _$PayeeCreatorEventCopyWithImpl<$Res>
    implements _$InitializedCopyWith<$Res> {
  __$InitializedCopyWithImpl(_Initialized _value, $Res Function(_Initialized) _then)
      : super(_value, (v) => _then(v as _Initialized));

  @override
  _Initialized get _value => super._value as _Initialized;

  @override
  $Res call({
    Object initialNameOption = freezed,
  }) {
    return _then(_Initialized(
      initialNameOption == freezed ? _value.initialNameOption : initialNameOption as Option<Name>,
    ));
  }
}

/// @nodoc
class _$_Initialized implements _Initialized {
  const _$_Initialized(this.initialNameOption) : assert(initialNameOption != null);

  @override
  final Option<Name> initialNameOption;

  @override
  String toString() {
    return 'PayeeCreatorEvent.initialized(initialNameOption: $initialNameOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Initialized &&
            (identical(other.initialNameOption, initialNameOption) ||
                const DeepCollectionEquality().equals(other.initialNameOption, initialNameOption)));
  }

  @override
  int get hashCode => runtimeType.hashCode ^ const DeepCollectionEquality().hash(initialNameOption);

  @override
  _$InitializedCopyWith<_Initialized> get copyWith =>
      __$InitializedCopyWithImpl<_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initialized(Option<Name> initialNameOption),
    @required Result nameChanged(String name),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return initialized(initialNameOption);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Name> initialNameOption),
    Result nameChanged(String name),
    Result saved(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initialized != null) {
      return initialized(initialNameOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initialized(_Initialized value),
    @required Result nameChanged(_NameChanged value),
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
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

abstract class _Initialized implements PayeeCreatorEvent {
  const factory _Initialized(Option<Name> initialNameOption) = _$_Initialized;

  Option<Name> get initialNameOption;
  _$InitializedCopyWith<_Initialized> get copyWith;
}

/// @nodoc
abstract class _$NameChangedCopyWith<$Res> {
  factory _$NameChangedCopyWith(_NameChanged value, $Res Function(_NameChanged) then) =
      __$NameChangedCopyWithImpl<$Res>;
  $Res call({String name});
}

/// @nodoc
class __$NameChangedCopyWithImpl<$Res> extends _$PayeeCreatorEventCopyWithImpl<$Res>
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
    return 'PayeeCreatorEvent.nameChanged(name: $name)';
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
    @required Result initialized(Option<Name> initialNameOption),
    @required Result nameChanged(String name),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Name> initialNameOption),
    Result nameChanged(String name),
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
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
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

abstract class _NameChanged implements PayeeCreatorEvent {
  const factory _NameChanged(String name) = _$_NameChanged;

  String get name;
  _$NameChangedCopyWith<_NameChanged> get copyWith;
}

/// @nodoc
abstract class _$SavedCopyWith<$Res> {
  factory _$SavedCopyWith(_Saved value, $Res Function(_Saved) then) = __$SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$SavedCopyWithImpl<$Res> extends _$PayeeCreatorEventCopyWithImpl<$Res>
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
    return 'PayeeCreatorEvent.saved()';
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
    @required Result initialized(Option<Name> initialNameOption),
    @required Result nameChanged(String name),
    @required Result saved(),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return saved();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initialized(Option<Name> initialNameOption),
    Result nameChanged(String name),
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
    @required Result saved(_Saved value),
  }) {
    assert(initialized != null);
    assert(nameChanged != null);
    assert(saved != null);
    return saved(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initialized(_Initialized value),
    Result nameChanged(_NameChanged value),
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

abstract class _Saved implements PayeeCreatorEvent {
  const factory _Saved() = _$_Saved;
}

/// @nodoc
class _$PayeeCreatorStateTearOff {
  const _$PayeeCreatorStateTearOff();

// ignore: unused_element
  _PayeeCreatorState call(
      {@required Payee payee,
      @required bool showErrorMessages,
      @required bool isSaving,
      @required bool isEditing,
      @required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) {
    return _PayeeCreatorState(
      payee: payee,
      showErrorMessages: showErrorMessages,
      isSaving: isSaving,
      isEditing: isEditing,
      saveFailureOrSuccessOption: saveFailureOrSuccessOption,
    );
  }
}

/// @nodoc
// ignore: unused_element
const $PayeeCreatorState = _$PayeeCreatorStateTearOff();

/// @nodoc
mixin _$PayeeCreatorState {
  Payee get payee;
  bool get showErrorMessages;
  bool get isSaving;
  bool get isEditing;
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption;

  $PayeeCreatorStateCopyWith<PayeeCreatorState> get copyWith;
}

/// @nodoc
abstract class $PayeeCreatorStateCopyWith<$Res> {
  factory $PayeeCreatorStateCopyWith(
          PayeeCreatorState value, $Res Function(PayeeCreatorState) then) =
      _$PayeeCreatorStateCopyWithImpl<$Res>;
  $Res call(
      {Payee payee,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption});

  $PayeeCopyWith<$Res> get payee;
}

/// @nodoc
class _$PayeeCreatorStateCopyWithImpl<$Res> implements $PayeeCreatorStateCopyWith<$Res> {
  _$PayeeCreatorStateCopyWithImpl(this._value, this._then);

  final PayeeCreatorState _value;
  // ignore: unused_field
  final $Res Function(PayeeCreatorState) _then;

  @override
  $Res call({
    Object payee = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      payee: payee == freezed ? _value.payee : payee as Payee,
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
  $PayeeCopyWith<$Res> get payee {
    if (_value.payee == null) {
      return null;
    }
    return $PayeeCopyWith<$Res>(_value.payee, (value) {
      return _then(_value.copyWith(payee: value));
    });
  }
}

/// @nodoc
abstract class _$PayeeCreatorStateCopyWith<$Res> implements $PayeeCreatorStateCopyWith<$Res> {
  factory _$PayeeCreatorStateCopyWith(
          _PayeeCreatorState value, $Res Function(_PayeeCreatorState) then) =
      __$PayeeCreatorStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Payee payee,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption});

  @override
  $PayeeCopyWith<$Res> get payee;
}

/// @nodoc
class __$PayeeCreatorStateCopyWithImpl<$Res> extends _$PayeeCreatorStateCopyWithImpl<$Res>
    implements _$PayeeCreatorStateCopyWith<$Res> {
  __$PayeeCreatorStateCopyWithImpl(
      _PayeeCreatorState _value, $Res Function(_PayeeCreatorState) _then)
      : super(_value, (v) => _then(v as _PayeeCreatorState));

  @override
  _PayeeCreatorState get _value => super._value as _PayeeCreatorState;

  @override
  $Res call({
    Object payee = freezed,
    Object showErrorMessages = freezed,
    Object isSaving = freezed,
    Object isEditing = freezed,
    Object saveFailureOrSuccessOption = freezed,
  }) {
    return _then(_PayeeCreatorState(
      payee: payee == freezed ? _value.payee : payee as Payee,
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
class _$_PayeeCreatorState implements _PayeeCreatorState {
  const _$_PayeeCreatorState(
      {@required this.payee,
      @required this.showErrorMessages,
      @required this.isSaving,
      @required this.isEditing,
      @required this.saveFailureOrSuccessOption})
      : assert(payee != null),
        assert(showErrorMessages != null),
        assert(isSaving != null),
        assert(isEditing != null),
        assert(saveFailureOrSuccessOption != null);

  @override
  final Payee payee;
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
    return 'PayeeCreatorState(payee: $payee, showErrorMessages: $showErrorMessages, isSaving: $isSaving, isEditing: $isEditing, saveFailureOrSuccessOption: $saveFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PayeeCreatorState &&
            (identical(other.payee, payee) ||
                const DeepCollectionEquality().equals(other.payee, payee)) &&
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
      const DeepCollectionEquality().hash(payee) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSaving) ^
      const DeepCollectionEquality().hash(isEditing) ^
      const DeepCollectionEquality().hash(saveFailureOrSuccessOption);

  @override
  _$PayeeCreatorStateCopyWith<_PayeeCreatorState> get copyWith =>
      __$PayeeCreatorStateCopyWithImpl<_PayeeCreatorState>(this, _$identity);
}

abstract class _PayeeCreatorState implements PayeeCreatorState {
  const factory _PayeeCreatorState(
          {@required Payee payee,
          @required bool showErrorMessages,
          @required bool isSaving,
          @required bool isEditing,
          @required Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption}) =
      _$_PayeeCreatorState;

  @override
  Payee get payee;
  @override
  bool get showErrorMessages;
  @override
  bool get isSaving;
  @override
  bool get isEditing;
  @override
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption;
  @override
  _$PayeeCreatorStateCopyWith<_PayeeCreatorState> get copyWith;
}
