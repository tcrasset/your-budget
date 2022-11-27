// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'payee_creator_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PayeeCreatorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Name> initialNameOption) initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function() saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Name> initialNameOption)? initialized,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Name> initialNameOption)? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_Saved value) saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_Saved value)? saved,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayeeCreatorEventCopyWith<$Res> {
  factory $PayeeCreatorEventCopyWith(
          PayeeCreatorEvent value, $Res Function(PayeeCreatorEvent) then) =
      _$PayeeCreatorEventCopyWithImpl<$Res, PayeeCreatorEvent>;
}

/// @nodoc
class _$PayeeCreatorEventCopyWithImpl<$Res, $Val extends PayeeCreatorEvent>
    implements $PayeeCreatorEventCopyWith<$Res> {
  _$PayeeCreatorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitializedCopyWith<$Res> {
  factory _$$_InitializedCopyWith(
          _$_Initialized value, $Res Function(_$_Initialized) then) =
      __$$_InitializedCopyWithImpl<$Res>;
  @useResult
  $Res call({Option<Name> initialNameOption});
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$PayeeCreatorEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? initialNameOption = null,
  }) {
    return _then(_$_Initialized(
      null == initialNameOption
          ? _value.initialNameOption
          : initialNameOption // ignore: cast_nullable_to_non_nullable
              as Option<Name>,
    ));
  }
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized(this.initialNameOption);

  @override
  final Option<Name> initialNameOption;

  @override
  String toString() {
    return 'PayeeCreatorEvent.initialized(initialNameOption: $initialNameOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initialized &&
            (identical(other.initialNameOption, initialNameOption) ||
                other.initialNameOption == initialNameOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, initialNameOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      __$$_InitializedCopyWithImpl<_$_Initialized>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Name> initialNameOption) initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function() saved,
  }) {
    return initialized(initialNameOption);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Name> initialNameOption)? initialized,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? saved,
  }) {
    return initialized?.call(initialNameOption);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Name> initialNameOption)? initialized,
    TResult Function(String name)? nameChanged,
    TResult Function()? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(initialNameOption);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_Saved value) saved,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_Saved value)? saved,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements PayeeCreatorEvent {
  const factory _Initialized(final Option<Name> initialNameOption) =
      _$_Initialized;

  Option<Name> get initialNameOption;
  @JsonKey(ignore: true)
  _$$_InitializedCopyWith<_$_Initialized> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NameChangedCopyWith<$Res> {
  factory _$$_NameChangedCopyWith(
          _$_NameChanged value, $Res Function(_$_NameChanged) then) =
      __$$_NameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({String name});
}

/// @nodoc
class __$$_NameChangedCopyWithImpl<$Res>
    extends _$PayeeCreatorEventCopyWithImpl<$Res, _$_NameChanged>
    implements _$$_NameChangedCopyWith<$Res> {
  __$$_NameChangedCopyWithImpl(
      _$_NameChanged _value, $Res Function(_$_NameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
  }) {
    return _then(_$_NameChanged(
      null == name
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
    return 'PayeeCreatorEvent.nameChanged(name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameChanged &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      __$$_NameChangedCopyWithImpl<_$_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Name> initialNameOption) initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function() saved,
  }) {
    return nameChanged(name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Name> initialNameOption)? initialized,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? saved,
  }) {
    return nameChanged?.call(name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Name> initialNameOption)? initialized,
    TResult Function(String name)? nameChanged,
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
    required TResult Function(_Saved value) saved,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_Saved value)? saved,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements PayeeCreatorEvent {
  const factory _NameChanged(final String name) = _$_NameChanged;

  String get name;
  @JsonKey(ignore: true)
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SavedCopyWith<$Res> {
  factory _$$_SavedCopyWith(_$_Saved value, $Res Function(_$_Saved) then) =
      __$$_SavedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SavedCopyWithImpl<$Res>
    extends _$PayeeCreatorEventCopyWithImpl<$Res, _$_Saved>
    implements _$$_SavedCopyWith<$Res> {
  __$$_SavedCopyWithImpl(_$_Saved _value, $Res Function(_$_Saved) _then)
      : super(_value, _then);
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
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Saved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Option<Name> initialNameOption) initialized,
    required TResult Function(String name) nameChanged,
    required TResult Function() saved,
  }) {
    return saved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Option<Name> initialNameOption)? initialized,
    TResult? Function(String name)? nameChanged,
    TResult? Function()? saved,
  }) {
    return saved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Option<Name> initialNameOption)? initialized,
    TResult Function(String name)? nameChanged,
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
    required TResult Function(_Saved value) saved,
  }) {
    return saved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_Saved value)? saved,
  }) {
    return saved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_Saved value)? saved,
    required TResult orElse(),
  }) {
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
mixin _$PayeeCreatorState {
  Payee get payee => throw _privateConstructorUsedError;
  bool get showErrorMessages => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isEditing => throw _privateConstructorUsedError;
  Option<Either<ValueFailure, Unit>> get saveFailureOrSuccessOption =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PayeeCreatorStateCopyWith<PayeeCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayeeCreatorStateCopyWith<$Res> {
  factory $PayeeCreatorStateCopyWith(
          PayeeCreatorState value, $Res Function(PayeeCreatorState) then) =
      _$PayeeCreatorStateCopyWithImpl<$Res, PayeeCreatorState>;
  @useResult
  $Res call(
      {Payee payee,
      bool showErrorMessages,
      bool isSaving,
      bool isEditing,
      Option<Either<ValueFailure, Unit>> saveFailureOrSuccessOption});

  $PayeeCopyWith<$Res> get payee;
}

/// @nodoc
class _$PayeeCreatorStateCopyWithImpl<$Res, $Val extends PayeeCreatorState>
    implements $PayeeCreatorStateCopyWith<$Res> {
  _$PayeeCreatorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payee = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      payee: null == payee
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as Payee,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, Unit>>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PayeeCopyWith<$Res> get payee {
    return $PayeeCopyWith<$Res>(_value.payee, (value) {
      return _then(_value.copyWith(payee: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PayeeCreatorStateCopyWith<$Res>
    implements $PayeeCreatorStateCopyWith<$Res> {
  factory _$$_PayeeCreatorStateCopyWith(_$_PayeeCreatorState value,
          $Res Function(_$_PayeeCreatorState) then) =
      __$$_PayeeCreatorStateCopyWithImpl<$Res>;
  @override
  @useResult
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
class __$$_PayeeCreatorStateCopyWithImpl<$Res>
    extends _$PayeeCreatorStateCopyWithImpl<$Res, _$_PayeeCreatorState>
    implements _$$_PayeeCreatorStateCopyWith<$Res> {
  __$$_PayeeCreatorStateCopyWithImpl(
      _$_PayeeCreatorState _value, $Res Function(_$_PayeeCreatorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payee = null,
    Object? showErrorMessages = null,
    Object? isSaving = null,
    Object? isEditing = null,
    Object? saveFailureOrSuccessOption = null,
  }) {
    return _then(_$_PayeeCreatorState(
      payee: null == payee
          ? _value.payee
          : payee // ignore: cast_nullable_to_non_nullable
              as Payee,
      showErrorMessages: null == showErrorMessages
          ? _value.showErrorMessages
          : showErrorMessages // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isEditing: null == isEditing
          ? _value.isEditing
          : isEditing // ignore: cast_nullable_to_non_nullable
              as bool,
      saveFailureOrSuccessOption: null == saveFailureOrSuccessOption
          ? _value.saveFailureOrSuccessOption
          : saveFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<ValueFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_PayeeCreatorState implements _PayeeCreatorState {
  const _$_PayeeCreatorState(
      {required this.payee,
      required this.showErrorMessages,
      required this.isSaving,
      required this.isEditing,
      required this.saveFailureOrSuccessOption});

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
        (other.runtimeType == runtimeType &&
            other is _$_PayeeCreatorState &&
            (identical(other.payee, payee) || other.payee == payee) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                other.showErrorMessages == showErrorMessages) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isEditing, isEditing) ||
                other.isEditing == isEditing) &&
            (identical(other.saveFailureOrSuccessOption,
                    saveFailureOrSuccessOption) ||
                other.saveFailureOrSuccessOption ==
                    saveFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(runtimeType, payee, showErrorMessages,
      isSaving, isEditing, saveFailureOrSuccessOption);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PayeeCreatorStateCopyWith<_$_PayeeCreatorState> get copyWith =>
      __$$_PayeeCreatorStateCopyWithImpl<_$_PayeeCreatorState>(
          this, _$identity);
}

abstract class _PayeeCreatorState implements PayeeCreatorState {
  const factory _PayeeCreatorState(
      {required final Payee payee,
      required final bool showErrorMessages,
      required final bool isSaving,
      required final bool isEditing,
      required final Option<Either<ValueFailure, Unit>>
          saveFailureOrSuccessOption}) = _$_PayeeCreatorState;

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
  @JsonKey(ignore: true)
  _$$_PayeeCreatorStateCopyWith<_$_PayeeCreatorState> get copyWith =>
      throw _privateConstructorUsedError;
}
