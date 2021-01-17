import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/queries.dart';
import 'fake_database.dart';

class MockQueries extends Mock implements Queries {}

main() {
  MockQueries mockQueries;
  AppState appState;
  FakeDatabase fakeDatabase;

  setUp(() async {
    mockQueries = MockQueries();
    fakeDatabase = FakeDatabase(mockQueries: mockQueries);
    await fakeDatabase.setup();
    appState = AppState(queryContext: mockQueries);
    await appState.loadStateFromDatabase();
  });

  test(
      'when loadStateFromDatabase() then load all necessary stuff from the' +
          'the database to the state', () async {
    //!Arrange
    // Clear the interactions of call of loadStateFromDatabase()
    // in the setUp() method
    clearInteractions(mockQueries);

    //!Act
    await appState.loadStateFromDatabase();

    //!Assert
    verify(mockQueries.getStartingBudgetDateConstant()).called(1);
    verify(mockQueries.getMoneyTransactions()).called(1);

    // In _createAllMonthlyBudgets()
    verify(mockQueries.getCategories()).called(1);
    // Called 2 - 3 times: in _createAllMonthlyBudgets, in _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate,
    // and optionally in _incrementMaxBudgetAndUpdateBudgets
    verify(mockQueries.getMaxBudgetDateConstant()).called(greaterThan(1));

    verify(mockQueries.getPayees()).called(1);
    verify(mockQueries.getAccounts()).called(1);
    verify(mockQueries.getBudgetValues()).called(1);
    verify(mockQueries.getGoals()).called(1);

    //In getMostRecentAccountUsed()
    verify(mockQueries.getMostRecentAccountUsed()).called(1);
  });

  test(
      'when addAccount() is called then add account and moneyTranasction to the state and database' +
          'and call computeToBeBudgeted() once after.', () async {
    //!Arrange
    String accountName = "Savings";
    double balance = 999.99;
    int accountId = 1;
    int moneyTransactionId = 1;
    Account tAccount = Account(accountId, accountName, balance);
    MoneyTransaction tMoneyTransaction = MoneyTransaction(
        id: moneyTransactionId,
        accountID: accountId,
        amount: balance,
        date: DateTime.now(),
        memo: "",
        payeeID: Constants.UNASSIGNED_PAYEE_ID,
        subcatID: Constants.UNASSIGNED_SUBCAT_ID);

    when(mockQueries.getFirstTransactionOfAccount(accountId))
        .thenAnswer((_) async => tMoneyTransaction);
    when(mockQueries.addAccount(argThat(isA<AccountModel>())))
        .thenAnswer((_) async => accountId);
    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => moneyTransactionId);

    //!Act
    await appState.addAccount(accountName: accountName, balance: balance);

    //!Assert
    verify(mockQueries.addAccount(argThat(isA<AccountModel>())));
    verify(
        mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())));

    // Verify that we call computeToBeBudgeted() once (we only added a single account)
    verify(mockQueries.getFirstTransactionOfAccount(argThat(isA<int>())))
        .called(1);

    // Compare accounts
    bool accountResult = tAccount.hasSameValues(appState.accounts[0]);
    expect(accountResult, true);

    // Compare transactions (without data comparison)
    expect(appState.transactions[0].id, tMoneyTransaction.id);
    expect(appState.transactions[0].subcatID, tMoneyTransaction.subcatID);
    expect(appState.transactions[0].payeeID, tMoneyTransaction.payeeID);
    expect(appState.transactions[0].accountID, tMoneyTransaction.accountID);
    expect(appState.transactions[0].amount, tMoneyTransaction.amount);
  });

  test(
      'when addCategory() is called, add category to the database and to each budget',
      () {
    //!Arrange
    String tCategoryName = "Essentials";
    int tCategoryId = 1;
    MainCategory tCategory = MainCategory(id: tCategoryId, name: tCategoryName);

    when(mockQueries.addCategory(argThat(isA<MainCategoryModel>())))
        .thenAnswer((_) async => tCategoryId);

    //!Act
    appState.addCategory(categoryName: tCategoryName);

    //!Assert
    verify(mockQueries.addCategory(argThat(isA<MainCategoryModel>())));
    for (final Budget budget in appState.budgets) {
      MainCategory cat =
          budget.maincategories.singleWhere((cat) => cat.id == tCategoryId);
      bool result = cat.hasSameValues(tCategory);
      expect(result, true);
    }
  });

  test(
      'when addPayee() is called then add a payee to the state and the database',
      () async {
    //!Arrange
    String tPayeeName = "Savings";
    int tPayeeId = 1;
    Payee tPayee = Payee(id: tPayeeId, name: tPayeeName);

    when(mockQueries.addPayee(argThat(isA<PayeeModel>())))
        .thenAnswer((_) async => tPayeeId);

    //!Act
    await appState.addPayee(payeeName: tPayeeName);

    //!Assert
    verify(mockQueries.addPayee(argThat(isA<PayeeModel>())));

    Payee payee = appState.payees.singleWhere((payee) => payee.id == tPayeeId);
    bool result = tPayee.hasSameValues(payee);

    expect(result, true);
  });

  test(
      'when addSubcategory() is called, then add a subcategory to the state, the database' +
          'to the budget', () async {
    //!Arrange
    String tSubcategoryName = "Groceries";
    int tSubcategoryId = 99;
    int tMaincategoryId = 1;
    SubCategory tSubcategory = SubCategory(
        id: tSubcategoryId,
        parentId: tMaincategoryId,
        name: tSubcategoryName,
        budgeted: 0.00,
        available: 0.00);

    when(mockQueries.addSubcategory(argThat(isA<SubCategoryModel>())))
        .thenAnswer((_) async => tSubcategoryId);

    //!Act
    await appState.addSubcategory(
        subcategoryName: tSubcategoryName, maincategoryId: tMaincategoryId);

    //!Assert
    verify(mockQueries.addSubcategory(argThat(isA<SubCategoryModel>())));

    // Verify that the subcategory was added to every budget
    for (final Budget budget in appState.budgets) {
      SubCategory subcat = budget.subcategories
          .singleWhere((subcat) => subcat.id == tSubcategoryId);
      bool result = subcat.hasSameValues(tSubcategory);
      expect(result, true);
    }
  });

}
