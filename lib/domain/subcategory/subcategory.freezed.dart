// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subcategory.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Subcategory {
  UniqueId get id => throw _privateConstructorUsedError;
  UniqueId get categoryID => throw _privateConstructorUsedError;
  Name get name => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SubcategoryCopyWith<Subcategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryCopyWith<$Res> {
  factory $SubcategoryCopyWith(
          Subcategory value, $Res Function(Subcategory) then) =
      _$SubcategoryCopyWithImpl<$Res, Subcategory>;
  @useResult
  $Res call({UniqueId id, UniqueId categoryID, Name name});
}

/// @nodoc
class _$SubcategoryCopyWithImpl<$Res, $Val extends Subcategory>
    implements $SubcategoryCopyWith<$Res> {
  _$SubcategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryID = null,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubcategoryCopyWith<$Res>
    implements $SubcategoryCopyWith<$Res> {
  factory _$$_SubcategoryCopyWith(
          _$_Subcategory value, $Res Function(_$_Subcategory) then) =
      __$$_SubcategoryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UniqueId id, UniqueId categoryID, Name name});
}

/// @nodoc
class __$$_SubcategoryCopyWithImpl<$Res>
    extends _$SubcategoryCopyWithImpl<$Res, _$_Subcategory>
    implements _$$_SubcategoryCopyWith<$Res> {
  __$$_SubcategoryCopyWithImpl(
      _$_Subcategory _value, $Res Function(_$_Subcategory) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryID = null,
    Object? name = null,
  }) {
    return _then(_$_Subcategory(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as Name,
    ));
  }
}

/// @nodoc

class _$_Subcategory extends _Subcategory {
  const _$_Subcategory(
      {required this.id, required this.categoryID, required this.name})
      : super._();

  @override
  final UniqueId id;
  @override
  final UniqueId categoryID;
  @override
  final Name name;

  @override
  String toString() {
    return 'Subcategory(id: $id, categoryID: $categoryID, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Subcategory &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, categoryID, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubcategoryCopyWith<_$_Subcategory> get copyWith =>
      __$$_SubcategoryCopyWithImpl<_$_Subcategory>(this, _$identity);
}

abstract class _Subcategory extends Subcategory {
  const factory _Subcategory(
      {required final UniqueId id,
      required final UniqueId categoryID,
      required final Name name}) = _$_Subcategory;
  const _Subcategory._() : super._();

  @override
  UniqueId get id;
  @override
  UniqueId get categoryID;
  @override
  Name get name;
  @override
  @JsonKey(ignore: true)
  _$$_SubcategoryCopyWith<_$_Subcategory> get copyWith =>
      throw _privateConstructorUsedError;
}
