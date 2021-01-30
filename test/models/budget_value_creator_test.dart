import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/subcategory_creator.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/budget_value_creator.dart';

class MockQueries extends Mock implements Queries {}

main() {
  Queries mockQueries;
  int tSubcategoryId;
  double tBudgeted;
  double tAvailable;
  int tMonth;
  int tYear;
  BudgetValueCreator creator;
  setUp(() async {
    mockQueries = MockQueries();
    tSubcategoryId = 20;
    tBudgeted = 99.99;
    tAvailable = 50.00;
    creator = BudgetValueCreator(
        queryContext: mockQueries,
        subcategoryId: tSubcategoryId,
        budgeted: tBudgeted,
        available: tAvailable,
        month: tMonth,
        year: tYear);
  });

  test('verify that constructor sets the parameters', () {
    //!Arrange
    //!Act

    //!Assert
    expect(creator.subcategoryId, tSubcategoryId);
    expect(creator.budgeted, tBudgeted);
    expect(creator.available, tAvailable);
    expect(creator.month, tMonth);
    expect(creator.year, tYear);
    expect(creator.queryContext, mockQueries);
  });

  test(
      'verify that create() creates a BudgetValue and makes a call to the database',
      () async {
    //!Arrange
    int tId = 25;

    when(mockQueries.addBudgetValue(argThat(isA<BudgetValueModel>())))
        .thenAnswer((_) async => tId);

    //!Act
    BudgetValue budgetValue = await creator.create();

    //!Assert
    verify(mockQueries.addBudgetValue(argThat(isA<BudgetValueModel>())));
    expect(budgetValue.subcategoryId, tSubcategoryId);
    expect(budgetValue.budgeted, tBudgeted);
    expect(budgetValue.available, tAvailable);
    expect(budgetValue.month, tMonth);
    expect(budgetValue.year, tYear);
    expect(budgetValue.id, tId);
  });
}
