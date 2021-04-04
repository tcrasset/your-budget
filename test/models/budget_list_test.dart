// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:your_budget/models/budget.dart';
import 'package:your_budget/models/budget_list.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

void main() {
  Queries mockQueries;
  int tMonth;
  int tYear;
  int tMainCatId;
  MainCategory tMainCategory;
  SubCategory tSubCategory;
  Budget tBudget;
  BudgetList budgetList;

  setUp(() async {
    mockQueries = MockQueries();
    tMonth = 1;
    tYear = 2021;
    tMainCatId = 5;
    tMainCategory = MainCategory(id: tMainCatId, name: "Test maincategory");
    tSubCategory = SubCategory(
        id: 1,
        parentId: tMainCatId,
        name: "Test subcategory",
        budgeted: 100.0,
        available: 50.0);
    tBudget = Budget([tMainCategory], [tSubCategory], tMonth, tYear);
    budgetList = BudgetList(mockQueries, [tBudget]);
  });

  test('verify that constructor has the correct arguments', () {
    //!Arrange

    //!Act

    //!Assert
    expect(budgetList.queryContext, mockQueries);
    expect(budgetList.budgets, [tBudget]);
  });

  test('when add() is called, add a Budget', () {
    //!Arrange

    //!Act
    budgetList.add(tBudget);

    //!Assert
    expect(budgetList.budgets, [tBudget, tBudget]);
  });

  test('when getByDate() is called, return a Budget with the specified date',
      () {
    //!Arrange
    //!Act
    final Budget testBudget = budgetList.getByDate(DateTime(tYear, tMonth));

    //!Assert
    expect(testBudget, tBudget);
  });

  test(
      'when addMaincategory() is called, then add a maincategory to every budget',
      () {
    //!Arrange
    final Budget tOtherBudget = Budget([], [], tMonth, tYear);
    final Budget tOtherBudget2 = Budget([], [], tMonth, tYear);
    final BudgetList tOtherBudgetList =
        BudgetList(mockQueries, []); //No budgets

    tOtherBudgetList.add(tOtherBudget);
    tOtherBudgetList.add(tOtherBudget2);

    //!Act
    tOtherBudgetList.addMaincategory(tMainCategory);

    //!Assert
    for (final Budget budget in tOtherBudgetList.budgets) {
      expect(budget.maincategories, [tMainCategory]);
    }
  });

  test(
      'when addSubcategory() is called, then add a subcategory to every budget',
      () {
    //!Arrange
    final Budget tOtherBudget = Budget([tMainCategory], [], tMonth, tYear);
    final Budget tOtherBudget2 = Budget([tMainCategory], [], tMonth, tYear);
    final BudgetList tOtherBudgetList =
        BudgetList(mockQueries, []); //No budgets

    tOtherBudgetList.add(tOtherBudget);
    tOtherBudgetList.add(tOtherBudget2);

    //!Act
    tOtherBudgetList.addSubcategory(tSubCategory);

    //!Assert
    for (final Budget budget in tOtherBudgetList.budgets) {
      bool result = budget.subcategories[0].hasSameValues(tSubCategory);
      expect(result, true);
    }
  });

  test(
      'when updateSubcategory() is called, then update the corresponding subcategory' +
          ' in every budget', () {
    //!Arrange
    final SubCategory tOtherSubcategory =
        tSubCategory.copyWith(name: "Name change");
    //!Act
    budgetList.updateSubcategory(tOtherSubcategory);

    //!Assert
    for (final Budget budget in budgetList.budgets) {
      final SubCategory subcat = budget.subcategories
          .singleWhere((subcat) => subcat.id == tOtherSubcategory.id);
      final bool result = subcat.hasSameValues(tOtherSubcategory);
      expect(result, true);
    }
  });

  test(
      'verify that updateSubcategoryName() updates the name of the subcategory' +
          ' in every budget ', () {
    //!Arrange
    const String tNewName = "Name change";
    final Budget tOtherBudget = Budget([], [tSubCategory], tMonth, tYear);

    budgetList.add(tOtherBudget);

    //!Act
    budgetList.updateSubcategoryName(id: tSubCategory.id, newName: tNewName);

    //!Assert
    for (final Budget budget in budgetList.budgets) {
      final SubCategory subcat = budget.subcategories
          .singleWhere((subcat) => subcat.id == tSubCategory.id);
      expect(subcat.name, tNewName);
    }
  });

  test(
      'when updateMaincategory() is called, then update the corresponding maincategory' +
          ' in every budget', () {
    //!Arrange
    final MainCategory tOtherMainCategory =
        tMainCategory.copyWith(name: "Name change");
    //!Act
    budgetList.updateMaincategory(tOtherMainCategory);

    //!Assert
    for (final Budget budget in budgetList.budgets) {
      final MainCategory maincat = budget.maincategories
          .singleWhere((maincat) => maincat.id == tOtherMainCategory.id);
      expect(maincat.name, tOtherMainCategory.name);
      expect(maincat.id, tOtherMainCategory.id);
    }
  });

  test(
      'when computeAvgBugdetedPerSubcategory() is called, compute the average' +
          ' amount budgeted per subcategory', () {
    //!Arrange
    final Budget tOtherBudget = Budget([], [tSubCategory], tMonth + 1, tYear);
    final Budget tOtherBudget2 = Budget([], [tSubCategory], tMonth + 2, tYear);

    budgetList.add(tOtherBudget);
    budgetList.add(tOtherBudget2);

    const double tAverage = 100.0;

    //!Act
    final double average =
        budgetList.computeAvgBugdetedPerSubcategory(tSubCategory.id);
    //!Assert
    expect(average, tAverage);
  });

  test(
      'when computeAvgBugdetedPerSubcategory() is called, verify that it does' +
          'budgets where the given subcategory was not budgeted (==0.00)', () {
    //!Arrange
    //Seting budgeted amount to 0
    final SubCategory tOtherSubcat = tSubCategory.copyWith(budgeted: 0.00);
    final Budget tOtherBudget = Budget([], [tOtherSubcat], tMonth + 1, tYear);
    final Budget tOtherBudget2 = Budget([], [tOtherSubcat], tMonth + 2, tYear);

    budgetList.add(tOtherBudget);
    budgetList.add(tOtherBudget2);

    const double tAverage = 100.0;
    //!Act
    final double average =
        budgetList.computeAvgBugdetedPerSubcategory(tSubCategory.id);
    //!Assert
    expect(average, tAverage);
  });

  test('verify that removeSubcategory() removes the specified subcategory ',
      () {
    //!Arrange
    //Check not empty
    for (final Budget budget in budgetList.budgets) {
      expect(budget.subcategories.isNotEmpty, true);
    }

    //!Act

    budgetList.removeSubcategory(tSubCategory.id, tSubCategory.parentId);
    //!Assert
    //Check empty

    for (final Budget budget in budgetList.budgets) {
      expect(budget.subcategories.isEmpty, true);
    }
  });

  test(
      'verify that removeMaincategory() removes the specified maincategory ' +
          'in every budget', () {
    //!Arrange
    //Check not empty
    for (final Budget budget in budgetList.budgets) {
      expect(budget.maincategories.isNotEmpty, true);
    }

    //!Act

    budgetList.removeMaincategory(tMainCatId);
    //!Assert
    //Check empty

    for (final Budget budget in budgetList.budgets) {
      expect(budget.maincategories.isEmpty, true);
    }
  });
}
