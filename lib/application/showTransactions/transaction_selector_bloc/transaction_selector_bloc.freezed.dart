// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'transaction_selector_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TransactionSelectorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) select,
    required TResult Function(String id) unselect,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Selected value) select,
    required TResult Function(_Unselected value) unselect,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSelectorEventCopyWith<$Res> {
  factory $TransactionSelectorEventCopyWith(TransactionSelectorEvent value,
          $Res Function(TransactionSelectorEvent) then) =
      _$TransactionSelectorEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionSelectorEventCopyWithImpl<$Res>
    implements $TransactionSelectorEventCopyWith<$Res> {
  _$TransactionSelectorEventCopyWithImpl(this._value, this._then);

  final TransactionSelectorEvent _value;
  // ignore: unused_field
  final $Res Function(TransactionSelectorEvent) _then;
}

/// @nodoc
abstract class _$$_SelectedCopyWith<$Res> {
  factory _$$_SelectedCopyWith(
          _$_Selected value, $Res Function(_$_Selected) then) =
      __$$_SelectedCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$_SelectedCopyWithImpl<$Res>
    extends _$TransactionSelectorEventCopyWithImpl<$Res>
    implements _$$_SelectedCopyWith<$Res> {
  __$$_SelectedCopyWithImpl(
      _$_Selected _value, $Res Function(_$_Selected) _then)
      : super(_value, (v) => _then(v as _$_Selected));

  @override
  _$_Selected get _value => super._value as _$_Selected;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_Selected(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Selected implements _Selected {
  const _$_Selected(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TransactionSelectorEvent.select(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Selected &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      __$$_SelectedCopyWithImpl<_$_Selected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) select,
    required TResult Function(String id) unselect,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) {
    return select(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
  }) {
    return select?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Selected value) select,
    required TResult Function(_Unselected value) unselect,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class _Selected implements TransactionSelectorEvent {
  const factory _Selected(final String id) = _$_Selected;

  String get id;
  @JsonKey(ignore: true)
  _$$_SelectedCopyWith<_$_Selected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_UnselectedCopyWith<$Res> {
  factory _$$_UnselectedCopyWith(
          _$_Unselected value, $Res Function(_$_Unselected) then) =
      __$$_UnselectedCopyWithImpl<$Res>;
  $Res call({String id});
}

/// @nodoc
class __$$_UnselectedCopyWithImpl<$Res>
    extends _$TransactionSelectorEventCopyWithImpl<$Res>
    implements _$$_UnselectedCopyWith<$Res> {
  __$$_UnselectedCopyWithImpl(
      _$_Unselected _value, $Res Function(_$_Unselected) _then)
      : super(_value, (v) => _then(v as _$_Unselected));

  @override
  _$_Unselected get _value => super._value as _$_Unselected;

  @override
  $Res call({
    Object? id = freezed,
  }) {
    return _then(_$_Unselected(
      id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Unselected implements _Unselected {
  const _$_Unselected(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TransactionSelectorEvent.unselect(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Unselected &&
            const DeepCollectionEquality().equals(other.id, id));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(id));

  @JsonKey(ignore: true)
  @override
  _$$_UnselectedCopyWith<_$_Unselected> get copyWith =>
      __$$_UnselectedCopyWithImpl<_$_Unselected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) select,
    required TResult Function(String id) unselect,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) {
    return unselect(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
  }) {
    return unselect?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
    required TResult orElse(),
  }) {
    if (unselect != null) {
      return unselect(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Selected value) select,
    required TResult Function(_Unselected value) unselect,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) {
    return unselect(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
  }) {
    return unselect?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
    required TResult orElse(),
  }) {
    if (unselect != null) {
      return unselect(this);
    }
    return orElse();
  }
}

abstract class _Unselected implements TransactionSelectorEvent {
  const factory _Unselected(final String id) = _$_Unselected;

  String get id;
  @JsonKey(ignore: true)
  _$$_UnselectedCopyWith<_$_Unselected> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_DeleteSelectedCopyWith<$Res> {
  factory _$$_DeleteSelectedCopyWith(
          _$_DeleteSelected value, $Res Function(_$_DeleteSelected) then) =
      __$$_DeleteSelectedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_DeleteSelectedCopyWithImpl<$Res>
    extends _$TransactionSelectorEventCopyWithImpl<$Res>
    implements _$$_DeleteSelectedCopyWith<$Res> {
  __$$_DeleteSelectedCopyWithImpl(
      _$_DeleteSelected _value, $Res Function(_$_DeleteSelected) _then)
      : super(_value, (v) => _then(v as _$_DeleteSelected));

  @override
  _$_DeleteSelected get _value => super._value as _$_DeleteSelected;
}

/// @nodoc

class _$_DeleteSelected implements _DeleteSelected {
  const _$_DeleteSelected();

  @override
  String toString() {
    return 'TransactionSelectorEvent.deleteSelected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_DeleteSelected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) select,
    required TResult Function(String id) unselect,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) {
    return deleteSelected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
  }) {
    return deleteSelected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
    required TResult orElse(),
  }) {
    if (deleteSelected != null) {
      return deleteSelected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Selected value) select,
    required TResult Function(_Unselected value) unselect,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) {
    return deleteSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
  }) {
    return deleteSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
    required TResult orElse(),
  }) {
    if (deleteSelected != null) {
      return deleteSelected(this);
    }
    return orElse();
  }
}

abstract class _DeleteSelected implements TransactionSelectorEvent {
  const factory _DeleteSelected() = _$_DeleteSelected;
}

/// @nodoc
abstract class _$$_ToggleModifyingCopyWith<$Res> {
  factory _$$_ToggleModifyingCopyWith(
          _$_ToggleModifying value, $Res Function(_$_ToggleModifying) then) =
      __$$_ToggleModifyingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ToggleModifyingCopyWithImpl<$Res>
    extends _$TransactionSelectorEventCopyWithImpl<$Res>
    implements _$$_ToggleModifyingCopyWith<$Res> {
  __$$_ToggleModifyingCopyWithImpl(
      _$_ToggleModifying _value, $Res Function(_$_ToggleModifying) _then)
      : super(_value, (v) => _then(v as _$_ToggleModifying));

  @override
  _$_ToggleModifying get _value => super._value as _$_ToggleModifying;
}

/// @nodoc

class _$_ToggleModifying implements _ToggleModifying {
  const _$_ToggleModifying();

  @override
  String toString() {
    return 'TransactionSelectorEvent.toggleModifying()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ToggleModifying);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) select,
    required TResult Function(String id) unselect,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) {
    return toggleModifying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
  }) {
    return toggleModifying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? select,
    TResult Function(String id)? unselect,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
    required TResult orElse(),
  }) {
    if (toggleModifying != null) {
      return toggleModifying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Selected value) select,
    required TResult Function(_Unselected value) unselect,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) {
    return toggleModifying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
  }) {
    return toggleModifying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Selected value)? select,
    TResult Function(_Unselected value)? unselect,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
    required TResult orElse(),
  }) {
    if (toggleModifying != null) {
      return toggleModifying(this);
    }
    return orElse();
  }
}

abstract class _ToggleModifying implements TransactionSelectorEvent {
  const factory _ToggleModifying() = _$_ToggleModifying;
}

/// @nodoc
mixin _$TransactionSelectorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() modifying,
    required TResult Function() notModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Modifying value) modifying,
    required TResult Function(NotModifying value) notModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSelectorStateCopyWith<$Res> {
  factory $TransactionSelectorStateCopyWith(TransactionSelectorState value,
          $Res Function(TransactionSelectorState) then) =
      _$TransactionSelectorStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$TransactionSelectorStateCopyWithImpl<$Res>
    implements $TransactionSelectorStateCopyWith<$Res> {
  _$TransactionSelectorStateCopyWithImpl(this._value, this._then);

  final TransactionSelectorState _value;
  // ignore: unused_field
  final $Res Function(TransactionSelectorState) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$TransactionSelectorStateCopyWithImpl<$Res>
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
    return 'TransactionSelectorState.initial()';
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
    required TResult Function() deleted,
    required TResult Function() modifying,
    required TResult Function() notModifying,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
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
    required TResult Function(Deleted value) deleted,
    required TResult Function(Modifying value) modifying,
    required TResult Function(NotModifying value) notModifying,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TransactionSelectorState {
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
    extends _$TransactionSelectorStateCopyWithImpl<$Res>
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
    return 'TransactionSelectorState.loading()';
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
    required TResult Function() deleted,
    required TResult Function() modifying,
    required TResult Function() notModifying,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
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
    required TResult Function(Deleted value) deleted,
    required TResult Function(Modifying value) modifying,
    required TResult Function(NotModifying value) notModifying,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TransactionSelectorState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$DeletedCopyWith<$Res> {
  factory _$$DeletedCopyWith(_$Deleted value, $Res Function(_$Deleted) then) =
      __$$DeletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeletedCopyWithImpl<$Res>
    extends _$TransactionSelectorStateCopyWithImpl<$Res>
    implements _$$DeletedCopyWith<$Res> {
  __$$DeletedCopyWithImpl(_$Deleted _value, $Res Function(_$Deleted) _then)
      : super(_value, (v) => _then(v as _$Deleted));

  @override
  _$Deleted get _value => super._value as _$Deleted;
}

/// @nodoc

class _$Deleted implements Deleted {
  const _$Deleted();

  @override
  String toString() {
    return 'TransactionSelectorState.deleted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Deleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() modifying,
    required TResult Function() notModifying,
  }) {
    return deleted();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
  }) {
    return deleted?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Modifying value) modifying,
    required TResult Function(NotModifying value) notModifying,
  }) {
    return deleted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
  }) {
    return deleted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
    required TResult orElse(),
  }) {
    if (deleted != null) {
      return deleted(this);
    }
    return orElse();
  }
}

abstract class Deleted implements TransactionSelectorState {
  const factory Deleted() = _$Deleted;
}

/// @nodoc
abstract class _$$ModifyingCopyWith<$Res> {
  factory _$$ModifyingCopyWith(
          _$Modifying value, $Res Function(_$Modifying) then) =
      __$$ModifyingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ModifyingCopyWithImpl<$Res>
    extends _$TransactionSelectorStateCopyWithImpl<$Res>
    implements _$$ModifyingCopyWith<$Res> {
  __$$ModifyingCopyWithImpl(
      _$Modifying _value, $Res Function(_$Modifying) _then)
      : super(_value, (v) => _then(v as _$Modifying));

  @override
  _$Modifying get _value => super._value as _$Modifying;
}

/// @nodoc

class _$Modifying implements Modifying {
  const _$Modifying();

  @override
  String toString() {
    return 'TransactionSelectorState.modifying()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Modifying);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() modifying,
    required TResult Function() notModifying,
  }) {
    return modifying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
  }) {
    return modifying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
    required TResult orElse(),
  }) {
    if (modifying != null) {
      return modifying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Modifying value) modifying,
    required TResult Function(NotModifying value) notModifying,
  }) {
    return modifying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
  }) {
    return modifying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
    required TResult orElse(),
  }) {
    if (modifying != null) {
      return modifying(this);
    }
    return orElse();
  }
}

abstract class Modifying implements TransactionSelectorState {
  const factory Modifying() = _$Modifying;
}

/// @nodoc
abstract class _$$NotModifyingCopyWith<$Res> {
  factory _$$NotModifyingCopyWith(
          _$NotModifying value, $Res Function(_$NotModifying) then) =
      __$$NotModifyingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NotModifyingCopyWithImpl<$Res>
    extends _$TransactionSelectorStateCopyWithImpl<$Res>
    implements _$$NotModifyingCopyWith<$Res> {
  __$$NotModifyingCopyWithImpl(
      _$NotModifying _value, $Res Function(_$NotModifying) _then)
      : super(_value, (v) => _then(v as _$NotModifying));

  @override
  _$NotModifying get _value => super._value as _$NotModifying;
}

/// @nodoc

class _$NotModifying implements NotModifying {
  const _$NotModifying();

  @override
  String toString() {
    return 'TransactionSelectorState.notModifying()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NotModifying);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() deleted,
    required TResult Function() modifying,
    required TResult Function() notModifying,
  }) {
    return notModifying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
  }) {
    return notModifying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? deleted,
    TResult Function()? modifying,
    TResult Function()? notModifying,
    required TResult orElse(),
  }) {
    if (notModifying != null) {
      return notModifying();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(Deleted value) deleted,
    required TResult Function(Modifying value) modifying,
    required TResult Function(NotModifying value) notModifying,
  }) {
    return notModifying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
  }) {
    return notModifying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(Deleted value)? deleted,
    TResult Function(Modifying value)? modifying,
    TResult Function(NotModifying value)? notModifying,
    required TResult orElse(),
  }) {
    if (notModifying != null) {
      return notModifying(this);
    }
    return orElse();
  }
}

abstract class NotModifying implements TransactionSelectorState {
  const factory NotModifying() = _$NotModifying;
}
