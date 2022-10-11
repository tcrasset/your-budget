// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CategoryDTO _$$_CategoryDTOFromJson(Map<String, dynamic> json) =>
    _$_CategoryDTO(
      id: convertToString(json['id'] as int),
      name: json['categoryName'] as String,
    );

Map<String, dynamic> _$$_CategoryDTOToJson(_$_CategoryDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['categoryName'] = instance.name;
  return val;
}
