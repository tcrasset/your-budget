// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subcategory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SubcategoryTearOff {
  const _$SubcategoryTearOff();

  _Subcategory call(
      {required UniqueId id,
      required UniqueId categoryID,
      required Name name,
      required Amount budgeted,
      required Amount available}) {
    return _Subcategory(
      id: id,
      categoryID: categoryID,
      name: name,
      budgeted: budgeted,
      available: available,
    );
  }
}

/// @nodoc
const $Subcategory = _$SubcategoryTearOff();

/// @nodoc
mixin _$Subcategory {
  UniqueId get id => throw _privateConstructorUsedError;
  UniqueId get categoryID => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;
  Amount get budgeted => throw _privateConstructorUsedError;
  Amount get available => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubcategoryCopyWith<Subcategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryCopyWith<$Res> {
  factory $SubcategoryCopyWith(
          Subcategory value, $Res Function(Subcategory) then) =
      _$SubcategoryCopyWithImpl<$Res>;
  $Res call(
      {UniqueId id,
      UniqueId categoryID,
      Name name,
      Amount budgeted,
      Amount available});
}

/// @nodoc
class _$SubcategoryCopyWithImpl<$Res> implements $SubcategoryCopyWith<$Res> {
  _$SubcategoryCopyWithImpl(this._value, this._then);

  final Subcategory _value;
  // ignore: unused_field
  final $Res Function(Subcategory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryID = freezed,
    Object? name = freezed,
    Object? budgeted = freezed,
    Object? available = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      categoryID: categoryID == freezed
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as Amount,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }
}

/// @nodoc
abstract class _$SubcategoryCopyWith<$Res>
    implements $SubcategoryCopyWith<$Res> {
  factory _$SubcategoryCopyWith(
          _Subcategory value, $Res Function(_Subcategory) then) =
      __$SubcategoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {UniqueId id,
      UniqueId categoryID,
      Name name,
      Amount budgeted,
      Amount available});
}

/// @nodoc
class __$SubcategoryCopyWithImpl<$Res> extends _$SubcategoryCopyWithImpl<$Res>
    implements _$SubcategoryCopyWith<$Res> {
  __$SubcategoryCopyWithImpl(
      _Subcategory _value, $Res Function(_Subcategory) _then)
      : super(_value, (v) => _then(v as _Subcategory));

  @override
  _Subcategory get _value => super._value as _Subcategory;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryID = freezed,
    Object? name = freezed,
    Object? budgeted = freezed,
    Object? available = freezed,
  }) {
    return _then(_Subcategory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      categoryID: categoryID == freezed
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as Amount,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as Amount,
    ));
  }
}

/// @nodoc

class _$_Subcategory extends _Subcategory {
  const _$_Subcategory(
      {required this.id,
      required this.categoryID,
      required this.name,
      required this.budgeted,
      required this.available})
      : super._();

  @override
  final UniqueId id;
  @override
  final UniqueId categoryID;
  @override
  final Name name;
  @override
  final Amount budgeted;
  @override
  final Amount available;

  @override
  String toString() {
    return 'Subcategory(id: $id, categoryID: $categoryID, name: $name, budgeted: $budgeted, available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Subcategory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.categoryID, categoryID) ||
                const DeepCollectionEquality()
                    .equals(other.categoryID, categoryID)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.budgeted, budgeted) ||
                const DeepCollectionEquality()
                    .equals(other.budgeted, budgeted)) &&
            (identical(other.available, available) ||
                const DeepCollectionEquality()
                    .equals(other.available, available)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(categoryID) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(budgeted) ^
      const DeepCollectionEquality().hash(available);

  @JsonKey(ignore: true)
  @override
  _$SubcategoryCopyWith<_Subcategory> get copyWith =>
      __$SubcategoryCopyWithImpl<_Subcategory>(this, _$identity);
}

abstract class _Subcategory extends Subcategory {
  const factory _Subcategory(
      {required UniqueId id,
      required UniqueId categoryID,
      required Name name,
      required Amount budgeted,
      required Amount available}) = _$_Subcategory;
  const _Subcategory._() : super._();

  @override
  UniqueId get id => throw _privateConstructorUsedError;
  @override
  UniqueId get categoryID => throw _privateConstructorUsedError;
  @override
  Name get name => throw _privateConstructorUsedError;
  @override
  Amount get budgeted => throw _privateConstructorUsedError;
  @override
  Amount get available => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubcategoryCopyWith<_Subcategory> get copyWith =>
      throw _privateConstructorUsedError;
}
