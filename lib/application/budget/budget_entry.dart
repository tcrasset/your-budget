import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';
import 'package:your_budget/domain/budgetvalue/budgetvalue.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_entry.freezed.dart';

@freezed
class BudgetEntry with _$BudgetEntry {
  UniqueId get id => budgetValue.id;
  UniqueId get subcategoryId => subcategory.id;
  UniqueId get categoryId => subcategory.categoryID;
  Name get name => subcategory.name;
  Amount get budgeted => budgetValue.budgeted;
  Amount get available => budgetValue.available;
  DateTime get date => budgetValue.date;

  factory BudgetEntry({required Subcategory subcategory, required BudgetValue budgetValue}) =
      _BudgetEntry;

  const BudgetEntry._();
}
