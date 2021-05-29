// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDTO _$_$_TransactionDTOFromJson(Map<String, dynamic> json) {
  return _$_TransactionDTO(
    subcatID: json['subcatID'] as String,
    subcatName: json['subcatName'] as String,
    payeeID: json['payeeID'] as String,
    payeeName: json['payeeName'] as String,
    accountID: json['accountID'] as String,
    accountName: json['accountName'] as String,
    amount: (json['amount'] as num)?.toDouble(),
    memo: json['memo'] as String,
    dateInMillisecondsSinceEpoch: json['dateInMillisecondsSinceEpoch'] as int,
  );
}

Map<String, dynamic> _$_$_TransactionDTOToJson(_$_TransactionDTO instance) {
  final val = <String, dynamic>{
    'subcatID': instance.subcatID,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('subcatName', instance.subcatName);
  val['payeeID'] = instance.payeeID;
  writeNotNull('payeeName', instance.payeeName);
  val['accountID'] = instance.accountID;
  writeNotNull('accountName', instance.accountName);
  val['amount'] = instance.amount;
  val['memo'] = instance.memo;
  val['dateInMillisecondsSinceEpoch'] = instance.dateInMillisecondsSinceEpoch;
  return val;
}
