// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'budget_entry_manager_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BudgetEntryManagerEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetEntryManagerEventCopyWith<$Res> {
  factory $BudgetEntryManagerEventCopyWith(BudgetEntryManagerEvent value,
          $Res Function(BudgetEntryManagerEvent) then) =
      _$BudgetEntryManagerEventCopyWithImpl<$Res, BudgetEntryManagerEvent>;
}

/// @nodoc
class _$BudgetEntryManagerEventCopyWithImpl<$Res,
        $Val extends BudgetEntryManagerEvent>
    implements $BudgetEntryManagerEventCopyWith<$Res> {
  _$BudgetEntryManagerEventCopyWithImpl(this._value, this._then);

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
}

/// @nodoc
class __$$_InitializedCopyWithImpl<$Res>
    extends _$BudgetEntryManagerEventCopyWithImpl<$Res, _$_Initialized>
    implements _$$_InitializedCopyWith<$Res> {
  __$$_InitializedCopyWithImpl(
      _$_Initialized _value, $Res Function(_$_Initialized) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initialized implements _Initialized {
  const _$_Initialized();

  @override
  String toString() {
    return 'BudgetEntryManagerEvent.initialized()';
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
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
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
    required TResult Function(_BudgetedChanged value) budgetedChanged,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    required TResult orElse(),
  }) {
    if (initialized != null) {
      return initialized(this);
    }
    return orElse();
  }
}

abstract class _Initialized implements BudgetEntryManagerEvent {
  const factory _Initialized() = _$_Initialized;
}

/// @nodoc
abstract class _$$_BudgetedChangedCopyWith<$Res> {
  factory _$$_BudgetedChangedCopyWith(
          _$_BudgetedChanged value, $Res Function(_$_BudgetedChanged) then) =
      __$$_BudgetedChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({UniqueId id, String budgeted});
}

/// @nodoc
class __$$_BudgetedChangedCopyWithImpl<$Res>
    extends _$BudgetEntryManagerEventCopyWithImpl<$Res, _$_BudgetedChanged>
    implements _$$_BudgetedChangedCopyWith<$Res> {
  __$$_BudgetedChangedCopyWithImpl(
      _$_BudgetedChanged _value, $Res Function(_$_BudgetedChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? budgeted = null,
  }) {
    return _then(_$_BudgetedChanged(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      null == budgeted
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_BudgetedChanged implements _BudgetedChanged {
  const _$_BudgetedChanged(this.id, this.budgeted);

  @override
  final UniqueId id;
  @override
  final String budgeted;

  @override
  String toString() {
    return 'BudgetEntryManagerEvent.budgetedChanged(id: $id, budgeted: $budgeted)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetedChanged &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.budgeted, budgeted) ||
                other.budgeted == budgeted));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, budgeted);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetedChangedCopyWith<_$_BudgetedChanged> get copyWith =>
      __$$_BudgetedChangedCopyWithImpl<_$_BudgetedChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
  }) {
    return budgetedChanged(id, budgeted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
  }) {
    return budgetedChanged?.call(id, budgeted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    required TResult orElse(),
  }) {
    if (budgetedChanged != null) {
      return budgetedChanged(id, budgeted);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
  }) {
    return budgetedChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
  }) {
    return budgetedChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    required TResult orElse(),
  }) {
    if (budgetedChanged != null) {
      return budgetedChanged(this);
    }
    return orElse();
  }
}

abstract class _BudgetedChanged implements BudgetEntryManagerEvent {
  const factory _BudgetedChanged(final UniqueId id, final String budgeted) =
      _$_BudgetedChanged;

  UniqueId get id;
  String get budgeted;
  @JsonKey(ignore: true)
  _$$_BudgetedChangedCopyWith<_$_BudgetedChanged> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$BudgetEntryManagerState {
/*required*/
  bool get wasModified => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BudgetEntryManagerStateCopyWith<BudgetEntryManagerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetEntryManagerStateCopyWith<$Res> {
  factory $BudgetEntryManagerStateCopyWith(BudgetEntryManagerState value,
          $Res Function(BudgetEntryManagerState) then) =
      _$BudgetEntryManagerStateCopyWithImpl<$Res, BudgetEntryManagerState>;
  @useResult
  $Res call({bool wasModified});
}

/// @nodoc
class _$BudgetEntryManagerStateCopyWithImpl<$Res,
        $Val extends BudgetEntryManagerState>
    implements $BudgetEntryManagerStateCopyWith<$Res> {
  _$BudgetEntryManagerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wasModified = null,
  }) {
    return _then(_value.copyWith(
      wasModified: null == wasModified
          ? _value.wasModified
          : wasModified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_BudgetEntryManagerStateCopyWith<$Res>
    implements $BudgetEntryManagerStateCopyWith<$Res> {
  factory _$$_BudgetEntryManagerStateCopyWith(_$_BudgetEntryManagerState value,
          $Res Function(_$_BudgetEntryManagerState) then) =
      __$$_BudgetEntryManagerStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool wasModified});
}

/// @nodoc
class __$$_BudgetEntryManagerStateCopyWithImpl<$Res>
    extends _$BudgetEntryManagerStateCopyWithImpl<$Res,
        _$_BudgetEntryManagerState>
    implements _$$_BudgetEntryManagerStateCopyWith<$Res> {
  __$$_BudgetEntryManagerStateCopyWithImpl(_$_BudgetEntryManagerState _value,
      $Res Function(_$_BudgetEntryManagerState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wasModified = null,
  }) {
    return _then(_$_BudgetEntryManagerState(
      wasModified: null == wasModified
          ? _value.wasModified
          : wasModified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_BudgetEntryManagerState implements _BudgetEntryManagerState {
  const _$_BudgetEntryManagerState({required this.wasModified});

/*required*/
  @override
  final bool wasModified;

  @override
  String toString() {
    return 'BudgetEntryManagerState(wasModified: $wasModified)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_BudgetEntryManagerState &&
            (identical(other.wasModified, wasModified) ||
                other.wasModified == wasModified));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wasModified);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_BudgetEntryManagerStateCopyWith<_$_BudgetEntryManagerState>
      get copyWith =>
          __$$_BudgetEntryManagerStateCopyWithImpl<_$_BudgetEntryManagerState>(
              this, _$identity);
}

abstract class _BudgetEntryManagerState implements BudgetEntryManagerState {
  const factory _BudgetEntryManagerState({required final bool wasModified}) =
      _$_BudgetEntryManagerState;

  @override /*required*/
  bool get wasModified;
  @override
  @JsonKey(ignore: true)
  _$$_BudgetEntryManagerStateCopyWith<_$_BudgetEntryManagerState>
      get copyWith => throw _privateConstructorUsedError;
}
