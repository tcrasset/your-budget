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
      type: json['type'] as String,
      subcatID: json['subcatID'] as String?,
      subcatName: json['subcategoryName'] as String?,
      subcatCategoryId: json['categoryID'] as String?,
      receiverName: json['receiverName'] as String,
      receiverBalance: (json['receiverBalance'] as num?)?.toDouble(),
      receiverId: convertToString(json['receiverId'] as int),
      giverName: json['giverName'] as String,
      giverBalance: (json['giverBalance'] as num?)?.toDouble(),
      giverId: convertToString(json['giverId'] as int),
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
  val['type'] = instance.type;
  val['subcatID'] = instance.subcatID;
  writeNotNull('subcategoryName', ignore(instance.subcatName));
  writeNotNull('categoryID', ignore(instance.subcatCategoryId));
  writeNotNull('receiverName', ignore(instance.receiverName));
  writeNotNull('receiverBalance', ignore(instance.receiverBalance));
  val['receiverId'] = instance.receiverId;
  writeNotNull('giverName', ignore(instance.giverName));
  writeNotNull('giverBalance', ignore(instance.giverBalance));
  val['giverId'] = instance.giverId;
  return val;
}
