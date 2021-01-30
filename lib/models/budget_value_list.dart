import 'package:your_budget/models/object_list.dart';
import 'package:your_budget/models/queries.dart';

import 'categories.dart';

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
    List<BudgetValue> toRemove = _budgetvalues
        .where((budgetvalue) => budgetvalue.subcategoryId == subcatId)
        .toList();
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
    return _budgetvalues
        .where((budgetvalue) => budgetvalue.subcategoryId == subcatId)
        .toList();
  }
}
