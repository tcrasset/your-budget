// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'subcategory_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubcategoryDTO _$SubcategoryDTOFromJson(Map<String, dynamic> json) {
  return _SubcategoryDTO.fromJson(json);
}

/// @nodoc
class _$SubcategoryDTOTearOff {
  const _$SubcategoryDTOTearOff();

  _SubcategoryDTO call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required String id,
      required String categoryID,
      required String name,
      double budgeted = 0.0,
      double available = 0.0}) {
    return _SubcategoryDTO(
      id: id,
      categoryID: categoryID,
      name: name,
      budgeted: budgeted,
      available: available,
    );
  }

  SubcategoryDTO fromJson(Map<String, Object> json) {
    return SubcategoryDTO.fromJson(json);
  }
}

/// @nodoc
const $SubcategoryDTO = _$SubcategoryDTOTearOff();

/// @nodoc
mixin _$SubcategoryDTO {
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id =>
      throw _privateConstructorUsedError; //Do not use id in database
  String get categoryID => throw _privateConstructorUsedError;
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
      _$SubcategoryDTOCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      String categoryID,
      String name,
      double budgeted,
      double available});
}

/// @nodoc
class _$SubcategoryDTOCopyWithImpl<$Res>
    implements $SubcategoryDTOCopyWith<$Res> {
  _$SubcategoryDTOCopyWithImpl(this._value, this._then);

  final SubcategoryDTO _value;
  // ignore: unused_field
  final $Res Function(SubcategoryDTO) _then;

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
              as String,
      categoryID: categoryID == freezed
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as double,
      available: available == freezed
          ? _value.available
          : available // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$SubcategoryDTOCopyWith<$Res>
    implements $SubcategoryDTOCopyWith<$Res> {
  factory _$SubcategoryDTOCopyWith(
          _SubcategoryDTO value, $Res Function(_SubcategoryDTO) then) =
      __$SubcategoryDTOCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          String id,
      String categoryID,
      String name,
      double budgeted,
      double available});
}

/// @nodoc
class __$SubcategoryDTOCopyWithImpl<$Res>
    extends _$SubcategoryDTOCopyWithImpl<$Res>
    implements _$SubcategoryDTOCopyWith<$Res> {
  __$SubcategoryDTOCopyWithImpl(
      _SubcategoryDTO _value, $Res Function(_SubcategoryDTO) _then)
      : super(_value, (v) => _then(v as _SubcategoryDTO));

  @override
  _SubcategoryDTO get _value => super._value as _SubcategoryDTO;

  @override
  $Res call({
    Object? id = freezed,
    Object? categoryID = freezed,
    Object? name = freezed,
    Object? budgeted = freezed,
    Object? available = freezed,
  }) {
    return _then(_SubcategoryDTO(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      categoryID: categoryID == freezed
          ? _value.categoryID
          : categoryID // ignore: cast_nullable_to_non_nullable
              as String,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      budgeted: budgeted == freezed
          ? _value.budgeted
          : budgeted // ignore: cast_nullable_to_non_nullable
              as double,
      available: available == freezed
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
      required this.categoryID,
      required this.name,
      this.budgeted = 0.0,
      this.available = 0.0})
      : super._();

  factory _$_SubcategoryDTO.fromJson(Map<String, dynamic> json) =>
      _$_$_SubcategoryDTOFromJson(json);

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  final String id;
  @override //Do not use id in database
  final String categoryID;
  @override
  final String name;
  @JsonKey(defaultValue: 0.0)
  @override
  final double budgeted;
  @JsonKey(defaultValue: 0.0)
  @override
  final double available;

  @override
  String toString() {
    return 'SubcategoryDTO(id: $id, categoryID: $categoryID, name: $name, budgeted: $budgeted, available: $available)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubcategoryDTO &&
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
  _$SubcategoryDTOCopyWith<_SubcategoryDTO> get copyWith =>
      __$SubcategoryDTOCopyWithImpl<_SubcategoryDTO>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubcategoryDTOToJson(this);
  }
}

abstract class _SubcategoryDTO extends SubcategoryDTO {
  const factory _SubcategoryDTO(
      {@JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
          required String id,
      required String categoryID,
      required String name,
      double budgeted,
      double available}) = _$_SubcategoryDTO;
  const _SubcategoryDTO._() : super._();

  factory _SubcategoryDTO.fromJson(Map<String, dynamic> json) =
      _$_SubcategoryDTO.fromJson;

  @override
  @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
  String get id => throw _privateConstructorUsedError;
  @override //Do not use id in database
  String get categoryID => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  double get budgeted => throw _privateConstructorUsedError;
  @override
  double get available => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubcategoryDTOCopyWith<_SubcategoryDTO> get copyWith =>
      throw _privateConstructorUsedError;
}
