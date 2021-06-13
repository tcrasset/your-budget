// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

part of 'subcategory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

/// @nodoc
class _$SubcategoryTearOff {
  const _$SubcategoryTearOff();

// ignore: unused_element
  _Subcategory call(
      {@required UniqueId id,
      @required UniqueId categoryID,
      @required Name name,
      @required Amount budgeted,
      @required Amount available}) {
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
// ignore: unused_element
const $Subcategory = _$SubcategoryTearOff();

/// @nodoc
mixin _$Subcategory {
  UniqueId get id;
  UniqueId get categoryID;
  Name get name;
  Amount get budgeted;
  Amount get available;

  $SubcategoryCopyWith<Subcategory> get copyWith;
}

/// @nodoc
abstract class $SubcategoryCopyWith<$Res> {
  factory $SubcategoryCopyWith(Subcategory value, $Res Function(Subcategory) then) =
      _$SubcategoryCopyWithImpl<$Res>;
  $Res call({UniqueId id, UniqueId categoryID, Name name, Amount budgeted, Amount available});
}

/// @nodoc
class _$SubcategoryCopyWithImpl<$Res> implements $SubcategoryCopyWith<$Res> {
  _$SubcategoryCopyWithImpl(this._value, this._then);

  final Subcategory _value;
  // ignore: unused_field
  final $Res Function(Subcategory) _then;

  @override
  $Res call({
    Object id = freezed,
    Object categoryID = freezed,
    Object name = freezed,
    Object budgeted = freezed,
    Object available = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed ? _value.id : id as UniqueId,
      categoryID: categoryID == freezed ? _value.categoryID : categoryID as UniqueId,
      name: name == freezed ? _value.name : name as Name,
      budgeted: budgeted == freezed ? _value.budgeted : budgeted as Amount,
      available: available == freezed ? _value.available : available as Amount,
    ));
  }
}

/// @nodoc
abstract class _$SubcategoryCopyWith<$Res> implements $SubcategoryCopyWith<$Res> {
  factory _$SubcategoryCopyWith(_Subcategory value, $Res Function(_Subcategory) then) =
      __$SubcategoryCopyWithImpl<$Res>;
  @override
  $Res call({UniqueId id, UniqueId categoryID, Name name, Amount budgeted, Amount available});
}

/// @nodoc
class __$SubcategoryCopyWithImpl<$Res> extends _$SubcategoryCopyWithImpl<$Res>
    implements _$SubcategoryCopyWith<$Res> {
  __$SubcategoryCopyWithImpl(_Subcategory _value, $Res Function(_Subcategory) _then)
      : super(_value, (v) => _then(v as _Subcategory));

  @override
  _Subcategory get _value => super._value as _Subcategory;

  @override
  $Res call({
    Object id = freezed,
    Object categoryID = freezed,
    Object name = freezed,
    Object budgeted = freezed,
    Object available = freezed,
  }) {
    return _then(_Subcategory(
      id: id == freezed ? _value.id : id as UniqueId,
      categoryID: categoryID == freezed ? _value.categoryID : categoryID as UniqueId,
      name: name == freezed ? _value.name : name as Name,
      budgeted: budgeted == freezed ? _value.budgeted : budgeted as Amount,
      available: available == freezed ? _value.available : available as Amount,
    ));
  }
}

/// @nodoc
class _$_Subcategory extends _Subcategory {
  const _$_Subcategory(
      {@required this.id,
      @required this.categoryID,
      @required this.name,
      @required this.budgeted,
      @required this.available})
      : assert(id != null),
        assert(categoryID != null),
        assert(name != null),
        assert(budgeted != null),
        assert(available != null),
        super._();

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
            (identical(other.id, id) || const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.categoryID, categoryID) ||
                const DeepCollectionEquality().equals(other.categoryID, categoryID)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.budgeted, budgeted) ||
                const DeepCollectionEquality().equals(other.budgeted, budgeted)) &&
            (identical(other.available, available) ||
                const DeepCollectionEquality().equals(other.available, available)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(categoryID) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(budgeted) ^
      const DeepCollectionEquality().hash(available);

  @override
  _$SubcategoryCopyWith<_Subcategory> get copyWith =>
      __$SubcategoryCopyWithImpl<_Subcategory>(this, _$identity);
}

abstract class _Subcategory extends Subcategory {
  const _Subcategory._() : super._();
  const factory _Subcategory(
      {@required UniqueId id,
      @required UniqueId categoryID,
      @required Name name,
      @required Amount budgeted,
      @required Amount available}) = _$_Subcategory;

  @override
  UniqueId get id;
  @override
  UniqueId get categoryID;
  @override
  Name get name;
  @override
  Amount get budgeted;
  @override
  Amount get available;
  @override
  _$SubcategoryCopyWith<_Subcategory> get copyWith;
}
