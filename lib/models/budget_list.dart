// Project imports:
import 'package:your_budget/models/budget.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/object_list.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/utils.dart';

class BudgetList implements ObjectList<Budget> {
  final Queries? queryContext;
  final List<Budget?> _budgets;

  List<Budget?> get budgets => _budgets;

  BudgetList(this.queryContext, this._budgets);
  //TODO: Test without testing side effects happen
  @override
  void add(Budget? budget) {
    _budgets.add(budget);
  }

  Budget? getByDate(DateTime? date) {
    return _budgets.singleWhere(
      (budget) => isSameMonth(budget!.date, date!),
      orElse: () => null,
    );
  }

  void addMainCategory(MainCategory? cat) {
    for (final Budget? budget in _budgets) {
      budget!.addMainCategory(cat);
    }
  }

  void addSubcategory(SubCategory? subcat) {
    for (final Budget? budget in _budgets) {
      budget!.addSubcategory(subcat!);
    }
  }

  void updateSubcategory(SubCategory subcat) {
    for (final Budget? budget in _budgets) {
      budget!.updateSubCategory(subcat);
    }
  }

  void updateSubcategoryName({required int? id, required String newName}) {
    for (final Budget? budget in _budgets) {
      budget!.updateSubCategoryName(id: id, newName: newName);
    }
  }

  void updateMainCategory(MainCategory cat) {
    for (final Budget? budget in _budgets) {
      budget!.updateMainCategory(cat);
    }
  }

  void removeSubcategory(int? subcatId, String? catId) {
    for (final Budget? budget in _budgets) {
      budget!.removeSubcategory(subcatId, catId);
    }
  }

  void removeMainCategory(int? catId) {
    for (final Budget? budget in _budgets) {
      budget!.removeCategory(catId);
    }
  }

  double computeAvgBudgetedPerSubcategory(int? subcatId) {
    double totalBudgeted = 0;
    int nbNonZero = 0;

    for (final budget in _budgets) {
      final SubCategory subcat =
          budget!.subcategories.singleWhere((subcat) => subcat!.id == subcatId)!;
      if (subcat.budgeted != 0.00) {
        nbNonZero++;
      }
      totalBudgeted += subcat.budgeted!;
    }

    if (nbNonZero == 0) return 0.00;

    return totalBudgeted / nbNonZero;
  }
}
