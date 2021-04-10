// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'categories.dart';
import 'object_list.dart';
import 'queries.dart';

class BudgetValueList implements ObjectList<BudgetValue> {
  final Queries queryContext;
  final List<BudgetValue> _budgetvalues;
  List<BudgetValue> get budgetvalues => _budgetvalues;

  BudgetValueList(this.queryContext, this._budgetvalues);

  @override
  void add(BudgetValue budgetValue) {
    _budgetvalues.add(budgetValue);
  }

  void removeBySubcatId(int subcatId) {
    final List<BudgetValue> toRemove =
        _budgetvalues.where((budgetvalue) => budgetvalue.subcategoryId == subcatId).toList();
    toRemove.forEach((budgetvalue) {
      queryContext.deleteBudgetValue(budgetvalue.id);
      _budgetvalues.remove(budgetvalue);
    });
  }

  BudgetValue getByBudget(DateTime date, int subcatId) {
    return _budgetvalues.singleWhere((budgetValue) =>
        (budgetValue.subcategoryId == subcatId) &&
        (budgetValue.year == date.year) &&
        (budgetValue.month == date.month));
  }

  List<BudgetValue> getAllBySubcatId(int subcatId) {
    return _budgetvalues.where((budgetvalue) => budgetvalue.subcategoryId == subcatId).toList();
  }

  void updateBudgetValue({
    @required int subcatId,
    @required DateTime date,
    @required double newBudgeted,
    @required double newAvailable,
  }) {
    final BudgetValue budgetValue = getByBudget(date, subcatId);
    budgetValue.budgeted = newBudgeted;
    budgetValue.available = newAvailable;
    queryContext.updateBudgetValue(budgetValue);
  }
}
