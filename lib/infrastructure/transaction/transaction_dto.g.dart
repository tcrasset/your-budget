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
    dateInMillisecondsSinceEpoch: json['dateInMillisecondsSinceEpoch'] as int,
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
      'dateInMillisecondsSinceEpoch': instance.dateInMillisecondsSinceEpoch,
    };
