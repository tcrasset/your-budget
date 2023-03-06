// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budgetvalue_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BudgetValueDTO _$$_BudgetValueDTOFromJson(Map<String, dynamic> json) =>
    _$_BudgetValueDTO(
      id: json['id'] as String,
      subcategoryId: json['subcatID'] as String,
      budgeted: (json['budgeted'] as num).toDouble(),
      available: (json['available'] as num).toDouble(),
      month: json['month'] as int,
      year: json['year'] as int,
    );

Map<String, dynamic> _$$_BudgetValueDTOToJson(_$_BudgetValueDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subcatID': instance.subcategoryId,
      'budgeted': instance.budgeted,
      'available': instance.available,
      'month': instance.month,
      'year': instance.year,
    };
