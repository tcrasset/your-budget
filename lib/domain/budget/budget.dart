import 'package:dartz/dartz.dart';
import 'package:your_budget/domain/budget/budget_entry.dart';
import 'package:your_budget/domain/category/category.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/value_failure.dart';

class BudgetEntryGroups {
  Category category;
  List<BudgetEntry> entries;

  Amount get totalBudgeted =>
      entries.fold(Amount.fromDouble(0.0), (budgeted, entry) => budgeted += entry.budgeted);
  Amount get totalAvailable =>
      entries.fold(Amount.fromDouble(0.0), (available, entry) => available += entry.available);

  BudgetEntryGroups({required this.category, required this.entries});
}

class Budget {
  DateTime date;
  List<BudgetEntryGroups> groups;
  Amount toBeBudgeted;

  Budget({
    required this.date,
    required this.groups,
    required this.toBeBudgeted,
  });
}
