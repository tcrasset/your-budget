// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_AccountDTO _$_$_AccountDTOFromJson(Map<String, dynamic> json) {
  return _$_AccountDTO(
    name: json['name'] as String,
    balance: (json['balance'] as num)?.toDouble(),
  );
}

Map<String, dynamic> _$_$_AccountDTOToJson(_$_AccountDTO instance) => <String, dynamic>{
      'name': instance.name,
      'balance': instance.balance,
    };
