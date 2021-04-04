// Package imports:
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

// Project imports:
import 'package:your_budget/models/budget_value_list.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

void main() {
  Queries mockQueries;
  BudgetValue tBudgetValue;
  BudgetValueList budgetValuesList;
  const int testId_1 = 25;
  const int tSubcatId = 10;
  const int tMonth = 1;
  const int tYear = 2021;
  setUp(() async {
    mockQueries = MockQueries();
    tBudgetValue = BudgetValue(
        id: testId_1,
        subcategoryId: tSubcatId,
        budgeted: 99.99,
        available: 88.88,
        month: tMonth,
        year: tYear);

    budgetValuesList = BudgetValueList(mockQueries, [tBudgetValue]);
  });

  test('when creating a BudgetValueList, ensure the budgetvalues are passed in',
      () {
    //!Arrange
    //!Act
    //!Assert
    expect(budgetValuesList.budgetvalues, [tBudgetValue]);
  });

  test('when add() is called, add a BudgetValue', () {
    //!Arrange
    //!Act
    budgetValuesList.add(tBudgetValue);
    //!Assert
    expect(budgetValuesList.budgetvalues, [tBudgetValue, tBudgetValue]);
  });

  test(
      'when removeBySubcatId() is called, remove all budgetvalues by subcategory id',
      () {
    //!Arrange
    final List<BudgetValue> toRemove = budgetValuesList.budgetvalues
        .where((bv) => bv.subcategoryId == tSubcatId)
        .toList();
    //!Act
    budgetValuesList.removeBySubcatId(tSubcatId);
    //!Assert
    toRemove.forEach((bv) => {verify(mockQueries.deleteBudgetValue(bv.id))});
    expect(budgetValuesList.budgetvalues.isEmpty, true);
  });

  test(
      'when getByBudget() is called, return the budgetvalue corresponding' +
          'to the subcategory at the current month and year', () {
    const int tYear = 2022;
    const int tMonth = 12;
    const int tSubcatId = 12;
    final DateTime tDate = DateTime(tYear, tMonth);
    final BudgetValue otherBudgetValue = tBudgetValue.copyWith(
      subcategoryId: tSubcatId,
      month: tMonth,
      year: tYear,
    );
    //!Arrange
    budgetValuesList.add(otherBudgetValue);
    //!Act
    final BudgetValue budgetvalues =
        budgetValuesList.getByBudget(tDate, tSubcatId);

    //!Assert
    expect(budgetvalues, otherBudgetValue);
  });

  test(
      'when getAllBySubcatId() is called, return a list of all the transactions' +
          'with the same subcategory id', () {
    //!Arrange
    const int tSubcatIdOther = 2;
    final BudgetValue otherBudgetValue = tBudgetValue.copyWith(
      subcategoryId: tSubcatIdOther,
    );
    budgetValuesList.add(otherBudgetValue);
    //!Act
    final List<BudgetValue> budgetvalues =
        budgetValuesList.getAllBySubcatId(tSubcatIdOther);

    //!Assert
    expect(budgetvalues, [otherBudgetValue]);
  });

  test(
      'verify that updateBudgetValue() update the available and budgeted fields',
      () {
    //!Arrange
    const double tBudgeted = 56.54;
    const double tAvailable = 87.21;
    final DateTime tDate = DateTime(tYear, tMonth);
    //!Act

    budgetValuesList.updateBudgetValue(
        subcatId: tSubcatId,
        date: tDate,
        newBudgeted: tBudgeted,
        newAvailable: tAvailable);

    //!Assert
    verify(mockQueries.updateBudgetValue(argThat(isA<BudgetValue>())));

    final BudgetValue budgetValue =
        budgetValuesList.getByBudget(tDate, tSubcatId);
    expect(budgetValue.budgeted, tBudgeted);
    expect(budgetValue.available, tAvailable);
  });
}
