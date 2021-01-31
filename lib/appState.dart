import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:your_budget/appState_repository.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/account_list.dart';
import 'package:your_budget/models/budget_list.dart';
import 'package:your_budget/models/payee.dart';
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/goal.dart';
import 'package:your_budget/models/goal_model.dart';
import 'package:your_budget/models/maincategory_creator.dart';
import 'package:your_budget/models/money_transaction_creator.dart';
import 'package:your_budget/models/money_transaction_list.dart';
import 'package:your_budget/models/payee_creator.dart';
import 'package:your_budget/models/subcategory_creator.dart';
import 'package:your_budget/models/utils.dart';
import 'package:your_budget/models/payee_list.dart';
import 'package:your_budget/models/account_creator.dart';
import 'package:your_budget/models/budget_value_creator.dart';
import 'package:your_budget/models/budget_value_list.dart';

import 'package:your_budget/models/queries.dart';
import 'models/categories.dart';

class AppState extends ChangeNotifier implements AppStateRepository {
  // List<SubCategory> _subcategories = [];
  List<Goal> _goals = [];
  final Queries queryContext;
  Account _mostRecentAccount;

  PayeeList payeeList;
  AccountList accountList;
  MoneyTransactionList transactionList;
  BudgetValueList budgetValueList;
  BudgetList budgetList;

  double toBeBudgeted = 0;

  DateTime startingBudgetDate;
  DateTime currentBudgetDate;

  Budget currentBudget;

  /// An unmodifiable view of the information in the data base.
  UnmodifiableListView<Category> get allCategories {
    if (currentBudget != null) {
      return UnmodifiableListView(currentBudget.allcategories);
    }
    return UnmodifiableListView([]);
  }

  UnmodifiableListView<SubCategory> get subcategories =>
      UnmodifiableListView(currentBudget.subcategories);
  UnmodifiableListView<Payee> get payees =>
      UnmodifiableListView(payeeList.payees);
  UnmodifiableListView<Account> get accounts =>
      UnmodifiableListView(accountList.accounts);
  UnmodifiableListView<MoneyTransaction> get transactions =>
      UnmodifiableListView(transactionList.transactions);
  UnmodifiableListView<Budget> get budgets =>
      UnmodifiableListView(budgetList.budgets);
  UnmodifiableListView<Goal> get goals => UnmodifiableListView(_goals);
  UnmodifiableListView<BudgetValue> get budgetValues =>
      UnmodifiableListView(budgetValueList.budgetvalues);
  Account get mostRecentAccount =>
      _mostRecentAccount ?? accountList.accounts[0];

  AppState({@required this.queryContext});

  Future<void> loadStateFromDatabase() async {
    startingBudgetDate = await queryContext.getStartingBudgetDateConstant();

    transactionList = MoneyTransactionList(
        queryContext, await queryContext.getMoneyTransactions());
    budgetList = BudgetList(queryContext, await createAllMonthlyBudgets());

    budgetValueList =
        BudgetValueList(queryContext, await queryContext.getBudgetValues());
    _goals = await queryContext.getGoals();

    currentBudgetDate = getDateFromMonthStart(DateTime.now());
    currentBudget = budgetList.getByDate(currentBudgetDate);

    payeeList = PayeeList(queryContext, await queryContext.getPayees());
    accountList = AccountList(queryContext, await queryContext.getAccounts());
    _mostRecentAccount = await getMostRecentAccountUsed();

    await computeToBeBudgeted();

    notifyListeners();
  }

  Future<void> addAccount(
      {@required String accountName, @required double balance}) async {
    AccountCreator creator = AccountCreator(
        queryContext: queryContext, balance: balance, name: accountName);
    accountList.add(await creator.create());
    transactionList.add(await creator.getStartingMoneyTransaction());

    await computeToBeBudgeted();
    notifyListeners();
  }

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  void addCategory({@required String categoryName}) async {
    MainCategory cat = await MainCategoryCreator(
            queryContext: queryContext, name: categoryName)
        .create();

    budgetList.addMaincategory(cat);
    notifyListeners();
  }

  Future<Payee> addPayee({@required String payeeName}) async {
    PayeeCreator creator =
        PayeeCreator(queryContext: queryContext, name: payeeName);
    Payee payee = await creator.create();
    payeeList.add(payee);
    notifyListeners();
    return payee;
  }

  /// Adds [subcategory] to the list [_subcategories],
  /// to the data base and update the list  [_allCategories] by
  /// extracting the subcategories of each [MainCategory] from
  /// scratch
  Future<void> addSubcategory(
      {@required String subcategoryName, @required int maincategoryId}) async {
    DateTime newDate = startingBudgetDate;
    DateTime maxBudgetDate = getMaxBudgetDate();
    DateTime previousDate;

    SubCategory subcategory = await SubCategoryCreator(
            queryContext: queryContext,
            name: subcategoryName,
            parentId: maincategoryId,
            budgeted: 0.00,
            available: 0.00)
        .create();

    budgetList.addSubcategory(subcategory);

    /// Insert a budget value for every month from [startingBudgetDate] until [MAX_NB_MONTHS_AHEAD]
    /// after [DateTime.now()],
    do {
      /// Update BudgetValues

      previousDate = newDate;

      BudgetValueCreator creator = BudgetValueCreator(
        queryContext: queryContext,
        subcategoryId: subcategory.id,
        budgeted: 0,
        available: 0,
        year: previousDate.year,
        month: previousDate.month,
      );

      budgetValueList.add(await creator.create());
      newDate = Jiffy(previousDate).add(months: 1);
    } while (previousDate.isBefore(maxBudgetDate));

    notifyListeners();
  }

  /// Add the [transaction] to the [transactionList], persist it to
  /// the database and add the transaction amount to the corresponding subcategory.
  /// Finally, update the fields of the [MainCategory] which contains the
  /// subcategory.
  Future<void> addTransaction({
    @required int subcatId,
    @required int payeeId,
    @required int accountId,
    @required double amount,
    @required String memo,
    @required DateTime date,
  }) async {
    // Add transaction to the state, to the database and update the count

    MoneyTransactionCreator creator = MoneyTransactionCreator(
      queryContext: queryContext,
      subcatId: subcatId,
      payeeId: payeeId,
      accountId: accountId,
      amount: amount,
      memo: memo,
      date: date,
    );

    MoneyTransaction transaction = await creator.create();
    transactionList.add(transaction);

    setMostRecentAccountUsed(accountId);

    bool isTransactionIntoToBeBudgeted =
        transaction.subcatID == Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION;
    bool isTransactionBetweenAccounts =
        transaction.subcatID == Constants.UNASSIGNED_SUBCAT_ID;
    if (isTransactionIntoToBeBudgeted) {
      await _addTransactionIntoToBeBudgeted(transaction);
      notifyListeners();
    } else if (isTransactionBetweenAccounts) {
      await _addTransactionBetweenAccounts(transaction);
      notifyListeners();
    } else {
      //notifyListeners is called in _addStandardTransaction
      _addStandardTransaction(transaction);
    }
  }

  void _addStandardTransaction(MoneyTransaction transaction) {
    // Update balance of the account
    final Account account =
        accounts.singleWhere((account) => account.id == transaction.accountID);
    account.balance += transaction.amount;
    queryContext.updateAccount(account);

    Budget budget = budgetList
        .getByDate(DateTime(transaction.date.year, transaction.date.month));
    SubCategory oldSubcat = budget.subcategories
        .singleWhere((subcat) => subcat.id == transaction.subcatID);

    double newAvailableAmount = oldSubcat.available + transaction.amount;
    SubCategory newSubcat = SubCategory(
        id: oldSubcat.id,
        parentId: oldSubcat.parentId,
        name: oldSubcat.name,
        budgeted: oldSubcat.budgeted,
        available: newAvailableAmount);

    //notifyListeners is called in updateSubcategory
    updateSubcategoryValues(newSubcat, transaction.date);
  }

  Future<void> _addTransactionBetweenAccounts(
      MoneyTransaction transaction) async {
    /// If the transaction amount is positive, the transaction will remove money from
    /// [outAccount] and input it into [inAccount].
    /// Otherwise, it is reversed.

    /// [outAccount] is ALWAYS the one pointed to by accountID.
    /// Therefore, [inAccount] will be the one defined by [-payee.id].
    final Account outAccount =
        accounts.singleWhere((account) => account.id == transaction.accountID);
    outAccount.balance -= transaction.amount;

    final Account inAccount =
        accounts.singleWhere((account) => account.id == -transaction.payeeID);
    inAccount.balance += transaction.amount;
    await queryContext.updateAccount(outAccount);
    await queryContext.updateAccount(inAccount);
  }

  Future<void> _addTransactionIntoToBeBudgeted(
      MoneyTransaction transaction) async {
    // Update balance of the account
    final Account account =
        accounts.singleWhere((account) => account.id == transaction.accountID);
    account.balance += transaction.amount;
    await queryContext.updateAccount(account);
    budgetList = BudgetList(queryContext, await createAllMonthlyBudgets());
    await computeToBeBudgeted();
  }

  Future<void> addGoal({
    @required GoalType goalType,
    @required int subcategoryId,
    @required double amount,
    @required DateTime date,
  }) async {
    GoalModel goalModel = GoalModel(
        correspondingSubcategoryId: subcategoryId,
        goalType: goalType,
        amount: amount,
        month: date.month,
        year: date.year);

    int goalId = await queryContext.addGoal(goalModel);

    Goal newGoal;
    if (goalType == GoalType.TargetAmountByDate) {
      newGoal =
          Goal(goalId, subcategoryId, goalType, amount, date.month, date.year);
    } else {
      ///Use the current budget date, as there is no end date for the other types of goal
      newGoal = Goal(goalId, subcategoryId, goalType, amount,
          currentBudget.month, currentBudget.year);
    }
    _goals.add(newGoal);
    notifyListeners();
  }

  /// Update all the fields of [modifiedSubcategory]
  /// in both the state and in the data base.
  void updateSubcategoryValues(
      SubCategory modifiedSubcategory, DateTime dateMofidied) async {
    _updateSubcategoryInCurrentBudget(modifiedSubcategory, dateMofidied);
    _updateSubcategoryInSubsequentBudgets(modifiedSubcategory, dateMofidied);
    await computeToBeBudgeted();

    notifyListeners();
  }

  void _updateSubcategoryInSubsequentBudgets(
      SubCategory modifiedSubcategory, DateTime dateMofidied) {
    double lastMonthAvailable = modifiedSubcategory.available;
    DateTime maxBudgetDate = getMaxBudgetDate();
    DateTime date = Jiffy(dateMofidied).add(months: 1);

    ///TODO: THink about removing BudgetValue from appState and only storing it in Budgets

    while (date.isBefore(maxBudgetDate)) {
      BudgetValue budgetValue =
          budgetValueList.getByBudget(date, modifiedSubcategory.id);

      // Combine the total available money from month to month
      budgetValue.available = lastMonthAvailable + budgetValue.budgeted;
      lastMonthAvailable = budgetValue.available;

      queryContext.updateBudgetValue(budgetValue);

      Budget budget = budgetList.getByDate(date);
      budget.makeSubcategoryChangeBySubcatId(
          modifiedSubcategory.id, //
          modifiedSubcategory.parentId,
          "available",
          budgetValue.available.toString());

      date = Jiffy(date).add(months: 1);
    }
  }

  void _updateSubcategoryInCurrentBudget(
      SubCategory modifiedSubcategory, DateTime dateMofidied) {
    currentBudget.updateSubCategory(modifiedSubcategory);

    budgetValueList.updateBudgetValue(
        subcatId: modifiedSubcategory.id,
        date: dateMofidied,
        newBudgeted: modifiedSubcategory.budgeted,
        newAvailable: modifiedSubcategory.available);
  }

  void updateSubcategoryName(int id, String newName) {
    budgetList.updateSubcategoryName(id: id, newName: newName);
    notifyListeners();
    queryContext.updateSubcategoryName(id, newName);
  }

  void removeSubcategory(int subcategoryId) {
    SubCategory toBeRemoved = currentBudget.subcategories
        .singleWhere((subcat) => subcat.id == subcategoryId);
    budgetList.removeSubcategory(toBeRemoved.id, toBeRemoved.parentId);
    queryContext.deleteSubcategory(subcategoryId);
    budgetValueList.removeBySubcatId(subcategoryId);
    notifyListeners();
  }

  /// Update the name of the [MainCategory] pointed to
  /// by [modifiedCategory.id] to [modifiedCategory.name]
  void updateCategoryName(MainCategory modifiedCategory) {
    budgetList.updateMaincategory(modifiedCategory);
    notifyListeners();
    queryContext.updateCategory(modifiedCategory);
  }

  Future<void> computeToBeBudgeted() async {
    toBeBudgeted = 0;

    // Sum up starting total for every account
    for (final Account account in accounts) {
      MoneyTransaction firstTransaction =
          await queryContext.getFirstTransactionOfAccount(account.id);
      toBeBudgeted += firstTransaction.amount;
    }

    // Remove total budgeted of each month
    DateTime prevDate = startingBudgetDate;
    DateTime nextDate = startingBudgetDate;

    do {
      prevDate = nextDate;
      Budget budget = budgetList.getByDate(prevDate);
      toBeBudgeted -= budget.totalBudgeted;
      toBeBudgeted += budget.toBeBudgetedInputFromMoneyTransactions;
      //Go to next month
      nextDate = Jiffy(nextDate).add(months: 1);
    } while (currentBudgetDate.isAfter(prevDate));
  }

  void incrementMonth() async {
    if (currentBudgetDate.isBefore(getMaxBudgetDate())) {
      currentBudgetDate = Jiffy(currentBudgetDate).add(months: 1);
      currentBudget = budgetList.getByDate(currentBudgetDate);
      await computeToBeBudgeted();
      notifyListeners();
    }
  }

  void decrementMonth() async {
    if (currentBudgetDate.isAfter(startingBudgetDate)) {
      currentBudgetDate = Jiffy(currentBudgetDate).subtract(months: 1);
      currentBudget = budgetList.getByDate(currentBudgetDate);
      await computeToBeBudgeted();
      notifyListeners();
    }
  }

  double computeAverageBudgeted(int subcategoryId) {
    return budgetList.computeAvgBugdetedPerSubcategory(subcategoryId);
  }

  double computeLastMonthBudgeted(int subcategoryId) {
    DateTime lastMonthDate = Jiffy(currentBudgetDate).subtract(months: 1);
    Budget lastMonthBudget = budgetList.getByDate(lastMonthDate);

    if (lastMonthBudget == null) {
      return 0.00;
    }

    SubCategory lastMonthSubcat = lastMonthBudget.subcategories
        .singleWhere((subcat) => subcat.id == subcategoryId);

    return lastMonthSubcat.budgeted;
  }

  @visibleForTesting
  Future<List<Budget>> createAllMonthlyBudgets() async {
    List<Budget> budgets = [];
    DateTime currentDate = startingBudgetDate;
    List<MainCategory> maincategories = await queryContext.getCategories();
    DateTime storedMaxBudgetDate =
        await queryContext.getMaxBudgetDateConstant();
    // Start with 1 month's difference and keep incrementing
    // until we overshoot the endDate

    // Get every transaction made into 'To Be Budgeted'
    List<MoneyTransaction> toBeBudgetedTransactions =
        transactionList.getToBeBudgetedTransactions();

    do {
      List<SubCategory> subcategories = await queryContext
          .getSubCategoriesJoined(currentDate.year, currentDate.month);
      Budget budget = Budget(
          maincategories, subcategories, currentDate.month, currentDate.year);

      double positiveAmountTransferedIntoToBeBudgeted = toBeBudgetedTransactions
          .where((transaction) => isSameMonth(transaction.date, currentDate))
          .fold(0, (total, transaction) => total + transaction.amount);

      budget.toBeBudgetedInputFromMoneyTransactions +=
          positiveAmountTransferedIntoToBeBudgeted;
      budgets.add(budget);

      //Go to next month
      currentDate = Jiffy(currentDate).add(months: 1);
    } while (currentDate.isBefore(Jiffy(storedMaxBudgetDate).add(months: 1)));

    if (await _checkIfNeedToIncrementMax()) {
      budgets = await _incrementMaxBudgetAndUpdateBudgets(budgets);
    }
    return budgets;
  }

  Future<void> deleteTransaction(int transactionId) async {
    MoneyTransaction transaction = transactionList.getById(transactionId);

    bool isTransactionIntoToBeBudgeted =
        transaction.subcatID == Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION;
    bool isTransactionBetweenAccounts =
        transaction.subcatID == Constants.UNASSIGNED_SUBCAT_ID;

    if (isTransactionIntoToBeBudgeted) {
      await _deleteTransactionIntoToBeBudgeted(transaction);
      await computeToBeBudgeted();
      notifyListeners();
    } else if (isTransactionBetweenAccounts) {
      _deleteTransactionBetweenAccounts(transaction);
      notifyListeners();
    } else {
      _deleteStandardTransaction(transaction);
    }

    transactionList.remove(transactionId);
    queryContext.deleteTransaction(transactionId);
  }

  void _deleteStandardTransaction(MoneyTransaction transaction) {
    final Account account =
        accounts.singleWhere((account) => account.id == transaction.accountID);
    account.balance -= transaction.amount;
    queryContext.updateAccount(account);

    Budget budget = budgetList
        .getByDate(DateTime(transaction.date.year, transaction.date.month));
    SubCategory oldSubcat = budget.subcategories
        .singleWhere((subcat) => subcat.id == transaction.subcatID);

    double newAvailableAmount = oldSubcat.available - transaction.amount;
    SubCategory newSubcat = SubCategory(
        id: oldSubcat.id,
        parentId: oldSubcat.parentId,
        name: oldSubcat.name,
        budgeted: oldSubcat.budgeted,
        available: newAvailableAmount);

    //notifyListeners is called in updateSubcategory
    updateSubcategoryValues(newSubcat, transaction.date);
  }

  void _deleteTransactionBetweenAccounts(MoneyTransaction transaction) {
    /// If we do a MoneyTransaction between accounts (subcat.ID == UNASSIGNED_SUBCAT_ID)
    /// subcategories are not affected.
    final Account outAccount =
        accounts.singleWhere((account) => account.id == transaction.accountID);
    outAccount.balance += transaction.amount;

    final Account inAccount =
        accounts.singleWhere((account) => account.id == -transaction.payeeID);
    inAccount.balance -= transaction.amount;
    queryContext.updateAccount(outAccount);
    queryContext.updateAccount(inAccount);
  }

  Future<void> _deleteTransactionIntoToBeBudgeted(
      MoneyTransaction transaction) async {
    // Update balance of the account
    final Account account =
        accounts.singleWhere((account) => account.id == transaction.accountID);
    account.balance -= transaction.amount;
    await queryContext.updateAccount(account);

    Budget budget = budgetList.getByDate(transaction.date);
    budget.toBeBudgetedInputFromMoneyTransactions -= transaction.amount;
  }

  void removeCategory(int categoryId) {
    List<SubCategory> correspondingSubcategories =
        subcategories.where((subcat) => subcat.parentId == categoryId).toList();

    budgetList.removeMaincategory(categoryId);
    queryContext.deleteCategory(categoryId);

    correspondingSubcategories
        .forEach((subcat) => removeSubcategory(subcat.id));

    computeToBeBudgeted();
    notifyListeners();
  }

  Future<List<Budget>> _incrementMaxBudgetAndUpdateBudgets(
      List<Budget> budgets) async {
    DateTime newDate;
    DateTime previousDate = await queryContext.getMaxBudgetDateConstant();
    DateTime maxBudgetDate = getMaxBudgetDate();

    Budget currentMaxBudget = budgets.singleWhere(
      (budget) =>
          budget.year == previousDate.year &&
          budget.month == previousDate.month,
    );

    budgets.forEach((element) {
      print(element);
    });

    do {
      newDate = Jiffy(previousDate).add(months: 1);

      currentMaxBudget = budgets.singleWhere(
        (budget) =>
            budget.year == previousDate.year &&
            budget.month == previousDate.month,
      );
      previousDate = newDate;

      // Add all BudgetValue for the new month to the database
      // print(currentMaxBudget.subcategories);
      for (final SubCategory previousMonthSubcat
          in currentMaxBudget.subcategories) {
        BudgetValueModel budgetValueModel = BudgetValueModel(
          subcategoryId: previousMonthSubcat.id,
          budgeted: 0,
          available: previousMonthSubcat.available,
          year: newDate.year,
          month: newDate.month,
        );

        await queryContext.addBudgetValue(budgetValueModel);
      }

      // Fetch the newly added BudgetValues and create a new budget, adding it to the
      // already existing list of budgets
      List<SubCategory> updatedSubcategories = await queryContext
          .getSubCategoriesJoined(newDate.year, newDate.month);

      Budget newBudget = Budget(currentMaxBudget.maincategories,
          updatedSubcategories, newDate.month, newDate.year);
      currentMaxBudget = newBudget;
      budgets.add(newBudget);
    } while (newDate.isBefore(maxBudgetDate));

    //Update max budget date constant
    await queryContext.setMaxBudgetDateConstant(maxBudgetDate);

    return budgets;
  }

  Future<bool> _checkIfNeedToIncrementMax() async {
    int nbMonthDifference =
        await _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate();
    return nbMonthDifference > 0;
  }

  Future<int>
      _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate() async {
    DateTime currentMaxBudgetDate = getMaxBudgetDate();
    DateTime storedMaxBudgetDate =
        await queryContext.getMaxBudgetDateConstant();
    return getMonthDifference(currentMaxBudgetDate, storedMaxBudgetDate);
  }

  void setMostRecentAccountUsed(int accountId) {
    queryContext.updateMostRecentAccountUsed(accountId);
    _mostRecentAccount = accounts
        .singleWhere((account) => account.id == accountId, orElse: () => null);
  }

  Future<Account> getMostRecentAccountUsed() async {
    int accountId = await queryContext.getMostRecentAccountUsed();
    return accounts.singleWhere((account) => account.id == accountId,
        orElse: () => null);
  }
}
