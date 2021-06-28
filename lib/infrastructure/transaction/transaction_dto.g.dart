// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDTO _$_$_TransactionDTOFromJson(Map<String, dynamic> json) {
  return _$_TransactionDTO(
    id: convertToString(json['id'] as int),
    subcatID: json['subcatID'] as String,
    subcatName: json['subcatName'] as String,
    payeeID: json['payeeID'] as String,
    payeeName: json['payeeName'] as String,
    accountID: json['accountID'] as String,
    accountName: json['accountName'] as String,
    amount: (json['amount'] as num).toDouble(),
    memo: json['memo'] as String,
    dateInMillisecondsSinceEpoch: json['dateInMillisecondsSinceEpoch'] as int,
  );
}

Map<String, dynamic> _$_$_TransactionDTOToJson(_$_TransactionDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['subcatID'] = instance.subcatID;
  writeNotNull('subcatName', ignore(instance.subcatName));
  val['payeeID'] = instance.payeeID;
  writeNotNull('payeeName', ignore(instance.payeeName));
  val['accountID'] = instance.accountID;
  writeNotNull('accountName', ignore(instance.accountName));
  val['amount'] = instance.amount;
  val['memo'] = instance.memo;
  val['dateInMillisecondsSinceEpoch'] = instance.dateInMillisecondsSinceEpoch;
  return val;
}
