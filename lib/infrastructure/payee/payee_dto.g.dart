// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payee_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PayeeDTO _$_$_PayeeDTOFromJson(Map<String, dynamic> json) {
  return _$_PayeeDTO(
    id: convertToString(json['id'] as int),
    name: json['payeeName'] as String,
  );
}

Map<String, dynamic> _$_$_PayeeDTOToJson(_$_PayeeDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['payeeName'] = instance.name;
  return val;
}
