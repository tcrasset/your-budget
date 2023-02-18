// Package imports:
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

part 'budgetvalue_dto.freezed.dart';
part 'budgetvalue_dto.g.dart';

@freezed
abstract class BudgetValueDTO implements _$BudgetValueDTO {
  const BudgetValueDTO._();

  const factory BudgetValueDTO({
    @JsonKey(toJson: ignore, fromJson: convertToString, includeIfNull: false)
        required String id, //Do not use id in database
    @JsonKey(name: DatabaseConstants.SUBCAT_ID_OUTSIDE) required String subcategoryId,
    @JsonKey(name: DatabaseConstants.BUDGET_VALUE_BUDGETED) required double budgeted,
    @JsonKey(name: DatabaseConstants.BUDGET_VALUE_AVAILABLE) required double available,
    @JsonKey(name: DatabaseConstants.BUDGET_VALUE_MONTH) required int month,
    @JsonKey(name: DatabaseConstants.BUDGET_VALUE_YEAR) required int year,
  }) = _BudgetValueDTO;

  factory BudgetValueDTO.fromDomain(BudgetValue budgetvalue) {
    return BudgetValueDTO(
      id: budgetvalue.id.getOrCrash(), //Not used in database
      subcategoryId: budgetvalue.subcategoryId.getOrCrash(),
      budgeted: budgetvalue.budgeted.getOrCrash(),
      available: budgetvalue.available.getOrCrash(),
      month: budgetvalue.date.month,
      year: budgetvalue.date.year,
    );
  }

  BudgetValue toDomain() {
    return BudgetValue(
      id: UniqueId.fromUniqueString(id),
      subcategoryId: UniqueId.fromUniqueString(subcategoryId),
      budgeted: Amount(budgeted.toString()),
      available: Amount(available.toString()),
      date: DateTime(year, month),
    );
  }

  factory BudgetValueDTO.fromJson(Map<String, dynamic> json) => _$BudgetValueDTOFromJson(json);
}
