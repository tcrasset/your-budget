// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDTO _$_$_TransactionDTOFromJson(Map<String, dynamic> json) {
  return _$_TransactionDTO(
    subcatID: json['subcatID'] as String,
    payeeID: json['payeeID'] as String,
    accountID: json['accountID'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    memo: json['memo'] as String,
    dateInMillisecondsSinceEpoch: json['dateInMillisecondsSinceEpoch'] as int,
  );
}

Map<String, dynamic> _$_$_TransactionDTOToJson(_$_TransactionDTO instance) => <String, dynamic>{
      'subcatID': instance.subcatID,
      'payeeID': instance.payeeID,
      'accountID': instance.accountID,
      'amount': instance.amount,
      'memo': instance.memo,
      'dateInMillisecondsSinceEpoch': instance.dateInMillisecondsSinceEpoch,
    };
