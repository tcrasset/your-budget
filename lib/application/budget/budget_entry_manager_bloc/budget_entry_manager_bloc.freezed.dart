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
    required TResult Function(Subcategory subcat) add,
    required TResult Function(UniqueId id, String name) nameChanged,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
    required TResult Function(UniqueId id, String available) availableChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Subcategory subcat)? add,
    TResult? Function(UniqueId id, String name)? nameChanged,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult? Function(UniqueId id, String available)? availableChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Subcategory subcat)? add,
    TResult Function(UniqueId id, String name)? nameChanged,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult Function(UniqueId id, String available)? availableChanged,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubcategoryAdded value) add,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
    required TResult Function(_AvailableChanged value) availableChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubcategoryAdded value)? add,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
    TResult? Function(_AvailableChanged value)? availableChanged,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubcategoryAdded value)? add,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    TResult Function(_AvailableChanged value)? availableChanged,
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
    required TResult Function(Subcategory subcat) add,
    required TResult Function(UniqueId id, String name) nameChanged,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
    required TResult Function(UniqueId id, String available) availableChanged,
  }) {
    return initialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Subcategory subcat)? add,
    TResult? Function(UniqueId id, String name)? nameChanged,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult? Function(UniqueId id, String available)? availableChanged,
  }) {
    return initialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Subcategory subcat)? add,
    TResult Function(UniqueId id, String name)? nameChanged,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult Function(UniqueId id, String available)? availableChanged,
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
    required TResult Function(_SubcategoryAdded value) add,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
    required TResult Function(_AvailableChanged value) availableChanged,
  }) {
    return initialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubcategoryAdded value)? add,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
    TResult? Function(_AvailableChanged value)? availableChanged,
  }) {
    return initialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubcategoryAdded value)? add,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    TResult Function(_AvailableChanged value)? availableChanged,
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
abstract class _$$_SubcategoryAddedCopyWith<$Res> {
  factory _$$_SubcategoryAddedCopyWith(
          _$_SubcategoryAdded value, $Res Function(_$_SubcategoryAdded) then) =
      __$$_SubcategoryAddedCopyWithImpl<$Res>;
  @useResult
  $Res call({Subcategory subcat});

  $SubcategoryCopyWith<$Res> get subcat;
}

/// @nodoc
class __$$_SubcategoryAddedCopyWithImpl<$Res>
    extends _$BudgetEntryManagerEventCopyWithImpl<$Res, _$_SubcategoryAdded>
    implements _$$_SubcategoryAddedCopyWith<$Res> {
  __$$_SubcategoryAddedCopyWithImpl(
      _$_SubcategoryAdded _value, $Res Function(_$_SubcategoryAdded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subcat = null,
  }) {
    return _then(_$_SubcategoryAdded(
      null == subcat
          ? _value.subcat
          : subcat // ignore: cast_nullable_to_non_nullable
              as Subcategory,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $SubcategoryCopyWith<$Res> get subcat {
    return $SubcategoryCopyWith<$Res>(_value.subcat, (value) {
      return _then(_value.copyWith(subcat: value));
    });
  }
}

/// @nodoc

class _$_SubcategoryAdded implements _SubcategoryAdded {
  const _$_SubcategoryAdded(this.subcat);

  @override
  final Subcategory subcat;

  @override
  String toString() {
    return 'BudgetEntryManagerEvent.add(subcat: $subcat)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubcategoryAdded &&
            (identical(other.subcat, subcat) || other.subcat == subcat));
  }

  @override
  int get hashCode => Object.hash(runtimeType, subcat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubcategoryAddedCopyWith<_$_SubcategoryAdded> get copyWith =>
      __$$_SubcategoryAddedCopyWithImpl<_$_SubcategoryAdded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Subcategory subcat) add,
    required TResult Function(UniqueId id, String name) nameChanged,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
    required TResult Function(UniqueId id, String available) availableChanged,
  }) {
    return add(subcat);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Subcategory subcat)? add,
    TResult? Function(UniqueId id, String name)? nameChanged,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult? Function(UniqueId id, String available)? availableChanged,
  }) {
    return add?.call(subcat);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Subcategory subcat)? add,
    TResult Function(UniqueId id, String name)? nameChanged,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult Function(UniqueId id, String available)? availableChanged,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(subcat);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubcategoryAdded value) add,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
    required TResult Function(_AvailableChanged value) availableChanged,
  }) {
    return add(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubcategoryAdded value)? add,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
    TResult? Function(_AvailableChanged value)? availableChanged,
  }) {
    return add?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubcategoryAdded value)? add,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    TResult Function(_AvailableChanged value)? availableChanged,
    required TResult orElse(),
  }) {
    if (add != null) {
      return add(this);
    }
    return orElse();
  }
}

abstract class _SubcategoryAdded implements BudgetEntryManagerEvent {
  const factory _SubcategoryAdded(final Subcategory subcat) =
      _$_SubcategoryAdded;

  Subcategory get subcat;
  @JsonKey(ignore: true)
  _$$_SubcategoryAddedCopyWith<_$_SubcategoryAdded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_NameChangedCopyWith<$Res> {
  factory _$$_NameChangedCopyWith(
          _$_NameChanged value, $Res Function(_$_NameChanged) then) =
      __$$_NameChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({UniqueId id, String name});
}

/// @nodoc
class __$$_NameChangedCopyWithImpl<$Res>
    extends _$BudgetEntryManagerEventCopyWithImpl<$Res, _$_NameChanged>
    implements _$$_NameChangedCopyWith<$Res> {
  __$$_NameChangedCopyWithImpl(
      _$_NameChanged _value, $Res Function(_$_NameChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
  }) {
    return _then(_$_NameChanged(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_NameChanged implements _NameChanged {
  const _$_NameChanged(this.id, this.name);

  @override
  final UniqueId id;
  @override
  final String name;

  @override
  String toString() {
    return 'BudgetEntryManagerEvent.nameChanged(id: $id, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_NameChanged &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      __$$_NameChangedCopyWithImpl<_$_NameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Subcategory subcat) add,
    required TResult Function(UniqueId id, String name) nameChanged,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
    required TResult Function(UniqueId id, String available) availableChanged,
  }) {
    return nameChanged(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Subcategory subcat)? add,
    TResult? Function(UniqueId id, String name)? nameChanged,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult? Function(UniqueId id, String available)? availableChanged,
  }) {
    return nameChanged?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Subcategory subcat)? add,
    TResult Function(UniqueId id, String name)? nameChanged,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult Function(UniqueId id, String available)? availableChanged,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubcategoryAdded value) add,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
    required TResult Function(_AvailableChanged value) availableChanged,
  }) {
    return nameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubcategoryAdded value)? add,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
    TResult? Function(_AvailableChanged value)? availableChanged,
  }) {
    return nameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubcategoryAdded value)? add,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    TResult Function(_AvailableChanged value)? availableChanged,
    required TResult orElse(),
  }) {
    if (nameChanged != null) {
      return nameChanged(this);
    }
    return orElse();
  }
}

abstract class _NameChanged implements BudgetEntryManagerEvent {
  const factory _NameChanged(final UniqueId id, final String name) =
      _$_NameChanged;

  UniqueId get id;
  String get name;
  @JsonKey(ignore: true)
  _$$_NameChangedCopyWith<_$_NameChanged> get copyWith =>
      throw _privateConstructorUsedError;
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
    required TResult Function(Subcategory subcat) add,
    required TResult Function(UniqueId id, String name) nameChanged,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
    required TResult Function(UniqueId id, String available) availableChanged,
  }) {
    return budgetedChanged(id, budgeted);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Subcategory subcat)? add,
    TResult? Function(UniqueId id, String name)? nameChanged,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult? Function(UniqueId id, String available)? availableChanged,
  }) {
    return budgetedChanged?.call(id, budgeted);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Subcategory subcat)? add,
    TResult Function(UniqueId id, String name)? nameChanged,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult Function(UniqueId id, String available)? availableChanged,
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
    required TResult Function(_SubcategoryAdded value) add,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
    required TResult Function(_AvailableChanged value) availableChanged,
  }) {
    return budgetedChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubcategoryAdded value)? add,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
    TResult? Function(_AvailableChanged value)? availableChanged,
  }) {
    return budgetedChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubcategoryAdded value)? add,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    TResult Function(_AvailableChanged value)? availableChanged,
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
abstract class _$$_AvailableChangedCopyWith<$Res> {
  factory _$$_AvailableChangedCopyWith(
          _$_AvailableChanged value, $Res Function(_$_AvailableChanged) then) =
      __$$_AvailableChangedCopyWithImpl<$Res>;
  @useResult
  $Res call({UniqueId id, String available});
}

/// @nodoc
class __$$_AvailableChangedCopyWithImpl<$Res>
    extends _$BudgetEntryManagerEventCopyWithImpl<$Res, _$_AvailableChanged>
    implements _$$_AvailableChangedCopyWith<$Res> {
  __$$_AvailableChangedCopyWithImpl(
      _$_AvailableChanged _value, $Res Function(_$_AvailableChanged) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? available = null,
  }) {
    return _then(_$_AvailableChanged(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_AvailableChanged implements _AvailableChanged {
  const _$_AvailableChanged(this.id, this.available);

  @override
  final UniqueId id;
  @override
  final String available;

  @override
  String toString() {
    return 'BudgetEntryManagerEvent.availableChanged(id: $id, available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AvailableChanged &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, available);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AvailableChangedCopyWith<_$_AvailableChanged> get copyWith =>
      __$$_AvailableChangedCopyWithImpl<_$_AvailableChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initialized,
    required TResult Function(Subcategory subcat) add,
    required TResult Function(UniqueId id, String name) nameChanged,
    required TResult Function(UniqueId id, String budgeted) budgetedChanged,
    required TResult Function(UniqueId id, String available) availableChanged,
  }) {
    return availableChanged(id, available);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initialized,
    TResult? Function(Subcategory subcat)? add,
    TResult? Function(UniqueId id, String name)? nameChanged,
    TResult? Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult? Function(UniqueId id, String available)? availableChanged,
  }) {
    return availableChanged?.call(id, available);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initialized,
    TResult Function(Subcategory subcat)? add,
    TResult Function(UniqueId id, String name)? nameChanged,
    TResult Function(UniqueId id, String budgeted)? budgetedChanged,
    TResult Function(UniqueId id, String available)? availableChanged,
    required TResult orElse(),
  }) {
    if (availableChanged != null) {
      return availableChanged(id, available);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initialized value) initialized,
    required TResult Function(_SubcategoryAdded value) add,
    required TResult Function(_NameChanged value) nameChanged,
    required TResult Function(_BudgetedChanged value) budgetedChanged,
    required TResult Function(_AvailableChanged value) availableChanged,
  }) {
    return availableChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initialized value)? initialized,
    TResult? Function(_SubcategoryAdded value)? add,
    TResult? Function(_NameChanged value)? nameChanged,
    TResult? Function(_BudgetedChanged value)? budgetedChanged,
    TResult? Function(_AvailableChanged value)? availableChanged,
  }) {
    return availableChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initialized value)? initialized,
    TResult Function(_SubcategoryAdded value)? add,
    TResult Function(_NameChanged value)? nameChanged,
    TResult Function(_BudgetedChanged value)? budgetedChanged,
    TResult Function(_AvailableChanged value)? availableChanged,
    required TResult orElse(),
  }) {
    if (availableChanged != null) {
      return availableChanged(this);
    }
    return orElse();
  }
}

abstract class _AvailableChanged implements BudgetEntryManagerEvent {
  const factory _AvailableChanged(final UniqueId id, final String available) =
      _$_AvailableChanged;

  UniqueId get id;
  String get available;
  @JsonKey(ignore: true)
  _$$_AvailableChangedCopyWith<_$_AvailableChanged> get copyWith =>
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
