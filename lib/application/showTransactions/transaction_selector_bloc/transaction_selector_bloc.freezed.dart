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
    required TResult Function(String id) toggleSelected,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? toggleSelected,
    TResult? Function()? deleteSelected,
    TResult? Function()? toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? toggleSelected,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelected value) toggleSelected,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelected value)? toggleSelected,
    TResult? Function(_DeleteSelected value)? deleteSelected,
    TResult? Function(_ToggleModifying value)? toggleModifying,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelected value)? toggleSelected,
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
      _$TransactionSelectorEventCopyWithImpl<$Res, TransactionSelectorEvent>;
}

/// @nodoc
class _$TransactionSelectorEventCopyWithImpl<$Res,
        $Val extends TransactionSelectorEvent>
    implements $TransactionSelectorEventCopyWith<$Res> {
  _$TransactionSelectorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ToggleSelectedCopyWith<$Res> {
  factory _$$_ToggleSelectedCopyWith(
          _$_ToggleSelected value, $Res Function(_$_ToggleSelected) then) =
      __$$_ToggleSelectedCopyWithImpl<$Res>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_ToggleSelectedCopyWithImpl<$Res>
    extends _$TransactionSelectorEventCopyWithImpl<$Res, _$_ToggleSelected>
    implements _$$_ToggleSelectedCopyWith<$Res> {
  __$$_ToggleSelectedCopyWithImpl(
      _$_ToggleSelected _value, $Res Function(_$_ToggleSelected) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_ToggleSelected(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ToggleSelected implements _ToggleSelected {
  const _$_ToggleSelected(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'TransactionSelectorEvent.toggleSelected(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ToggleSelected &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ToggleSelectedCopyWith<_$_ToggleSelected> get copyWith =>
      __$$_ToggleSelectedCopyWithImpl<_$_ToggleSelected>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) toggleSelected,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) {
    return toggleSelected(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? toggleSelected,
    TResult? Function()? deleteSelected,
    TResult? Function()? toggleModifying,
  }) {
    return toggleSelected?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? toggleSelected,
    TResult Function()? deleteSelected,
    TResult Function()? toggleModifying,
    required TResult orElse(),
  }) {
    if (toggleSelected != null) {
      return toggleSelected(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ToggleSelected value) toggleSelected,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) {
    return toggleSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelected value)? toggleSelected,
    TResult? Function(_DeleteSelected value)? deleteSelected,
    TResult? Function(_ToggleModifying value)? toggleModifying,
  }) {
    return toggleSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelected value)? toggleSelected,
    TResult Function(_DeleteSelected value)? deleteSelected,
    TResult Function(_ToggleModifying value)? toggleModifying,
    required TResult orElse(),
  }) {
    if (toggleSelected != null) {
      return toggleSelected(this);
    }
    return orElse();
  }
}

abstract class _ToggleSelected implements TransactionSelectorEvent {
  const factory _ToggleSelected(final String id) = _$_ToggleSelected;

  String get id;
  @JsonKey(ignore: true)
  _$$_ToggleSelectedCopyWith<_$_ToggleSelected> get copyWith =>
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
    extends _$TransactionSelectorEventCopyWithImpl<$Res, _$_DeleteSelected>
    implements _$$_DeleteSelectedCopyWith<$Res> {
  __$$_DeleteSelectedCopyWithImpl(
      _$_DeleteSelected _value, $Res Function(_$_DeleteSelected) _then)
      : super(_value, _then);
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
    required TResult Function(String id) toggleSelected,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) {
    return deleteSelected();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? toggleSelected,
    TResult? Function()? deleteSelected,
    TResult? Function()? toggleModifying,
  }) {
    return deleteSelected?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? toggleSelected,
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
    required TResult Function(_ToggleSelected value) toggleSelected,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) {
    return deleteSelected(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelected value)? toggleSelected,
    TResult? Function(_DeleteSelected value)? deleteSelected,
    TResult? Function(_ToggleModifying value)? toggleModifying,
  }) {
    return deleteSelected?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelected value)? toggleSelected,
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
    extends _$TransactionSelectorEventCopyWithImpl<$Res, _$_ToggleModifying>
    implements _$$_ToggleModifyingCopyWith<$Res> {
  __$$_ToggleModifyingCopyWithImpl(
      _$_ToggleModifying _value, $Res Function(_$_ToggleModifying) _then)
      : super(_value, _then);
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
    required TResult Function(String id) toggleSelected,
    required TResult Function() deleteSelected,
    required TResult Function() toggleModifying,
  }) {
    return toggleModifying();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? toggleSelected,
    TResult? Function()? deleteSelected,
    TResult? Function()? toggleModifying,
  }) {
    return toggleModifying?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? toggleSelected,
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
    required TResult Function(_ToggleSelected value) toggleSelected,
    required TResult Function(_DeleteSelected value) deleteSelected,
    required TResult Function(_ToggleModifying value) toggleModifying,
  }) {
    return toggleModifying(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ToggleSelected value)? toggleSelected,
    TResult? Function(_DeleteSelected value)? deleteSelected,
    TResult? Function(_ToggleModifying value)? toggleModifying,
  }) {
    return toggleModifying?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ToggleSelected value)? toggleSelected,
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
  UnmodifiableSetView<dynamic> get selectedTransactions =>
      throw _privateConstructorUsedError;
  UnmodifiableSetView<dynamic> get deletedTransactions =>
      throw _privateConstructorUsedError;
  bool get isModifying => throw _privateConstructorUsedError;
  bool get isDeleting => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TransactionSelectorStateCopyWith<TransactionSelectorState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionSelectorStateCopyWith<$Res> {
  factory $TransactionSelectorStateCopyWith(TransactionSelectorState value,
          $Res Function(TransactionSelectorState) then) =
      _$TransactionSelectorStateCopyWithImpl<$Res, TransactionSelectorState>;
  @useResult
  $Res call(
      {UnmodifiableSetView<dynamic> selectedTransactions,
      UnmodifiableSetView<dynamic> deletedTransactions,
      bool isModifying,
      bool isDeleting});
}

/// @nodoc
class _$TransactionSelectorStateCopyWithImpl<$Res,
        $Val extends TransactionSelectorState>
    implements $TransactionSelectorStateCopyWith<$Res> {
  _$TransactionSelectorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTransactions = null,
    Object? deletedTransactions = null,
    Object? isModifying = null,
    Object? isDeleting = null,
  }) {
    return _then(_value.copyWith(
      selectedTransactions: null == selectedTransactions
          ? _value.selectedTransactions
          : selectedTransactions // ignore: cast_nullable_to_non_nullable
              as UnmodifiableSetView<dynamic>,
      deletedTransactions: null == deletedTransactions
          ? _value.deletedTransactions
          : deletedTransactions // ignore: cast_nullable_to_non_nullable
              as UnmodifiableSetView<dynamic>,
      isModifying: null == isModifying
          ? _value.isModifying
          : isModifying // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TransactionSelectorStateCopyWith<$Res>
    implements $TransactionSelectorStateCopyWith<$Res> {
  factory _$$_TransactionSelectorStateCopyWith(
          _$_TransactionSelectorState value,
          $Res Function(_$_TransactionSelectorState) then) =
      __$$_TransactionSelectorStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UnmodifiableSetView<dynamic> selectedTransactions,
      UnmodifiableSetView<dynamic> deletedTransactions,
      bool isModifying,
      bool isDeleting});
}

/// @nodoc
class __$$_TransactionSelectorStateCopyWithImpl<$Res>
    extends _$TransactionSelectorStateCopyWithImpl<$Res,
        _$_TransactionSelectorState>
    implements _$$_TransactionSelectorStateCopyWith<$Res> {
  __$$_TransactionSelectorStateCopyWithImpl(_$_TransactionSelectorState _value,
      $Res Function(_$_TransactionSelectorState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedTransactions = null,
    Object? deletedTransactions = null,
    Object? isModifying = null,
    Object? isDeleting = null,
  }) {
    return _then(_$_TransactionSelectorState(
      selectedTransactions: null == selectedTransactions
          ? _value.selectedTransactions
          : selectedTransactions // ignore: cast_nullable_to_non_nullable
              as UnmodifiableSetView<dynamic>,
      deletedTransactions: null == deletedTransactions
          ? _value.deletedTransactions
          : deletedTransactions // ignore: cast_nullable_to_non_nullable
              as UnmodifiableSetView<dynamic>,
      isModifying: null == isModifying
          ? _value.isModifying
          : isModifying // ignore: cast_nullable_to_non_nullable
              as bool,
      isDeleting: null == isDeleting
          ? _value.isDeleting
          : isDeleting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_TransactionSelectorState implements _TransactionSelectorState {
  const _$_TransactionSelectorState(
      {required this.selectedTransactions,
      required this.deletedTransactions,
      required this.isModifying,
      required this.isDeleting});

  @override
  final UnmodifiableSetView<dynamic> selectedTransactions;
  @override
  final UnmodifiableSetView<dynamic> deletedTransactions;
  @override
  final bool isModifying;
  @override
  final bool isDeleting;

  @override
  String toString() {
    return 'TransactionSelectorState(selectedTransactions: $selectedTransactions, deletedTransactions: $deletedTransactions, isModifying: $isModifying, isDeleting: $isDeleting)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TransactionSelectorState &&
            const DeepCollectionEquality()
                .equals(other.selectedTransactions, selectedTransactions) &&
            const DeepCollectionEquality()
                .equals(other.deletedTransactions, deletedTransactions) &&
            (identical(other.isModifying, isModifying) ||
                other.isModifying == isModifying) &&
            (identical(other.isDeleting, isDeleting) ||
                other.isDeleting == isDeleting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(selectedTransactions),
      const DeepCollectionEquality().hash(deletedTransactions),
      isModifying,
      isDeleting);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TransactionSelectorStateCopyWith<_$_TransactionSelectorState>
      get copyWith => __$$_TransactionSelectorStateCopyWithImpl<
          _$_TransactionSelectorState>(this, _$identity);
}

abstract class _TransactionSelectorState implements TransactionSelectorState {
  const factory _TransactionSelectorState(
      {required final UnmodifiableSetView<dynamic> selectedTransactions,
      required final UnmodifiableSetView<dynamic> deletedTransactions,
      required final bool isModifying,
      required final bool isDeleting}) = _$_TransactionSelectorState;

  @override
  UnmodifiableSetView<dynamic> get selectedTransactions;
  @override
  UnmodifiableSetView<dynamic> get deletedTransactions;
  @override
  bool get isModifying;
  @override
  bool get isDeleting;
  @override
  @JsonKey(ignore: true)
  _$$_TransactionSelectorStateCopyWith<_$_TransactionSelectorState>
      get copyWith => throw _privateConstructorUsedError;
}
