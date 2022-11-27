// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubcategoryDTO _$$_SubcategoryDTOFromJson(Map<String, dynamic> json) =>
    _$_SubcategoryDTO(
      id: convertToString(json['id'] as int),
      categoryID: json['categoryID'] as String,
      name: json['subcategoryName'] as String,
    );

Map<String, dynamic> _$$_SubcategoryDTOToJson(_$_SubcategoryDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['categoryID'] = instance.categoryID;
  val['subcategoryName'] = instance.name;
  return val;
}
