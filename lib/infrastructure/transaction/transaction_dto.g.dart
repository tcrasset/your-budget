// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDTO _$$_TransactionDTOFromJson(Map<String, dynamic> json) =>
    _$_TransactionDTO(
      id: convertToString(json['id'] as int),
      amount: (json['amount'] as num).toDouble(),
      memo: json['memo'] as String,
      dateInMillisecondsSinceEpoch: json['dateInMillisecondsSinceEpoch'] as int,
      isInitialTransaction: json['isInitialTransaction'] as int,
      subcatID: json['subcatID'] as String,
      subcatName: json['subcategoryName'] as String,
      subcatCategoryId: json['categoryID'] as String,
      payeeID: json['payeeID'] as String,
      payeeName: json['payeeName'] as String,
      accountID: json['accountID'] as String,
      accountName: json['accountName'] as String,
      accountBalance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$$_TransactionDTOToJson(_$_TransactionDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['amount'] = instance.amount;
  val['memo'] = instance.memo;
  val['dateInMillisecondsSinceEpoch'] = instance.dateInMillisecondsSinceEpoch;
  val['isInitialTransaction'] = instance.isInitialTransaction;
  val['subcatID'] = instance.subcatID;
  writeNotNull('subcategoryName', ignore(instance.subcatName));
  writeNotNull('categoryID', ignore(instance.subcatCategoryId));
  val['payeeID'] = instance.payeeID;
  writeNotNull('payeeName', ignore(instance.payeeName));
  val['accountID'] = instance.accountID;
  writeNotNull('accountName', ignore(instance.accountName));
  writeNotNull('balance', ignore(instance.accountBalance));
  return val;
}
