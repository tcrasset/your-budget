// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDTO _$$_AccountDTOFromJson(Map<String, dynamic> json) =>
    _$_AccountDTO(
      id: convertToString(json['id'] as int),
      name: json['accountName'] as String,
      balance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$_AccountDTOToJson(_$_AccountDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['accountName'] = instance.name;
  val['balance'] = instance.balance;
  return val;
}
