// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubcategoryDTO _$_$_SubcategoryDTOFromJson(Map<String, dynamic> json) {
  return _$_SubcategoryDTO(
    parentID: json['parentID'] as String,
    name: json['name'] as String,
    budgeted: (json['budgeted'] as num)?.toDouble(),
    available: (json['available'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_SubcategoryDTOToJson(_$_SubcategoryDTO instance) => <String, dynamic>{
      'parentID': instance.parentID,
      'name': instance.name,
      'budgeted': instance.budgeted,
      'available': instance.available,
    };
