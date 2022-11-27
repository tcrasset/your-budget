// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bugetvalue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BudgetValueDTO _$$_BudgetValueDTOFromJson(Map<String, dynamic> json) =>
    _$_BudgetValueDTO(
      id: convertToString(json['id'] as int),
      subcategoryId: json['subcatID'] as String,
      budgeted: (json['budgeted'] as num).toDouble(),
      available: (json['available'] as num).toDouble(),
      month: json['month'] as int,
      year: json['year'] as int,
    );

Map<String, dynamic> _$$_BudgetValueDTOToJson(_$_BudgetValueDTO instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', ignore(instance.id));
  val['subcatID'] = instance.subcategoryId;
  val['budgeted'] = instance.budgeted;
  val['available'] = instance.available;
  val['month'] = instance.month;
  val['year'] = instance.year;
  return val;
}
