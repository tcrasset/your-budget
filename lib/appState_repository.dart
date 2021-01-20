import 'package:flutter/material.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/goal.dart';

import 'models/entries.dart';

abstract class AppStateRepository {
  Future<void> loadStateFromDatabase();

  Future<void> addAccount({@required String accountName, @required  double balance});

  /// Adds [category] to the current [_allCategories], to [_maincategories],
  /// and to the data base.
  void addCategory({@required String categoryName});

  Future<Payee> addPayee({@required String payeeName});

  /// Adds [subcategory] to the list [_subcategories],
  /// ,to the data base and update the list  [_allCategories] by
  /// extracting the subcategories of each [MainCategory] from
  /// scratch
  void addSubcategory({@required String subcategoryName, @required  int maincategoryId});

  /// Add the [transaction] to the [_transactions] list, persist it to
  /// the database and add the transaction amount to the corresponding subcategory.
  /// Finally, update the fields of the [MainCategory] which contains the
  /// subcategory.
  Future<void> addTransaction({
    int subcatId,
    int payeeId,
    int accountId,
    double amount,
    String memo,
    DateTime date,
  });

  Future<void> addGoal({
    @required GoalType goalType,
    @required int subcategoryId,
    @required double amount,
    @required DateTime date,
  });

  /// Update all the fields of [modifiedSubcategory]
  /// in both the state and in the data base.
  void updateSubcategory(SubCategory modifiedSubcategory, DateTime dateMofidied);

  BudgetValue _getBudgetValue(SubCategory modifiedSubcategory);

  void removeSubcategory(int subcategoryId);

  /// Update the name of the [MainCategory] pointed to
  /// by [modifiedCategory.id] to [modifiedCategory.name]
  void updateCategoryName(MainCategory modifiedCategory);

  Future<void> computeToBeBudgeted();

  void incrementMonth();

  void decrementMonth();

  double computeAverageBudgeted(int subcategoryId);

  double computeLastMonthBudgeted(int subcategoryId);

  Future<List<Budget>> _createAllMonthlyBudgets();

  Budget _getBudgetByDate(DateTime date);

  void deleteTransaction(int transactionId);

  void removeCategory(int categoryId);

  void _deleteCorrespondingBudgetValues(int subcategoryId);

  Future<List<Budget>> _incrementMaxBudgetAndUpdateBudgets(
      List<Budget> budgets);

  Future<bool> _checkIfNeedToIncrementMax();

  Future<int> _getNbMonthDifferenceBetweenCurrentAndStoredMaxBudgetDate();

  void setMostRecentAccountUsed(int accountId);

  Future<Account> getMostRecentAccountUsed();
}
