import 'dart:collection';

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

    clearInteractions(mockQueries);
  });

  test(
      'when loadStateFromDatabase() then load all necessary stuff from the' +
          'the database to the state', () async {
    //!Arrange

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
      expect(cat.id, tCategory.id);
      expect(cat.name, tCategory.name);
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

    final int tTransactionId = 111;
    final int tSubcatId = Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION;
    final int tPayeeId = 88;
    final int tAccountId = FakeDatabase.TEST_ACCOUNT_ID_1;
    final double tAmount = 1000.00;
    final String tMemo = "Test Passed";
    final DateTime tDate = DateTime.now();

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

  test(
      'when addTransaction() is called with a transaction between accounts' +
          ', then update both accounts', () async {
    final int tTransactionId = 111;
    final int tSubcatId = Constants.UNASSIGNED_SUBCAT_ID;
    final int tPayeeId =
        -FakeDatabase.TEST_ACCOUNT_ID_2; //Negative account id as payee id
    final int tAccountId = FakeDatabase.TEST_ACCOUNT_ID_1;
    final double tAmount = 1000.00;
    final String tMemo = "Test Passed";
    final DateTime tDate = DateTime.now();

    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => tTransactionId);

    // Get previous account balances
    final Account outAccount =
        appState.accounts.singleWhere((account) => account.id == tAccountId);
    final Account inAccount =
        appState.accounts.singleWhere((account) => account.id == -tPayeeId);
    final double outAccountPreviousBalance = outAccount.balance;
    final double inAccountPreviousBalance = inAccount.balance;

    //!Act
    await appState.addTransaction(
        subcatId: tSubcatId,
        accountId: tAccountId,
        payeeId: tPayeeId,
        amount: tAmount,
        date: tDate,
        memo: tMemo);

    //!Assert
    // Verify that accounts get updated
    expect(outAccount.balance, outAccountPreviousBalance - tAmount);
    expect(inAccount.balance, inAccountPreviousBalance + tAmount);
    verify(mockQueries.updateAccount(outAccount));
    verify(mockQueries.updateAccount(inAccount));
  });

  test(
      'when addTransaction() is called with a standard transaction, update' +
          'the account, the budget and', () async {
    //!Arrange

    final int tTransactionId = 111;
    final int tSubcatId = FakeDatabase.TEST_SUBCATEGORY_ID;
    final int tPayeeId = 88;
    final int tAccountId = FakeDatabase.TEST_ACCOUNT_ID_1;
    final double tAmount = 1000.00;
    final String tMemo = "Test Passed";
    final DateTime tDate = DateTime.now();

    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => tTransactionId);

    final Account account =
        appState.accounts.singleWhere((account) => account.id == tAccountId);
    final double previousAccountBalance = account.balance;

    //!Act
    await appState.addTransaction(
        subcatId: tSubcatId,
        accountId: tAccountId,
        payeeId: tPayeeId,
        amount: tAmount,
        date: tDate,
        memo: tMemo);

    //!Assert
    verify(mockQueries.updateAccount(account));
    expect(account.balance, previousAccountBalance + tAmount);

    // Verify that it updates the budget values of every month after
    int nbMonths = getMonthDifference(tDate, getMaxBudgetDate()).abs();
    verify(mockQueries.updateBudgetValue(any)).called(nbMonths + 1);
  });

  test(
      'when removeSubcategory() is called, remove subcategory as well as the budgetvalues' +
          ' from the budgets and the database', () async {
    //!Arrange
    int subcatIdToRemove = FakeDatabase.TEST_SUBCATEGORY_ID;

    int nbBudgetValuesToRemove = appState.budgetValues
        .where((bv) => bv.subcategoryId == subcatIdToRemove)
        .toList()
        .length;

    //!Act
    appState.removeSubcategory(subcatIdToRemove);

    //!Assert
    // Verify that the subcategory was removed from every budget
    for (final budget in appState.budgets) {
      final SubCategory subcat = budget.subcategories.singleWhere(
          (subcat) => subcat.id == subcatIdToRemove,
          orElse: () => null);
      expect(subcat, null);
    }
    verify(mockQueries.deleteSubcategory(subcatIdToRemove));

    //Verify that the budgetvalues have been removed from the state
    for (final budgetvalue in appState.budgetValues) {
      bool hasSameId = budgetvalue.subcategoryId == subcatIdToRemove;
      expect(hasSameId, false);
    }
    verify(mockQueries.deleteBudgetValue(any)).called(nbBudgetValuesToRemove);
  });

  test(
      'when calling updateCategoryName(), then update the name in the database' +
          ' and in the budgets', () {
    //!Arrange
    int catId = FakeDatabase.TEST_CATEGORY_ID;
    //Original is MainCategory(id: 1, name: "Essentials")
    MainCategory tCat = MainCategory(id: catId, name: "Necessities");

    //!Act
    appState.updateCategoryName(tCat);

    //!Assert
    for (final budget in appState.budgets) {
      MainCategory cat =
          budget.maincategories.singleWhere((cat) => cat.id == catId);
      expect(cat.name, tCat.name);
    }

    verify(mockQueries.updateCategory(tCat));
  });

  test(
      'when incrementMonth() is called, change the current budget date,' +
          ', current budget and update to be budgeted', () {
    //!Arrange
    int tYear = 2021;
    int tMonth = 6;
    DateTime juneDate = DateTime(tYear, tMonth);
    DateTime julyDate = DateTime(tYear, tMonth + 1);
    Budget julyBudget = appState.budgets.singleWhere(
      (budget) => budget.year == tYear && budget.month == tMonth + 1,
    );

    appState.currentBudgetDate = juneDate;
    //!Act
    appState.incrementMonth();

    //!Assert
    expect(appState.currentBudget, julyBudget);
    expect(appState.currentBudgetDate, julyDate);
    verify(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when incrementMonth() is called, and we are already at maxBudgetDate,' +
          ' do not increment ', () {
    //!Arrange
    DateTime maxBudgetDate = getMaxBudgetDate();

    appState.currentBudgetDate = maxBudgetDate;
    //!Act
    appState.incrementMonth();

    //!Assert
    expect(appState.currentBudgetDate, maxBudgetDate);
    verifyNever(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when decrementMonth() is called, decrement the current budget date' +
          ', the budget and call computeToBeBudgeted()', () {
    //!Arrange
    int tYear = 2021;
    int tMonth = 6;
    DateTime juneDate = DateTime(tYear, tMonth);
    DateTime mayDate = DateTime(tYear, tMonth - 1);
    Budget mayBudget = appState.budgets.singleWhere(
      (budget) => budget.year == tYear && budget.month == tMonth - 1,
    );

    appState.currentBudgetDate = juneDate;
    //!Act
    appState.decrementMonth();

    //!Assert
    expect(appState.currentBudget, mayBudget);
    expect(appState.currentBudgetDate, mayDate);
    verify(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when decrementMonth() is called, and we are already at startingBudgetDate' +
          ', dont decrement', () async {
    //!Arrange
    DateTime startingBudgetDate =
        await mockQueries.getStartingBudgetDateConstant();
    appState.currentBudgetDate = startingBudgetDate;

    //!Act
    appState.decrementMonth();

    //!Assert
    expect(appState.currentBudgetDate, startingBudgetDate);
    verifyNever(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when removeCategory() is called, remove a category and its SubCategories from ' +
          'the database and from the state, and call computeToBeBudgeted()',
      () {
    //!Arrange
    int catIdToBeRemoved = FakeDatabase.TEST_CATEGORY_ID;
    List subcategoriesToBeDeleted = appState.subcategories
        .where((subcat) => subcat.parentId == catIdToBeRemoved)
        .toList();

    //!Act
    appState.removeCategory(catIdToBeRemoved);

    //!Assert
    //Verify that the category got removed
    for (final budget in appState.budgets) {
      MainCategory cat = budget.maincategories
          .singleWhere((cat) => cat.id == catIdToBeRemoved, orElse: () => null);
      expect(cat, null);
    }
    verify(mockQueries.deleteCategory(catIdToBeRemoved));

    //Verify that the subcategories got removed
    for (final SubCategory subcat in subcategoriesToBeDeleted)
      verify(mockQueries.deleteSubcategory(subcat.id));

    //Verify that computeToBeBudgeted got called
    verify(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when setMostRecentAccountUsed() is called, change th account used in' +
          ' the state and in the database', () {
    //!Arrange
    Account tAccount_1 = fakeDatabase.accounts[0];
    Account tAccount_2 = fakeDatabase.accounts[1];

    //Before changing
    expect(appState.mostRecentAccount, tAccount_1);
    // expect(appState.mostRecentAccount, tAccount_2);
    //!Act
    appState.setMostRecentAccountUsed(tAccount_2.id);
    //!Assert
    expect(appState.mostRecentAccount, tAccount_2);
    verify(mockQueries.updateMostRecentAccountUsed(tAccount_2.id));
  });

  test(
      'when getMostRecentAccountUsed() is called, then return the most recently' +
          ' used account.', () async {
    Account tAccount = fakeDatabase.accounts[0];

    //!Arrange
    appState.setMostRecentAccountUsed(tAccount.id);

    //!Act
    Account account = await appState.getMostRecentAccountUsed();

    //!Assert
    expect(account, tAccount);
    verify(mockQueries.getMostRecentAccountUsed());
  });

  test(
      'when udpateSubcategory() is called with a name change, update the subcategory in the database' +
          'and in the budget', () {
    //!Arrange
    String tName = "Name got changed";
    SubCategory tSubcat = fakeDatabase.subCategories[0];

    //!Act
    tSubcat.name = tName;
    appState.updateSubcategory(tSubcat, DateTime.now());

    //!Assert
    verify(mockQueries.updateSubcategory(tSubcat));

    for (final Budget budget in appState.budgets) {
      final SubCategory subcat =
          budget.subcategories.singleWhere((subcat) => subcat.id == tSubcat.id);
      expect(subcat.name, tName);
    }

    //Verify that for a name change, we don't modify BudgetValues
    verifyNever(mockQueries.updateBudgetValue(any));
  });

  test(
      'when updateSubcategory() is called with another change, update the subcategory and the' +
          ' budgetvalue (available + budgeted) of the current budget', () {
    //!Arrange
    double tBudgeted = 987.65;
    double tAvailable = 432.10;
    SubCategory tSubcat = fakeDatabase.subCategories[0];

    //!Act
    tSubcat.budgeted = tBudgeted;
    tSubcat.available = tAvailable;
    appState.updateSubcategory(tSubcat, DateTime.now());

    //!Assert

    // Verify that we updated the current budget
    final SubCategory subcat = appState.currentBudget.subcategories
        .singleWhere((subcat) => subcat.id == tSubcat.id);
    expect(subcat.budgeted, tBudgeted);
    expect(subcat.available, tAvailable);

    // Verify that we update the budget and available amount of the budgetvalue
    // for that subcategory for the month it belongs to
    BudgetValue correspondingBudgetValue = appState.budgetValues.singleWhere(
      (budgetValue) =>
          (budgetValue.subcategoryId == tSubcat.id) &&
          (budgetValue.year == appState.currentBudgetDate.year) &&
          (budgetValue.month == appState.currentBudgetDate.month),
    );
    verify(mockQueries.updateBudgetValue(correspondingBudgetValue));
  });

  test(
      'when updateSubcategory() is called with another change, update the subcategory and the' +
          ' budgetvalue (available only) of all the sucessing budgets', () {
    //!Arrange
    double tBudgeted = 987.65;
    SubCategory tSubcat = fakeDatabase.subCategories[0];
    DateTime tDate = DateTime.now();

    //!Act
    tSubcat.budgeted = tBudgeted;
    appState.updateSubcategory(tSubcat, tDate);

    //!Assert

    DateTime maxBudgetDate = getMaxBudgetDate();
    DateTime date = Jiffy(tDate).add(months: 1);
    double lastMonthAvailable = tSubcat.available;

    while (date.isBefore(maxBudgetDate)) {
      // Verify that the available value in each BudgetValue was updated correctly
      BudgetValue correspondingBudgetValue = appState.budgetValues.singleWhere(
        (budgetValue) =>
            (budgetValue.subcategoryId == tSubcat.id) &&
            (budgetValue.year == date.year) &&
            (budgetValue.month == date.month),
      );
      expect(correspondingBudgetValue.available,
          lastMonthAvailable + correspondingBudgetValue.budgeted);
      lastMonthAvailable = correspondingBudgetValue.available;

      verify(mockQueries.updateBudgetValue(correspondingBudgetValue));

      // Verify that we modify the subcategory in each budget
      Budget budget = appState.budgets.singleWhere((budget) =>
          (budget.year == date.year) && (budget.month == date.month));
      SubCategory subcat =
          budget.subcategories.singleWhere((subcat) => subcat.id == tSubcat.id);
      expect(subcat.available, correspondingBudgetValue.available);

      date = Jiffy(date).add(months: 1);
    }

    //Verify that we call computeToBeBudgeted() after
    verify(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when deleteTransaction() is called, delete the transaction from the' +
          ' state and from the database', () {
    //!Arrange
    MoneyTransaction tTransaction = fakeDatabase.moneyTransactions[0];

    //!Act
    appState.deleteTransaction(tTransaction.id);

    //!Assert

    verify(mockQueries.deleteTransaction(tTransaction.id));
    MoneyTransaction shouldBeNullTransaction = appState.transactions
        .singleWhere((tr) => tr.id == tTransaction.id, orElse: () => null);
    expect(shouldBeNullTransaction, null);
  });

  test(
      'when deleteTransaction() is called on a transaction into to be budgeted,' +
          ' then update the account and the budgets', () async {
    //!Arrange
    MoneyTransaction tTransaction = MoneyTransaction(
      id: 875,
      accountID: FakeDatabase.TEST_ACCOUNT_ID_1,
      payeeID: FakeDatabase.TEST_PAYEE_ID,
      subcatID: Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION,
      amount: 875.42,
      date: DateTime.now(),
      memo: "",
    );

    Account account = appState.accounts
        .singleWhere((acc) => acc.id == tTransaction.accountID);
    Budget budget = appState.budgets
        .singleWhere((budget) => isSameMonth(budget.date, tTransaction.date));

    double previousBudgetToBeBudgeted =
        budget.toBeBudgetedInputFromMoneyTransactions;
    double previousAccountBalance = account.balance;

    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => tTransaction.id);

    //!Act
    await appState.addTransaction(
        subcatId: tTransaction.subcatID,
        accountId: tTransaction.accountID,
        payeeId: tTransaction.payeeID,
        amount: tTransaction.amount,
        date: tTransaction.date,
        memo: tTransaction.memo);

    clearInteractions(mockQueries);

    await appState.deleteTransaction(tTransaction.id);

    //!Assert
    //Verify that the balance was the same as before (add and remove)
    expect(account.balance.toStringAsFixed(2),
        previousAccountBalance.toStringAsFixed(2));
    verify(mockQueries.updateAccount(account));

    //Verify that the to be budgeted field in bduget is the same (add and remove)
    expect(budget.toBeBudgetedInputFromMoneyTransactions,
        previousBudgetToBeBudgeted);

    verify(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when deleteTransaction() is called with a transaction between accounts,' +
          ' update both accounts', () async {
    //!Arrange
    MoneyTransaction tTransaction = MoneyTransaction(
      id: 875,
      accountID: FakeDatabase.TEST_ACCOUNT_ID_1,
      payeeID:
          -FakeDatabase.TEST_ACCOUNT_ID_2, //Negative account id as payee id
      subcatID: Constants.UNASSIGNED_SUBCAT_ID,
      amount: 875.42,
      date: DateTime.now(),
      memo: "",
    );

    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => tTransaction.id);

    // Get previous account balances
    final Account outAccount = appState.accounts
        .singleWhere((account) => account.id == tTransaction.accountID);
    final Account inAccount = appState.accounts
        .singleWhere((account) => account.id == -tTransaction.payeeID);

    final double outAccountPreviousBalance = outAccount.balance;
    final double inAccountPreviousBalance = inAccount.balance;

    //!Act
    // Add and delete transaction
    await appState.addTransaction(
        subcatId: tTransaction.subcatID,
        accountId: tTransaction.accountID,
        payeeId: tTransaction.payeeID,
        amount: tTransaction.amount,
        date: tTransaction.date,
        memo: tTransaction.memo);

    clearInteractions(mockQueries);

    appState.deleteTransaction(tTransaction.id);
    //!Assert
    // Verify that accounts get updated (add and remove)
    expect(outAccount.balance.toStringAsFixed(2),
        outAccountPreviousBalance.toStringAsFixed(2));
    expect(inAccount.balance.toStringAsFixed(2),
        inAccountPreviousBalance.toStringAsFixed(2));
    verify(mockQueries.updateAccount(outAccount));
    verify(mockQueries.updateAccount(inAccount));
  });

  test(
      'when deleteTransaction() is called with a standard transaction, ' +
          'udpate the account, and the budgets', () async {
    //!Arrange
    DateTime tDate = DateTime.now();
    MoneyTransaction tTransaction = MoneyTransaction(
      id: 875,
      accountID: FakeDatabase.TEST_ACCOUNT_ID_1,
      payeeID: 88, //Negative account id as payee id
      subcatID: FakeDatabase.TEST_SUBCATEGORY_ID,
      amount: 875.42,
      date: tDate,
      memo: "",
    );

    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())))
        .thenAnswer((_) async => tTransaction.id);

    final Account account = appState.accounts
        .singleWhere((account) => account.id == tTransaction.accountID);
    final double previousAccountBalance = account.balance;

    //!Act
    // Add and delete transaction
    await appState.addTransaction(
        subcatId: tTransaction.subcatID,
        accountId: tTransaction.accountID,
        payeeId: tTransaction.payeeID,
        amount: tTransaction.amount,
        date: tTransaction.date,
        memo: tTransaction.memo);

    clearInteractions(mockQueries);

    appState.deleteTransaction(tTransaction.id);

    //!Assert
    verify(mockQueries.updateAccount(account));
    expect(account.balance.toStringAsFixed(2),
        previousAccountBalance.toStringAsFixed(2));

    // Verify that it updates the budget values of every month after
    int nbMonths = getMonthDifference(tDate, getMaxBudgetDate()).abs();
    verify(mockQueries.updateBudgetValue(any)).called(nbMonths + 1);

    //Verify that it calls computeToBeBudgeted
    verify(mockQueries.getFirstTransactionOfAccount(any));
  });

  test(
      'when computeToBeBudgeted() isaccount called, sum up the balance of every account' +
          'then remove the budgeted amounts and add the input money from transacctions',
      () async {
    //!Arrange
    DateTime tCurrentBudgetDate = DateTime(2021, 7);
    double tToBeBudgeted =
        _testComputeToBeBudgeted(fakeDatabase, appState, tCurrentBudgetDate);

    when(mockQueries
            .getFirstTransactionOfAccount(FakeDatabase.TEST_ACCOUNT_ID_1))
        .thenAnswer((_) async => fakeDatabase.moneyTransactions.singleWhere(
            (mt) => mt.accountID == FakeDatabase.TEST_ACCOUNT_ID_1));

    when(mockQueries
            .getFirstTransactionOfAccount(FakeDatabase.TEST_ACCOUNT_ID_2))
        .thenAnswer((_) async => fakeDatabase.moneyTransactions.singleWhere(
            (mt) => mt.accountID == FakeDatabase.TEST_ACCOUNT_ID_2));

    //!Act
    appState.currentBudgetDate = tCurrentBudgetDate;
    await appState.computeToBeBudgeted();

    //!Assert
    expect(appState.toBeBudgeted, tToBeBudgeted);
    verify(mockQueries
        .getFirstTransactionOfAccount(FakeDatabase.TEST_ACCOUNT_ID_1));
    verify(mockQueries
        .getFirstTransactionOfAccount(FakeDatabase.TEST_ACCOUNT_ID_2));
  });

  test('when computeAverageBudgeted() is called, compute the average budgeted',
      () {
    //!Arrange
    double tAverage =
        _testComputeAverageBudgeted(appState, FakeDatabase.TEST_SUBCATEGORY_ID);
    //!Act
    double average =
        appState.computeAverageBudgeted(FakeDatabase.TEST_SUBCATEGORY_ID);
    //!Assert
    expect(average, tAverage);
  });
}

double _testComputeAverageBudgeted(AppState appState, int subcatId) {
  double totalBudgeted = 0;
  int nbNonZero = 0;

  appState.budgets.forEach((budget) {
    SubCategory subcat =
        budget.subcategories.singleWhere((subcat) => subcat.id == subcatId);
    if (subcat.budgeted != 0.00) {
      nbNonZero++;
    }
    totalBudgeted += subcat.budgeted;
  });

  if (nbNonZero == 0)
    return 0.00;
  else
    return totalBudgeted / nbNonZero;
}

double _testComputeToBeBudgeted(
    FakeDatabase fakeDatabase, AppState appState, DateTime tCurrentBudgetDate) {
  // Sum up starting total for every account
  double tToBeBudgeted = 0;

  for (final MoneyTransaction mT in fakeDatabase.moneyTransactions) {
    tToBeBudgeted += mT.amount;
  }
  DateTime prevDate = fakeDatabase.startingBudgetDate;
  DateTime nextDate = fakeDatabase.startingBudgetDate;

  do {
    prevDate = nextDate;
    Budget budget = appState.budgets.singleWhere((budget) =>
        budget.year == prevDate.year && budget.month == prevDate.month);
    tToBeBudgeted -= budget.totalBudgeted;
    tToBeBudgeted += budget.toBeBudgetedInputFromMoneyTransactions;
    //Go to next month
    nextDate = Jiffy(nextDate).add(months: 1);
  } while (tCurrentBudgetDate.isAfter(prevDate));
  return tToBeBudgeted;
}
