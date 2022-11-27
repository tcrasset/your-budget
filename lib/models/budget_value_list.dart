// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/object_list.dart';
import 'package:your_budget/models/queries.dart';

class BudgetValueList implements ObjectList<BudgetValueLegacy> {
  final Queries? queryContext;
  final List<BudgetValueLegacy?> _budgetvalues;
  List<BudgetValueLegacy?> get budgetvalues => _budgetvalues;

  BudgetValueList(this.queryContext, this._budgetvalues);

  @override
  void add(BudgetValueLegacy? budgetValue) {
    _budgetvalues.add(budgetValue);
  }

  void removeBySubcatId(int? subcatId) {
    final List<BudgetValueLegacy?> toRemove = _budgetvalues
        .where((budgetvalue) => budgetvalue!.subcategoryId == subcatId)
        .toList();
    toRemove.forEach((budgetvalue) {
      queryContext!.deleteBudgetValue(budgetvalue!.id);
      _budgetvalues.remove(budgetvalue);
    });
  }

  BudgetValueLegacy? getByBudget(DateTime? date, int? subcatId) {
    return _budgetvalues.singleWhere(
      (budgetValue) =>
          (budgetValue!.subcategoryId == subcatId) &&
          (budgetValue.year == date!.year) &&
          (budgetValue.month == date.month),
    );
  }

  List<BudgetValueLegacy?> getAllBySubcatId(int subcatId) {
    return _budgetvalues
        .where((budgetvalue) => budgetvalue!.subcategoryId == subcatId)
        .toList();
  }

  void updateBudgetValue({
    required int? subcatId,
    required DateTime? date,
    required double? newBudgeted,
    required double? newAvailable,
  }) {
    final BudgetValueLegacy budgetValue = getByBudget(date, subcatId)!;
    budgetValue.budgeted = newBudgeted;
    budgetValue.available = newAvailable;
    queryContext!.updateBudgetValue(budgetValue);
  }
}
