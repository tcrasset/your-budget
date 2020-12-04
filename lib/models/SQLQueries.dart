import 'package:flutter/material.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/database_creator.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/goal.dart';
import 'package:your_budget/models/goal_model.dart';

class SQLQueryClass {
  static Future<void> debugDatabase() async {
    (await db.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
      debugPrint(row.values.toString());
    });
  }

  /// Returns the list of all [MainCategory] in the database.
  static Future<List<MainCategory>> getCategories() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.categoryTable}''';
    final data = await db.rawQuery(sql);

    List<MainCategory> categories = List();
    for (final node in data) {
      final category = MainCategory.fromJson(node);
      categories.add(category);
    }

    return categories;
  }

  /// Returns the list of all [SubCategory] in the database.
  static Future<List<SubCategory>> getSubCategories() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.subcategoryTable};''';
    final data = await db.rawQuery(sql);

    List<SubCategory> subcategories = List();
    for (final node in data) {
      final subcategory = SubCategory.fromJson(node);
      subcategories.add(subcategory);
    }

    return subcategories;
  }

  /// Returns the list of all [Account] in the database.
  static Future<List<Account>> getAccounts() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.accountTable};''';
    final data = await db.rawQuery(sql);

    List<Account> accounts = List();
    for (final node in data) {
      final account = Account.fromJson(node);
      accounts.add(account);
    }

    return accounts;
  }

  /// Returns the list of all [Payee] in the database.
  static Future<List<Payee>> getPayees() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.payeeTable};''';
    final data = await db.rawQuery(sql);

    List<Payee> payees = List();
    for (final node in data) {
      final payee = Payee.fromJson(node);
      payees.add(payee);
    }

    return payees;
  }

  /// Returns the list of all [MoneyTransaction] in the database.
  static Future<List<MoneyTransaction>> getMoneyTransactions() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.moneyTransactionTable}
    ORDER BY ${DatabaseCreator.MONEYTRANSACTION_DATE} DESC;''';
    final data = await db.rawQuery(sql);

    List<MoneyTransaction> transactions = List();
    for (final node in data) {
      final transaction = MoneyTransaction.fromJson(node);
      transactions.add(transaction);
    }
    return transactions;
  }

  /// Returns the list of all [BudgetValue] in the database.
  static Future<List<BudgetValue>> getBudgetValues() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.budgetValueTable};''';
    final data = await db.rawQuery(sql);

    List<BudgetValue> budgetvalues = List();
    for (final node in data) {
      final budgetvalue = BudgetValue.fromJson(node);
      budgetvalues.add(budgetvalue);
    }

    return budgetvalues;
  }

  static Future<List<Goal>> getGoals() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.goalTable};''';
    final data = await db.rawQuery(sql);

    List<Goal> goals = List();
    for (final node in data) {
      final goal = Goal.fromJson(node);
      goals.add(goal);
    }

    return goals;
  }

  static Future<List<SubCategory>> getSubCategoriesJoined(int year, int month) async {
    // (await db.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
    //   print(row.values);
    // });

    final sql = '''SELECT ${DatabaseCreator.subcategoryTable}.${DatabaseCreator.SUBCAT_ID} as id,
        ${DatabaseCreator.CAT_ID_OUTSIDE},
        ${DatabaseCreator.SUBCAT_NAME},
        ${DatabaseCreator.budgetValueTable}.${DatabaseCreator.BUDGET_VALUE_BUDGETED},
        ${DatabaseCreator.budgetValueTable}.${DatabaseCreator.BUDGET_VALUE_AVAILABLE}

        FROM
          ${DatabaseCreator.budgetValueTable}
          LEFT JOIN ${DatabaseCreator.subcategoryTable}
          ON
          ${DatabaseCreator.budgetValueTable}.${DatabaseCreator.SUBCAT_ID_OUTSIDE} = ${DatabaseCreator.subcategoryTable}.${DatabaseCreator.SUBCAT_ID}
        WHERE
          ${DatabaseCreator.BUDGET_VALUE_YEAR} == $year
          and ${DatabaseCreator.BUDGET_VALUE_MONTH} == $month''';

    final data = await db.rawQuery(sql);

    List<SubCategory> subcategories = [];
    for (final node in data) {
      final subcategory = SubCategory.fromJson(node);
      subcategories.add(subcategory);
    }

    return subcategories;
  }

  static Future<MoneyTransaction> getFirstTransactionOfAccount(int accountId) async {
    final String sql = '''SELECT * FROM ${DatabaseCreator.moneyTransactionTable}
                          WHERE ${DatabaseCreator.ACCOUNT_ID_OUTSIDE} == $accountId
                          ORDER BY ${DatabaseCreator.MONEYTRANSACTION_DATE} ASC LIMIT 1;''';
    final data = await db.rawQuery(sql);

    if (data.isNotEmpty) {
      return MoneyTransaction.fromJson(data[0]);
    } else {
      throw Exception();
    }
  }

  /// Adds the [category] of type [MainCategory] to the database.
  ///
  /// The [MainCategory] is specified using [category.id] and [category.name]
  static Future<int> addCategory(MainCategoryModel categoryModel) async {
    final sql = '''INSERT INTO ${DatabaseCreator.categoryTable}
      (${DatabaseCreator.CATEGORY_NAME})
      VALUES(?);''';

    List<dynamic> params = [categoryModel.name];
    int id = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add category', sql, null, id, params);
    return id;
  }

  /// Adds the [subcategory] of type [SubCategory] to the database.
  ///
  /// The [SubCategory] is specified using [subcategory.id],
  /// [subcategory.parent_id], and [subcategory.name]
  static Future<int> addSubcategory(SubCategoryModel subcategoryModel) async {
    final sql = '''INSERT INTO ${DatabaseCreator.subcategoryTable}
      (${DatabaseCreator.CAT_ID_OUTSIDE},
      ${DatabaseCreator.SUBCAT_NAME})
      VALUES(?, ?);''';

    List<dynamic> params = [
      subcategoryModel.parentId,
      subcategoryModel.name,
    ];

    int id = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add subcategory', sql, null, id, params);
    return id;
  }

  /// Adds the [payee] of type [Payee] to the database.
  ///
  /// The [Payee] is specified using [payee.id] and [payee.name]
  static Future<int> addPayee(PayeeModel payeeModel) async {
    final sql = '''INSERT INTO ${DatabaseCreator.payeeTable}
      (${DatabaseCreator.PAYEE_NAME})
      VALUES(?);''';

    List<dynamic> params = [
      payeeModel.name,
    ];
    int id = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add payee', sql, null, id, params);
    return id;
  }

  /// Adds the [account] of type [Account] to the database.
  ///
  /// The [Account] is specified using [account.id] and [account.name]
  static Future<int> addAccount(AccountModel accountModel) async {
    final sql = '''INSERT INTO ${DatabaseCreator.accountTable}
      (${DatabaseCreator.ACCOUNT_NAME},
      ${DatabaseCreator.ACCOUNT_BALANCE}
      )
      VALUES(?, ?);''';

    List<dynamic> params = [
      accountModel.name,
      accountModel.balance,
    ];
    int id = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add account', sql, null, id, params);
    return id;
  }

  /// Adds the [budgetvalue] of type [BudgetValue] to the database.
  static Future<int> addBudgetValue(BudgetValueModel budgetValueModel) async {
    final sql = '''INSERT INTO ${DatabaseCreator.budgetValueTable}
      (${DatabaseCreator.SUBCAT_ID_OUTSIDE},
      ${DatabaseCreator.BUDGET_VALUE_BUDGETED},
      ${DatabaseCreator.BUDGET_VALUE_AVAILABLE},
      ${DatabaseCreator.BUDGET_VALUE_YEAR},
      ${DatabaseCreator.BUDGET_VALUE_MONTH})
      VALUES(?, ?, ?, ?, ?);''';

    List<dynamic> params = [
      budgetValueModel.subcategoryId,
      budgetValueModel.budgeted,
      budgetValueModel.available,
      budgetValueModel.year,
      budgetValueModel.month
    ];

    int id = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add budgetvalue', sql, null, id, params);
    return id;
  }

  /// Adds the [moneyTransaction] of type [MoneyTransaction] to the database.
  ///
  /// The [MoneyTransaction] is specified using
  /// [moneyTransaction.id],
  /// [moneyTransaction.subcatID],
  /// [moneyTransaction.payeeID],
  /// [moneyTransaction.accountID],
  /// [moneyTransaction.amount],
  /// [moneyTransaction.memo] and
  ///[moneyTransaction.date].
  ///
  ///When the money transaction is made between accounts, no subcategory is selected, so
  ///that it doesn't affect the budget. Therefore, subcat.ID is set to Constants.UNASSIGNED_SUBCAT_ID and payee.id
  ///is set to the opposite of account.id.
  ///An example of this is the following :
  ///
  ///Instance of 'MoneyTransaction' {id: 10, subcatID: -1, payeeID: -3, accountID: 2, amount: 100.0, date: 2020-07-07 17:44:14.263746}
  ///
  ///where the transfer of money of 100.0€ was made from account 2 to account with id 3 (- payeeID).
  ///TODO : Clarify (in the UI and code) which account is receiving and which account is getting when making a transfer between accounts
  ///
  ///
  ///

  static Future<int> addMoneyTransaction(MoneyTransactionModel moneyTransactionModel) async {
    final sql = '''INSERT INTO ${DatabaseCreator.moneyTransactionTable}
      (${DatabaseCreator.SUBCAT_ID_OUTSIDE},
        ${DatabaseCreator.PAYEE_ID_OUTSIDE},
        ${DatabaseCreator.ACCOUNT_ID_OUTSIDE},
        ${DatabaseCreator.MONEYTRANSACTION_AMOUNT},
        ${DatabaseCreator.MONEYTRANSACTION_MEMO},
        ${DatabaseCreator.MONEYTRANSACTION_DATE})

      VALUES(?, ?, ?, ?, ?, ?);''';

    List<dynamic> params = [
      moneyTransactionModel.subcatID,
      moneyTransactionModel.payeeID,
      moneyTransactionModel.accountID,
      moneyTransactionModel.amount,
      moneyTransactionModel.memo,
      moneyTransactionModel.date.millisecondsSinceEpoch
    ];

    int id = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add moneyTransaction', sql, null, id, params);
    return id;
  }

  /// Adds the [Goal] to the database.
  /// The [GoalType] is specified using it's index in the enumeration
  static Future<int> addGoal(GoalModel goalModel) async {
    final sql = '''INSERT INTO ${DatabaseCreator.goalTable}
      (${DatabaseCreator.SUBCAT_ID_OUTSIDE},
      ${DatabaseCreator.GOAL_TYPE},
      ${DatabaseCreator.GOAL_AMOUNT},
      ${DatabaseCreator.GOAL_MONTH},
      ${DatabaseCreator.GOAL_YEAR}
      )
      VALUES(?, ?, ?, ?, ?);''';

    List<dynamic> params = [
      goalModel.correspondingSubcategoryId,
      goalModel.goalType.index,
      goalModel.amount,
      goalModel.month,
      goalModel.year,
    ];
    int id = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add goal', sql, null, id, params);
    return id;
  }

  /// Deletes the [category] of id [categoryId] from the database.
  static Future<void> deleteCategory(int categoryId) async {
    final sql = '''DELETE FROM ${DatabaseCreator.categoryTable}
      WHERE ${DatabaseCreator.CATEGORY_ID} == ?;''';

    List<dynamic> params = [categoryId];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete category', sql, null, result, params);
  }

  /// Deletes the [SubCategory] of id [subcategoryID] from the database.
  static Future<void> deleteSubcategory(int subcategoryID) async {
    final sql = '''DELETE FROM ${DatabaseCreator.subcategoryTable}
      WHERE ${DatabaseCreator.SUBCAT_ID} == ?;''';

    List<dynamic> params = [subcategoryID];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete subcategory', sql, null, result, params);
  }

  /// Deletes the [account] of id [account.id] from the database.
  static Future<void> deleteAccount(Account account) async {
    final sql = '''DELETE FROM ${DatabaseCreator.accountTable}
      WHERE ${DatabaseCreator.ACCOUNT_ID} == ?;''';

    List<dynamic> params = [account.id];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete account', sql, null, result, params);
  }

  /// Deletes the [payee] of id [payee.id] from the database.
  static Future<void> deletePayee(Payee payee) async {
    final sql = '''DELETE FROM ${DatabaseCreator.payeeTable}
      WHERE ${DatabaseCreator.PAYEE_ID} == ?;''';

    List<dynamic> params = [payee.id];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete payee', sql, null, result, params);
  }

  /// Deletes the [moneytransaction] of id [moneytransaction.id] from the database.
  static Future<void> deleteTransaction(int moneytransactionId) async {
    final sql = '''DELETE FROM ${DatabaseCreator.moneyTransactionTable}
      WHERE ${DatabaseCreator.MONEYTRANSACTION_ID} == ?;''';

    List<dynamic> params = [moneytransactionId];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete moneyTransaction', sql, null, result, params);
  }

  /// Deletes the [budgetValue] of id [budgetValue.id] from the database.
  static Future<void> deleteBudgetValue(int budgetValueId) async {
    final sql = '''DELETE FROM ${DatabaseCreator.budgetValueTable}
      WHERE ${DatabaseCreator.BUDGET_VALUE_ID} == ?;''';

    List<dynamic> params = [budgetValueId];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete budgetvalue', sql, null, result, params);
  }

  //TODO: Implements other SQL queries

  /// Update category with id [category.id] in the database.
  ///
  /// Fields that can be changed [DatabaseCreator.CATEGORY_NAME]
  static Future<void> updateCategory(MainCategory category) async {
    final sql = '''UPDATE ${DatabaseCreator.categoryTable}
                SET ${DatabaseCreator.CATEGORY_NAME} = ?
                WHERE ${DatabaseCreator.CATEGORY_ID} == ?
                ;''';

    List<dynamic> params = [category.name, category.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Update category', sql, null, result, params);
  }

  /// Update subcategory with id [subcategory.id] in the database.
  ///
  /// Fields that can be changed are [subcategory.name],
  /// [subcategory.budgeted] and [subcategory.available].
  static Future<void> updateSubcategory(SubCategory subcategory) async {
    final sql = '''UPDATE ${DatabaseCreator.subcategoryTable}
                    SET ${DatabaseCreator.SUBCAT_NAME} = ?
                    WHERE ${DatabaseCreator.SUBCAT_ID} == ?
                    ;''';

    List<dynamic> params = [subcategory.name, subcategory.id];

    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Update subcategory', sql, null, result, params);
  }

  /// Update account with id [account.id] in the database.
  ///
  /// Fields that can be changed are [account.name] and [account.id].
  static Future<void> updateAccount(Account account) async {
    final sql = '''UPDATE ${DatabaseCreator.accountTable}
                SET ${DatabaseCreator.ACCOUNT_NAME} = ?,
                ${DatabaseCreator.ACCOUNT_BALANCE} = ?
                WHERE ${DatabaseCreator.ACCOUNT_ID} == ?
                ;''';

    List<dynamic> params = [account.name, account.balance, account.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Update account', sql, null, result, params);
  }

  /// Update payee with id [payee.id] in the database.
  ///
  /// Fields that can be updated are [payee.name].
  static Future<void> updatePayee(Payee payee) async {
    final sql = '''UPDATE ${DatabaseCreator.payeeTable}
                SET ${DatabaseCreator.PAYEE_NAME} = ?
                WHERE ${DatabaseCreator.PAYEE_ID} == ?
                ;''';

    List<dynamic> params = [payee.name, payee.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Update payee', sql, null, result, params);
  }
  //TODO: Transaction update

  /// Update budgetValue with id [budgetValue.id] in the database.
  ///
  /// Fields that can be updated are [budgetValue.budgeted]
  /// and [budgetValue.available]
  static Future<void> updateBudgetValue(BudgetValue budgetValue) async {
    final sql = '''UPDATE ${DatabaseCreator.budgetValueTable}
                SET ${DatabaseCreator.BUDGET_VALUE_BUDGETED} = ?,
                ${DatabaseCreator.BUDGET_VALUE_AVAILABLE} = ?
                WHERE ${DatabaseCreator.BUDGET_VALUE_ID} == ?
                ;''';

    List<dynamic> params = [
      budgetValue.budgeted, //
      budgetValue.available,
      budgetValue.id
    ];

    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Update budgetValue', sql, null, result, params);
  }
}
