// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_TransactionDTO _$_$_TransactionDTOFromJson(Map<String, dynamic> json) {
  return _$_TransactionDTO(
    id: convertToString(json['id'] as int),
    amount: (json['amount'] as num).toDouble(),
    memo: json['memo'] as String,
    dateInMillisecondsSinceEpoch: json['dateInMillisecondsSinceEpoch'] as int,
    subcatID: json['subcatID'] as String,
    subcatName: json['subcategoryName'] as String,
    subcatCategoryId: json['categoryID'] as String,
    subcatBudgeted: (json['subcatBudgeted'] as num?)?.toDouble() ?? 0.0,
    subcatAvailable: (json['subcatAvailable'] as num?)?.toDouble() ?? 0.0,
    payeeID: json['payeeID'] as String,
    payeeName: json['payeeName'] as String,
    accountID: json['accountID'] as String,
    accountName: json['accountName'] as String,
    accountBalance: (json['balance'] as num).toDouble(),
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
  val['amount'] = instance.amount;
  val['memo'] = instance.memo;
  val['dateInMillisecondsSinceEpoch'] = instance.dateInMillisecondsSinceEpoch;
  val['subcatID'] = instance.subcatID;
  writeNotNull('subcategoryName', ignore(instance.subcatName));
  writeNotNull('categoryID', ignore(instance.subcatCategoryId));
  writeNotNull('subcatBudgeted', ignore(instance.subcatBudgeted));
  writeNotNull('subcatAvailable', ignore(instance.subcatAvailable));
  val['payeeID'] = instance.payeeID;
  writeNotNull('payeeName', ignore(instance.payeeName));
  val['accountID'] = instance.accountID;
  writeNotNull('accountName', ignore(instance.accountName));
  writeNotNull('balance', ignore(instance.accountBalance));
  return val;
}
