// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:jiffy/jiffy.dart';

// Project imports:
import 'appstate_repository.dart';
import 'models/account.dart';
import 'models/account_creator.dart';
import 'models/account_list.dart';
import 'models/budget.dart';
import 'models/budget_list.dart';
import 'models/budget_value_creator.dart';
import 'models/budget_value_list.dart';
import 'models/categories.dart';
import 'models/categories_model.dart';
import 'models/constants.dart';
import 'models/goal.dart';
import 'models/goal_model.dart';
import 'models/maincategory_creator.dart';
import 'models/money_transaction.dart';
import 'models/money_transaction_creator.dart';
import 'models/money_transaction_list.dart';
import 'models/payee.dart';
import 'models/payee_creator.dart';
import 'models/payee_list.dart';
import 'models/queries.dart';
import 'models/subcategory_creator.dart';
import 'models/utils.dart';

class AppState extends ChangeNotifier implements AppStateRepository {
  // List<SubCategory> _subcategories = [];
  List<Goal> _goals = [];
  final Queries queryContext;

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
  Future<Account> get mostRecentAccount => accountList.getMostRecentAccount();

  AppState({@required this.queryContext});

  @override
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

    await computeToBeBudgeted();

    notifyListeners();
  }

  @override
  Future<void> addAccount(
      {@required String accountName, @required double balance}) async {
    final AccountCreator creator = AccountCreator(
        queryContext: queryContext, balance: balance, name: accountName);
    accountList.add(await creator.create());
    transactionList.add(await creator.getStartingMoneyTransaction());

    await computeToBeBudgeted();
    notifyListeners();
  }

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  @override
  Future<void> addCategory({@required String categoryName}) async {
    final MainCategory cat = await MainCategoryCreator(
            queryContext: queryContext, name: categoryName)
        .create();

    budgetList.addMaincategory(cat);
    notifyListeners();
  }

  @override
  Future<Payee> addPayee({@required String payeeName}) async {
    final PayeeCreator creator =
        PayeeCreator(queryContext: queryContext, name: payeeName);
    final Payee payee = await creator.create();
    payeeList.add(payee);
    notifyListeners();
    return payee;
  }

  /// Adds [subcategory] to the list [_subcategories],
  /// to the data base and update the list  [_allCategories] by
  /// extracting the subcategories of each [MainCategory] from
  /// scratch
  @override
  Future<void> addSubcategory(
      {@required String subcategoryName, @required int maincategoryId}) async {
    DateTime newDate = startingBudgetDate;
    final DateTime maxBudgetDate = getMaxBudgetDate();
    DateTime previousDate;

    final SubCategory subcategory = await SubCategoryCreator(
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

      final BudgetValueCreator creator = BudgetValueCreator(
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
  @override
  Future<void> addTransaction({
    @required int subcatId,
    @required int payeeId,
    @required int accountId,
    @required double amount,
    @required String memo,
    @required DateTime date,
  }) async {
    // Add transaction to the state, to the database and update the count

    final MoneyTransactionCreator creator = MoneyTransactionCreator(
      queryContext: queryContext,
      subcatId: subcatId,
      payeeId: payeeId,
      accountId: accountId,
      amount: amount,
      memo: memo,
      date: date,
    );

    final MoneyTransaction transaction = await creator.create();
    transactionList.add(transaction);

    accountList.setMostRecentAccount(accountId);

    final bool isTransactionIntoToBeBudgeted =
        transaction.subcatID == Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION;
    final bool isTransactionBetweenAccounts =
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
    accountList.creditAccount(
        id: transaction.accountID, amount: transaction.amount);

    final Budget budget = budgetList
        .getByDate(DateTime(transaction.date.year, transaction.date.month));
    final SubCategory oldSubcat = budget.subcategories
        .singleWhere((subcat) => subcat.id == transaction.subcatID);

    final double newAvailableAmount = oldSubcat.available + transaction.amount;
    final SubCategory newSubcat = SubCategory(
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
    accountList.debitAccount(
        id: transaction.accountID, amount: transaction.amount);
    accountList.creditAccount(
        id: -transaction.payeeID, amount: transaction.amount);
  }

  Future<void> _addTransactionIntoToBeBudgeted(
      MoneyTransaction transaction) async {
    accountList.creditAccount(
        id: transaction.accountID, amount: transaction.amount);

    budgetList = BudgetList(queryContext, await createAllMonthlyBudgets());
    await computeToBeBudgeted();
  }

  @override
  Future<void> addGoal({
    @required GoalType goalType,
    @required int subcategoryId,
    @required double amount,
    @required DateTime date,
  }) async {
    final GoalModel goalModel = GoalModel(
        correspondingSubcategoryId: subcategoryId,
        goalType: goalType,
        amount: amount,
        month: date.month,
        year: date.year);

    final int goalId = await queryContext.addGoal(goalModel);

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
  @override
  Future<void> updateSubcategoryValues(
      SubCategory modifiedSubcategory, DateTime dateMofidied) async {
    _updateSubcategoryInCurrentBudget(modifiedSubcategory, dateMofidied);
    _updateSubcategoryInSubsequentBudgets(modifiedSubcategory, dateMofidied);
    await computeToBeBudgeted();

    notifyListeners();
  }

  void _updateSubcategoryInSubsequentBudgets(
      SubCategory modifiedSubcategory, DateTime dateMofidied) {
    double lastMonthAvailable = modifiedSubcategory.available;
    final DateTime maxBudgetDate = getMaxBudgetDate();
    DateTime date = Jiffy(dateMofidied).add(months: 1);

    ///TODO: THink about removing BudgetValue from appState and only storing it in Budgets

    while (date.isBefore(maxBudgetDate)) {
      final BudgetValue budgetValue =
          budgetValueList.getByBudget(date, modifiedSubcategory.id);

      // Combine the total available money from month to month
      budgetValue.available = lastMonthAvailable + budgetValue.budgeted;
      lastMonthAvailable = budgetValue.available;

      queryContext.updateBudgetValue(budgetValue);

      final Budget budget = budgetList.getByDate(date);
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

  @override
  void removeSubcategory(int subcategoryId) {
    final SubCategory toBeRemoved = currentBudget.subcategories
        .singleWhere((subcat) => subcat.id == subcategoryId);
    budgetList.removeSubcategory(toBeRemoved.id, toBeRemoved.parentId);
    queryContext.deleteSubcategory(subcategoryId);
    budgetValueList.removeBySubcatId(subcategoryId);
    notifyListeners();
  }

  /// Update the name of the [MainCategory] pointed to
  /// by [modifiedCategory.id] to [modifiedCategory.name]
  @override
  void updateCategoryName(MainCategory modifiedCategory) {
    budgetList.updateMaincategory(modifiedCategory);
    notifyListeners();
    queryContext.updateCategory(modifiedCategory);
  }

  @override
  Future<void> computeToBeBudgeted() async {
    toBeBudgeted = 0;

    // Sum up starting total for every account
    for (final Account account in accounts) {
      final MoneyTransaction firstTransaction =
          await queryContext.getFirstTransactionOfAccount(account.id);
      toBeBudgeted += firstTransaction.amount;
    }

    // Remove total budgeted of each month
    DateTime prevDate = startingBudgetDate;
    DateTime nextDate = startingBudgetDate;

    do {
      prevDate = nextDate;
      final Budget budget = budgetList.getByDate(prevDate);
      toBeBudgeted -= budget.totalBudgeted;
      toBeBudgeted += budget.toBeBudgetedInputFromMoneyTransactions;
      //Go to next month
      nextDate = Jiffy(nextDate).add(months: 1);
    } while (currentBudgetDate.isAfter(prevDate));
  }

  @override
  Future<void> incrementMonth() async {
    if (currentBudgetDate.isBefore(getMaxBudgetDate())) {
      currentBudgetDate = Jiffy(currentBudgetDate).add(months: 1);
      currentBudget = budgetList.getByDate(currentBudgetDate);
      await computeToBeBudgeted();
      notifyListeners();
    }
  }

  @override
  Future<void> decrementMonth() async {
    if (currentBudgetDate.isAfter(startingBudgetDate)) {
      currentBudgetDate = Jiffy(currentBudgetDate).subtract(months: 1);
      currentBudget = budgetList.getByDate(currentBudgetDate);
      await computeToBeBudgeted();
      notifyListeners();
    }
  }

  @override
  double computeAverageBudgeted(int subcategoryId) {
    return budgetList.computeAvgBugdetedPerSubcategory(subcategoryId);
  }

  @override
  double computeLastMonthBudgeted(int subcategoryId) {
    final DateTime lastMonthDate = Jiffy(currentBudgetDate).subtract(months: 1);
    final Budget lastMonthBudget = budgetList.getByDate(lastMonthDate);

    if (lastMonthBudget == null) {
      return 0.00;
    }

    final SubCategory lastMonthSubcat = lastMonthBudget.subcategories
        .singleWhere((subcat) => subcat.id == subcategoryId);

    return lastMonthSubcat.budgeted;
  }

  @visibleForTesting
  @override
  Future<List<Budget>> createAllMonthlyBudgets() async {
    List<Budget> budgets = [];
    DateTime currentDate = startingBudgetDate;
    final List<MainCategory> maincategories =
        await queryContext.getCategories();
    final DateTime storedMaxBudgetDate =
        await queryContext.getMaxBudgetDateConstant();
    // Start with 1 month's difference and keep incrementing
    // until we overshoot the endDate

    // Get every transaction made into 'To Be Budgeted'
    final List<MoneyTransaction> toBeBudgetedTransactions =
        transactionList.getToBeBudgetedTransactions();

    do {
      final List<SubCategory> subcategories = await queryContext
          .getSubCategoriesJoined(currentDate.year, currentDate.month);
      final Budget budget = Budget(
          maincategories, subcategories, currentDate.month, currentDate.year);

      final double positiveAmountTransferedIntoToBeBudgeted =
          toBeBudgetedTransactions
              .where(
                  (transaction) => isSameMonth(transaction.date, currentDate))
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

  @override
  Future<void> deleteTransaction(int transactionId) async {
    final MoneyTransaction transaction = transactionList.getById(transactionId);

    final bool isTransactionIntoToBeBudgeted =
        transaction.subcatID == Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION;
    final bool isTransactionBetweenAccounts =
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
    accountList.debitAccount(
        id: transaction.accountID, amount: transaction.amount);

    final Budget budget = budgetList
        .getByDate(DateTime(transaction.date.year, transaction.date.month));
    final SubCategory oldSubcat = budget.subcategories
        .singleWhere((subcat) => subcat.id == transaction.subcatID);

    final double newAvailableAmount = oldSubcat.available - transaction.amount;
    final SubCategory newSubcat = SubCategory(
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
    accountList.creditAccount(
        id: transaction.accountID, amount: transaction.amount);
    accountList.debitAccount(
        id: -transaction.payeeID, amount: transaction.amount);
  }

  Future<void> _deleteTransactionIntoToBeBudgeted(
      MoneyTransaction transaction) async {
    accountList.debitAccount(
        id: transaction.accountID, amount: transaction.amount);

    final Budget budget = budgetList.getByDate(transaction.date);
    budget.toBeBudgetedInputFromMoneyTransactions -= transaction.amount;
  }

  @override
  void removeCategory(int categoryId) {
    final List<SubCategory> correspondingSubcategories =
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
    final DateTime maxBudgetDate = getMaxBudgetDate();

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
        final BudgetValueModel budgetValueModel = BudgetValueModel(
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
      final List<SubCategory> updatedSubcategories = await queryContext
          .getSubCategoriesJoined(newDate.year, newDate.month);

      final Budget newBudget = Budget(currentMaxBudget.maincategories,
          updatedSubcategories, newDate.month, newDate.year);
      currentMaxBudget = newBudget;
      budgets.add(newBudget);
    } while (newDate.isBefore(maxBudgetDate));

    //Update max budget date constant
    await queryContext.setMaxBudgetDateConstant(maxBudgetDate);

    return budgets;
  }

  Future<bool> _checkIfNeedToIncrementMax() async {
    final int nbMonthDifference =
        await _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate();
    return nbMonthDifference > 0;
  }

  Future<int>
      _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate() async {
    final DateTime currentMaxBudgetDate = getMaxBudgetDate();
    final DateTime storedMaxBudgetDate =
        await queryContext.getMaxBudgetDateConstant();
    return getMonthDifference(currentMaxBudgetDate, storedMaxBudgetDate);
  }
}
