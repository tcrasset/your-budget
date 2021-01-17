import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jiffy/jiffy.dart';
import 'package:mockito/mockito.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/utils.dart';
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
    Account tAccount =
        Account(id: accountId, name: accountName, balance: balance);
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
    verify(mockQueries.getFirstTransactionOfAccount(argThat(isA<int>())));
    // Compare accounts
    Account account =
        appState.accounts.singleWhere((acc) => acc.id == accountId);
    bool accountResult = tAccount.hasSameValues(account);
    expect(accountResult, true);

    // Compare transactions (without data comparison)
    MoneyTransaction transaction = appState.transactions
        .singleWhere((transaction) => transaction.id == tMoneyTransaction.id);

    expect(transaction.id, tMoneyTransaction.id);
    expect(transaction.subcatID, tMoneyTransaction.subcatID);
    expect(transaction.payeeID, tMoneyTransaction.payeeID);
    expect(transaction.accountID, tMoneyTransaction.accountID);
    expect(transaction.amount, tMoneyTransaction.amount);
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

  test(
      'when addSubcategory() is called, add BudgetValues to the state and' +
          ' the database, from the date the budget was started up until' +
          ' the maximal budget date', () async {
    //!Arrange
    String tSubcategoryName = "Groceries";
    int tMaincategoryId = 1;
    int tSubcategoryId = 99;
    int tBudgetId = 1001;

    when(mockQueries.addSubcategory(argThat(isA<SubCategoryModel>())))
        .thenAnswer((_) async => tSubcategoryId);

    when(mockQueries.addBudgetValue(argThat(isA<BudgetValueModel>())))
        .thenAnswer((_) async => tBudgetId);

    //! Act
    await appState.addSubcategory(
        subcategoryName: tSubcategoryName, maincategoryId: tMaincategoryId);

    //! Assert
    List<BudgetValue> budgetValues =
        appState.budgetValues.where((bv) => bv.id == tBudgetId).toList();
    DateTime newDate = await mockQueries.getStartingBudgetDateConstant();
    DateTime maxBudgetDate = getMaxBudgetDate();
    DateTime previousDate;
    int nbCalls = 0;
    // Loop over all dates between startingBudgetDate and maxBudgetDate
    // and verify that there is one and only one transaction on that date.
    do {
      previousDate = newDate;
      BudgetValue tBudgetValue = BudgetValue(
          id: tBudgetId,
          subcategoryId: tSubcategoryId,
          budgeted: 0.0,
          available: 0.0,
          year: previousDate.year,
          month: previousDate.month);
      BudgetValue budgetValue = budgetValues.singleWhere(
          (bv) => isSameMonth(DateTime(bv.year, bv.month), previousDate),
          orElse: () => null);
      bool result = tBudgetValue.hasSameValues(budgetValue);
      expect(result, true);
      newDate = Jiffy(previousDate).add(months: 1);
      nbCalls++;
    } while (previousDate.isBefore(maxBudgetDate));

    verify(mockQueries.addBudgetValue(argThat(isA<BudgetValueModel>())))
        .called(nbCalls);

    // Check that there are no transactions after that date
    previousDate = Jiffy(previousDate).add(months: 1);
    BudgetValue budgetValue = budgetValues.singleWhere(
        (bv) => isSameMonth(DateTime(bv.year, bv.month), previousDate),
        orElse: () => null);
    expect(budgetValue, null);
  });

  test(
      'when addTransaction() is called, add a MoneyTransaction to the state and to' +
          'the database, and update most recent account used', () async {
    //!Arrange
    int tTransactionId = 111;
    int tSubcatId = FakeDatabase.TEST_SUBCATEGORY_ID;
    int tPayeeId = 88;
    int tAccountId = FakeDatabase.TEST_ACCOUNT_ID_1;
    double tAmount = 1000.00;
    String tMemo = "Test Passed";

    MoneyTransaction tMoneyTransaction = MoneyTransaction(
      id: tTransactionId,
      payeeID: tPayeeId,
      accountID: tAccountId,
      subcatID: tSubcatId,
      amount: tAmount,
      date: DateTime.now(),
      memo: tMemo,
    );

    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => tTransactionId);

    //!Act
    await appState.addTransaction(
        subcatId: tSubcatId,
        accountId: tAccountId,
        payeeId: tPayeeId,
        amount: tAmount,
        date: DateTime.now(),
        memo: tMemo);

    //!Assert
    verify(
        mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())));
    verify(mockQueries.updateMostRecentAccountUsed(tAccountId));

    MoneyTransaction transaction =
        appState.transactions.singleWhere((tr) => tr.id == tTransactionId);

    // Compare transactions (without data comparison)
    expect(transaction.id, tMoneyTransaction.id);
    expect(transaction.subcatID, tMoneyTransaction.subcatID);
    expect(transaction.payeeID, tMoneyTransaction.payeeID);
    expect(transaction.accountID, tMoneyTransaction.accountID);
    expect(transaction.amount, tMoneyTransaction.amount);
  });

  test(
      'when addTransaction() is called with a transaction into "To Be Budgeted",' +
          'then update the corresponding account balance, the budgets and To Be Budgeted total',
      () async {
    //!Arrange

    clearInteractions(mockQueries);

    final int tTransactionId = 111;
    final int tSubcatId = Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION;
    final int tPayeeId = 88;
    final int tAccountId = FakeDatabase.TEST_ACCOUNT_ID_1;
    final double tAmount = 1000.00;
    final String tMemo = "Test Passed";
    final DateTime tDate = DateTime.now();
    final MoneyTransaction tMoneyTransaction = MoneyTransaction(
      id: tTransactionId,
      payeeID: tPayeeId,
      accountID: tAccountId,
      subcatID: tSubcatId,
      amount: tAmount,
      date: tDate,
      memo: tMemo,
    );

    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => tTransactionId);

    final double previousToBeBudgeted = appState.toBeBudgeted;
    final Account account =
        appState.accounts.singleWhere((account) => account.id == tAccountId);
    final double previousAccountBalance = account.balance;

    /// Saving the [toBeBudgetedInputFromMoneyTransactions] of every
    /// [budget] before adding the transaction
    HashMap<DateTime, double> inputFromMoneyTranasctionsBefore =
        HashMap<DateTime, double>();
    for (final budget in appState.budgets) {
      DateTime budgetDate = DateTime(budget.year, budget.month);
      inputFromMoneyTranasctionsBefore[budgetDate] =
          budget.toBeBudgetedInputFromMoneyTransactions;
    }

    //!Act
    await appState.addTransaction(
        subcatId: tSubcatId,
        accountId: tAccountId,
        payeeId: tPayeeId,
        amount: tAmount,
        date: DateTime.now(),
        memo: tMemo);

    //!Assert
    // Verify that the account was updated
    final double afterAccountBalance = account.balance;
    final double accountBalanceDifference =
        afterAccountBalance - previousAccountBalance;
    expect(accountBalanceDifference, tAmount);
    verify(mockQueries.updateAccount(account));

    // Verify that the budgets were updated
    for (final budget in appState.budgets) {
      DateTime budgetDate = DateTime(budget.year, budget.month);
      debugPrint(budgetDate.toString());
      debugPrint(budget.toBeBudgetedInputFromMoneyTransactions.toString());
      if (isSameMonth(budgetDate, tDate))
        expect(budget.toBeBudgetedInputFromMoneyTransactions,
            inputFromMoneyTranasctionsBefore[budgetDate] + tAmount);
      else
        expect(inputFromMoneyTranasctionsBefore[budgetDate],
            budget.toBeBudgetedInputFromMoneyTransactions);
    }
    // Verify that computeToBeBudgeted() was called and toBeBudgeted updated
    verify(mockQueries.getFirstTransactionOfAccount(tAccountId)).called(1);
    expect(appState.toBeBudgeted, previousToBeBudgeted + tAmount);
  });
}
