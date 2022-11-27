// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'subcategory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubcategoryDTO _$SubcategoryDTOFromJson(Map<String, dynamic> json) {
  return _SubcategoryDTO.fromJson(json);
}

/// @nodoc
mixin _$SubcategoryDTO {
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id =>
      throw _privateConstructorUsedError; //Do not use id in database
  @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE)
  String get categoryID => throw _privateConstructorUsedError;
  @JsonKey(name: DatabaseConstants.SUBCAT_NAME)
  String get name => throw _privateConstructorUsedError;
  double get budgeted => throw _privateConstructorUsedError;
  double get available => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubcategoryDTOCopyWith<SubcategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubcategoryDTOCopyWith<$Res> {
  factory $SubcategoryDTOCopyWith(
          SubcategoryDTO value, $Res Function(SubcategoryDTO) then) =
      _$SubcategoryDTOCopyWithImpl<$Res, SubcategoryDTO>;
  @useResult
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE)
          String categoryID,
      @JsonKey(name: DatabaseConstants.SUBCAT_NAME)
          String name,
      double budgeted,
      double available});
}

/// @nodoc
class _$SubcategoryDTOCopyWithImpl<$Res, $Val extends SubcategoryDTO>
    implements $SubcategoryDTOCopyWith<$Res> {
  _$SubcategoryDTOCopyWithImpl(this._value, this._then);

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
    Object? budgeted = null,
    Object? available = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budgeted: null == budgeted
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as double,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SubcategoryDTOCopyWith<$Res>
    implements $SubcategoryDTOCopyWith<$Res> {
  factory _$$_SubcategoryDTOCopyWith(
          _$_SubcategoryDTO value, $Res Function(_$_SubcategoryDTO) then) =
      __$$_SubcategoryDTOCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE)
          String categoryID,
      @JsonKey(name: DatabaseConstants.SUBCAT_NAME)
          String name,
      double budgeted,
      double available});
}

/// @nodoc
class __$$_SubcategoryDTOCopyWithImpl<$Res>
    extends _$SubcategoryDTOCopyWithImpl<$Res, _$_SubcategoryDTO>
    implements _$$_SubcategoryDTOCopyWith<$Res> {
  __$$_SubcategoryDTOCopyWithImpl(
      _$_SubcategoryDTO _value, $Res Function(_$_SubcategoryDTO) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? categoryID = null,
    Object? name = null,
    Object? budgeted = null,
    Object? available = null,
  }) {
    return _then(_$_SubcategoryDTO(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: null == categoryID
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budgeted: null == budgeted
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as double,
      available: null == available
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SubcategoryDTO extends _SubcategoryDTO {
  const _$_SubcategoryDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required this.id,
      @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE)
          required this.categoryID,
      @JsonKey(name: DatabaseConstants.SUBCAT_NAME)
          required this.name,
      this.budgeted = 0.00,
      this.available = 0.00})
      : super._();

  factory _$_SubcategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$$_SubcategoryDTOFromJson(json);

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  final String id;
//Do not use id in database
  @override
  @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE)
  final String categoryID;
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_NAME)
  final String name;
  @override
  @JsonKey()
  final double budgeted;
  @override
  @JsonKey()
  final double available;

  @override
  String toString() {
    return 'SubcategoryDTO(id: $id, categoryID: $categoryID, name: $name, budgeted: $budgeted, available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SubcategoryDTO &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.categoryID, categoryID) ||
                other.categoryID == categoryID) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.budgeted, budgeted) ||
                other.budgeted == budgeted) &&
            (identical(other.available, available) ||
                other.available == available));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, categoryID, name, budgeted, available);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SubcategoryDTOCopyWith<_$_SubcategoryDTO> get copyWith =>
      __$$_SubcategoryDTOCopyWithImpl<_$_SubcategoryDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SubcategoryDTOToJson(
      this,
    );
  }
}

abstract class _SubcategoryDTO extends SubcategoryDTO {
  const factory _SubcategoryDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required final String id,
      @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE)
          required final String categoryID,
      @JsonKey(name: DatabaseConstants.SUBCAT_NAME)
          required final String name,
      final double budgeted,
      final double available}) = _$_SubcategoryDTO;
  const _SubcategoryDTO._() : super._();

  factory _SubcategoryDTO.fromJson(Map<String, dynamic> json) =
      _$_SubcategoryDTO.fromJson;

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id;
  @override //Do not use id in database
  @JsonKey(name: DatabaseConstants.CAT_ID_OUTSIDE)
  String get categoryID;
  @override
  @JsonKey(name: DatabaseConstants.SUBCAT_NAME)
  String get name;
  @override
  double get budgeted;
  @override
  double get available;
  @override
  @JsonKey(ignore: true)
  _$$_SubcategoryDTOCopyWith<_$_SubcategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
