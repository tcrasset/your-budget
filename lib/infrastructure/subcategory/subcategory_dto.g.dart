// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubcategoryDTO _$_$_SubcategoryDTOFromJson(Map<String, dynamic> json) {
  return _$_SubcategoryDTO(
    categoryID: json['categoryID'] as String,
    name: json['name'] as String,
    budgeted: (json['budgeted'] as num)?.toDouble() ?? 0.0,
    available: (json['available'] as num)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$_$_SubcategoryDTOToJson(_$_SubcategoryDTO instance) =>
    <String, dynamic>{
      'categoryID': instance.categoryID,
      'name': instance.name,
      'budgeted': instance.budgeted,
      'available': instance.available,
    };
