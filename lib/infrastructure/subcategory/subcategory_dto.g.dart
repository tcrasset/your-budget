// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubcategoryDTO _$$_SubcategoryDTOFromJson(Map<String, dynamic> json) =>
    _$_SubcategoryDTO(
      id: json['id'] as String,
      categoryID: json['categoryID'] as String,
      name: json['subcategoryName'] as String,
    );

Map<String, dynamic> _$$_SubcategoryDTOToJson(_$_SubcategoryDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryID': instance.categoryID,
      'subcategoryName': instance.name,
    };
