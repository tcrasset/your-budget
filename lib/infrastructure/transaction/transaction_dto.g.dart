// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MoneyTransactionDTO _$_$_MoneyTransactionDTOFromJson(
    Map<String, dynamic> json) {
  return _$_MoneyTransactionDTO(
    subcatID: json['subcatID'] as int,
    payeeID: json['payeeID'] as int,
    accountID: json['accountID'] as int,
    amount: (json['amount'] as num)?.toDouble(),
    memo: json['memo'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  );
}

Map<String, dynamic> _$_$_MoneyTransactionDTOToJson(
        _$_MoneyTransactionDTO instance) =>
    <String, dynamic>{
      'subcatID': instance.subcatID,
      'payeeID': instance.payeeID,
      'accountID': instance.accountID,
      'amount': instance.amount,
      'memo': instance.memo,
      'date': instance.date?.toIso8601String(),
    };
