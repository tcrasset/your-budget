// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subcategory_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SubcategoryDTO _$_$_SubcategoryDTOFromJson(Map<String, dynamic> json) {
  return _$_SubcategoryDTO(
    id: convertToString(json['id'] as int),
    categoryID: json['categoryID'] as String,
    name: json['name'] as String,
    budgeted: (json['budgeted'] as num?)?.toDouble() ?? 0.0,
    available: (json['available'] as num?)?.toDouble() ?? 0.0,
  );
}

Map<String, dynamic> _$_$_SubcategoryDTOToJson(_$_SubcategoryDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['categoryID'] = instance.categoryID;
  val['name'] = instance.name;
  val['budgeted'] = instance.budgeted;
  val['available'] = instance.available;
  return val;
}
