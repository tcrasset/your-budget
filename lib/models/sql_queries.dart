// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'account.dart';
import 'categories.dart';
import 'categories_model.dart';
import 'constants.dart';
import 'database_provider.dart';
import 'goal.dart';
import 'goal_model.dart';
import 'money_transaction.dart';
import 'payee.dart';
import 'queries.dart';

class SQLQueryClass implements Queries {
  final Database? database;

  SQLQueryClass({required this.database});

  @override
  Future<void> debugDatabase() async {
    (await database!.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
      debugPrint(row.values.toString());
    });
  }

  /// Returns the list of all [MainCategory] in the database.
  @override
  Future<List<MainCategory>> getCategories() async {
    final sql = '''SELECT * FROM ${DatabaseConstants.categoryTable}''';
    final data = await database!.rawQuery(sql);

    final List<MainCategory> categories = [];
    for (final node in data) {
      final category = MainCategory.fromJson(node);
      categories.add(category);
    }

    return categories;
  }

  /// Returns the list of all [SubCategory] in the database.
  @override
  Future<List<SubCategory>> getSubCategories() async {
    final sql = '''SELECT * FROM ${DatabaseConstants.subcategoryTable};''';
    final data = await database!.rawQuery(sql);

    final List<SubCategory> subcategories = [];
    for (final node in data) {
      final subcategory = SubCategory.fromJson(node);
      subcategories.add(subcategory);
    }

    return subcategories;
  }

  /// Returns the list of all [Account] in the database.
  @override
  Future<List<Account>> getAccounts() async {
    final sql = '''SELECT * FROM ${DatabaseConstants.accountTable};''';
    final data = await database!.rawQuery(sql);

    final List<Account> accounts = [];
    for (final node in data) {
      final account = Account.fromJson(node);
      accounts.add(account);
    }

    return accounts;
  }

  /// Returns the list of all [Payee] in the database.
  @override
  Future<List<Payee>> getPayees() async {
    final sql = '''SELECT * FROM ${DatabaseConstants.payeeTable};''';
    final data = await database!.rawQuery(sql);

    final List<Payee> payees = [];
    for (final node in data) {
      final payee = Payee.fromJson(node);
      payees.add(payee);
    }

    return payees;
  }

  /// Returns the list of all [MoneyTransaction] in the database.
  @override
  Future<List<MoneyTransaction>> getMoneyTransactions() async {
    final sql = '''SELECT * FROM ${DatabaseConstants.moneyTransactionTable}
    ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;''';
    final data = await database!.rawQuery(sql);

    final List<MoneyTransaction> transactions = [];
    for (final node in data) {
      final transaction = MoneyTransaction.fromJson(node);
      transactions.add(transaction);
    }
    return transactions;
  }

  /// Returns the list of all [BudgetValue] in the database.
  @override
  Future<List<BudgetValue>> getBudgetValues() async {
    final sql = '''SELECT * FROM ${DatabaseConstants.budgetValueTable};''';
    final data = await database!.rawQuery(sql);

    final List<BudgetValue> budgetvalues = [];
    for (final node in data) {
      final budgetvalue = BudgetValue.fromJson(node);
      budgetvalues.add(budgetvalue);
    }

    return budgetvalues;
  }

  @override
  Future<List<Goal>> getGoals() async {
    final sql = '''SELECT * FROM ${DatabaseConstants.goalTable};''';
    final data = await database!.rawQuery(sql);

    final List<Goal> goals = [];
    for (final node in data) {
      final goal = Goal.fromJson(node);
      goals.add(goal);
    }

    return goals;
  }

  @override
  Future<List<SubCategory>> getSubCategoriesJoined(int year, int month) async {
    // (await db.query('sqlite_master', columns: ['type', 'name'])).forEach((row) {
    //   print(row.values);
    // });

    final sql =
        '''SELECT ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_ID} as id,
        ${DatabaseConstants.CAT_ID_OUTSIDE},
        ${DatabaseConstants.SUBCAT_NAME},
        ${DatabaseConstants.budgetValueTable}.${DatabaseConstants.BUDGET_VALUE_BUDGETED},
        ${DatabaseConstants.budgetValueTable}.${DatabaseConstants.BUDGET_VALUE_AVAILABLE}

        FROM
          ${DatabaseConstants.budgetValueTable}
          LEFT JOIN ${DatabaseConstants.subcategoryTable}
          ON
          ${DatabaseConstants.budgetValueTable}.${DatabaseConstants.SUBCAT_ID_OUTSIDE} = ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_ID}
        WHERE
          ${DatabaseConstants.BUDGET_VALUE_YEAR} == $year
          and ${DatabaseConstants.BUDGET_VALUE_MONTH} == $month''';

    final data = await database!.rawQuery(sql);

    List<SubCategory> subcategories = [];
    for (final node in data) {
      final subcategory = SubCategory.fromJson(node);
      subcategories.add(subcategory);
    }

    return subcategories;
  }

  @override
  Future<MoneyTransaction> getFirstTransactionOfAccount(int accountId) async {
    final String sql = '''SELECT * FROM ${DatabaseConstants.moneyTransactionTable}
                          WHERE ${DatabaseConstants.ACCOUNT_ID_OUTSIDE} == $accountId
                          ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} ASC LIMIT 1;''';
    final data = await database!.rawQuery(sql);

    if (data.isNotEmpty) {
      return MoneyTransaction.fromJson(data[0]);
    } else {
      throw Exception();
    }
  }

  /// Adds the [category] of type [MainCategory] to the database.
  ///
  /// The [MainCategory] is specified using [category.id] and [category.name]
  @override
  Future<int> addCategory(MainCategoryModel categoryModel) async {
    final sql = '''INSERT INTO ${DatabaseConstants.categoryTable}
      (${DatabaseConstants.CATEGORY_NAME})
      VALUES(?);''';

    final List<dynamic> params = [categoryModel.name];
    final int id = await database!.rawInsert(sql, params);
    DatabaseProvider.databaseLog('Add category', sql, null, id, params);
    return id;
  }

  /// Adds the [subcategory] of type [SubCategory] to the database.
  ///
  /// The [SubCategory] is specified using [subcategory.id],
  /// [subcategory.parent_id], and [subcategory.name]
  @override
  Future<int> addSubcategory(SubCategoryModel subcategoryModel) async {
    final sql = '''INSERT INTO ${DatabaseConstants.subcategoryTable}
      (${DatabaseConstants.CAT_ID_OUTSIDE},
      ${DatabaseConstants.SUBCAT_NAME})
      VALUES(?, ?);''';

    List<dynamic> params = [
      subcategoryModel.parentId,
      subcategoryModel.name,
    ];

    final int id = await database!.rawInsert(sql, params);
    DatabaseProvider.databaseLog('Add subcategory', sql, null, id, params);
    return id;
  }

  /// Adds the [payee] of type [Payee] to the database.
  ///
  /// The [Payee] is specified using [payee.id] and [payee.name]
  @override
  Future<int> addPayee(PayeeModel payeeModel) async {
    final sql = '''INSERT INTO ${DatabaseConstants.payeeTable}
      (${DatabaseConstants.PAYEE_NAME})
      VALUES(?);''';

    final List<dynamic> params = [
      payeeModel.name,
    ];
    final int id = await database!.rawInsert(sql, params);
    DatabaseProvider.databaseLog('Add payee', sql, null, id, params);
    return id;
  }

  /// Adds the [account] of type [Account] to the database.
  ///
  /// The [Account] is specified using [account.id] and [account.name]
  @override
  Future<int> addAccount(AccountModel accountModel) async {
    final sql = '''INSERT INTO ${DatabaseConstants.accountTable}
      (${DatabaseConstants.ACCOUNT_NAME},
      ${DatabaseConstants.ACCOUNT_BALANCE}
      )
      VALUES(?, ?);''';

    final List<dynamic> params = [
      accountModel.name,
      accountModel.balance,
    ];
    final int id = await database!.rawInsert(sql, params);
    DatabaseProvider.databaseLog('Add account', sql, null, id, params);
    return id;
  }

  /// Adds the [budgetvalue] of type [BudgetValue] to the database.
  @override
  Future<int> addBudgetValue(BudgetValueModel budgetValueModel) async {
    final sql = '''INSERT INTO ${DatabaseConstants.budgetValueTable}
      (${DatabaseConstants.SUBCAT_ID_OUTSIDE},
      ${DatabaseConstants.BUDGET_VALUE_BUDGETED},
      ${DatabaseConstants.BUDGET_VALUE_AVAILABLE},
      ${DatabaseConstants.BUDGET_VALUE_YEAR},
      ${DatabaseConstants.BUDGET_VALUE_MONTH})
      VALUES(?, ?, ?, ?, ?);''';

    final List<dynamic> params = [
      budgetValueModel.subcategoryId,
      budgetValueModel.budgeted,
      budgetValueModel.available,
      budgetValueModel.year,
      budgetValueModel.month
    ];

    final int id = await database!.rawInsert(sql, params);
    DatabaseProvider.databaseLog('Add budgetvalue', sql, null, id, params);
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

  @override
  Future<int> addMoneyTransaction(MoneyTransactionModel moneyTransactionModel) async {
    final sql = '''INSERT INTO ${DatabaseConstants.moneyTransactionTable}
      (${DatabaseConstants.SUBCAT_ID_OUTSIDE},
        ${DatabaseConstants.PAYEE_ID_OUTSIDE},
        ${DatabaseConstants.ACCOUNT_ID_OUTSIDE},
        ${DatabaseConstants.MONEYTRANSACTION_AMOUNT},
        ${DatabaseConstants.MONEYTRANSACTION_MEMO},
        ${DatabaseConstants.MONEYTRANSACTION_DATE})

      VALUES(?, ?, ?, ?, ?, ?);''';

    final List<dynamic> params = [
      moneyTransactionModel.subcatID,
      moneyTransactionModel.payeeID,
      moneyTransactionModel.accountID,
      moneyTransactionModel.amount,
      moneyTransactionModel.memo,
      moneyTransactionModel.date!.millisecondsSinceEpoch
    ];

    final int id = await database!.rawInsert(sql, params);
    DatabaseProvider.databaseLog('Add moneyTransaction', sql, null, id, params);
    return id;
  }

  /// Adds the [Goal] to the database.
  /// The [GoalType] is specified using it's index in the enumeration
  @override
  Future<int> addGoal(GoalModel goalModel) async {
    final sql = '''INSERT INTO ${DatabaseConstants.goalTable}
      (${DatabaseConstants.SUBCAT_ID_OUTSIDE},
      ${DatabaseConstants.GOAL_TYPE},
      ${DatabaseConstants.GOAL_AMOUNT},
      ${DatabaseConstants.GOAL_MONTH},
      ${DatabaseConstants.GOAL_YEAR}
      )
      VALUES(?, ?, ?, ?, ?);''';

    final List<dynamic> params = [
      goalModel.correspondingSubcategoryId,
      goalModel.goalType.index,
      goalModel.amount,
      goalModel.month,
      goalModel.year,
    ];
    final int id = await database!.rawInsert(sql, params);
    DatabaseProvider.databaseLog('Add goal', sql, null, id, params);
    return id;
  }

  /// Deletes the [category] of id [categoryId] from the database.
  @override
  Future<void> deleteCategory(int? categoryId) async {
    final sql = '''DELETE FROM ${DatabaseConstants.categoryTable}
      WHERE ${DatabaseConstants.CATEGORY_ID} == ?;''';

    final List<dynamic> params = [categoryId];
    final result = await database!.rawDelete(sql, params);
    DatabaseProvider.databaseLog('Delete category', sql, null, result, params);
  }

  /// Deletes the [SubCategory] of id [subcategoryID] from the database.
  @override
  Future<void> deleteSubcategory(int? subcategoryID) async {
    final sql = '''DELETE FROM ${DatabaseConstants.subcategoryTable}
      WHERE ${DatabaseConstants.SUBCAT_ID} == ?;''';

    final List<dynamic> params = [subcategoryID];
    final result = await database!.rawDelete(sql, params);
    DatabaseProvider.databaseLog('Delete subcategory', sql, null, result, params);
  }

  /// Deletes the [account] of id [account.id] from the database.
  @override
  Future<void> deleteAccount(Account account) async {
    final sql = '''DELETE FROM ${DatabaseConstants.accountTable}
      WHERE ${DatabaseConstants.ACCOUNT_ID} == ?;''';

    final List<dynamic> params = [account.id];
    final result = await database!.rawDelete(sql, params);
    DatabaseProvider.databaseLog('Delete account', sql, null, result, params);
  }

  /// Deletes the [payee] of id [payee.id] from the database.
  @override
  Future<void> deletePayee(Payee payee) async {
    final sql = '''DELETE FROM ${DatabaseConstants.payeeTable}
      WHERE ${DatabaseConstants.PAYEE_ID} == ?;''';

    final List<dynamic> params = [payee.id];
    final result = await database!.rawDelete(sql, params);
    DatabaseProvider.databaseLog('Delete payee', sql, null, result, params);
  }

  /// Deletes the [moneytransaction] of id [moneytransaction.id] from the database.
  @override
  Future<void> deleteTransaction(int? moneytransactionId) async {
    final sql = '''DELETE FROM ${DatabaseConstants.moneyTransactionTable}
      WHERE ${DatabaseConstants.MONEYTRANSACTION_ID} == ?;''';

    final List<dynamic> params = [moneytransactionId];
    final result = await database!.rawDelete(sql, params);
    DatabaseProvider.databaseLog('Delete moneyTransaction', sql, null, result, params);
  }

  /// Deletes the [budgetValue] of id [budgetValue.id] from the database.
  @override
  Future<void> deleteBudgetValue(int? budgetValueId) async {
    final sql = '''DELETE FROM ${DatabaseConstants.budgetValueTable}
      WHERE ${DatabaseConstants.BUDGET_VALUE_ID} == ?;''';

    final List<dynamic> params = [budgetValueId];
    final result = await database!.rawDelete(sql, params);
    DatabaseProvider.databaseLog('Delete budgetvalue', sql, null, result, params);
  }

  //TODO: Implements other SQL queries

  /// Update category with id [category.id] in the database.
  ///
  /// Fields that can be changed [DatabaseConstants.CATEGORY_NAME]
  @override
  Future<void> updateCategory(MainCategory category) async {
    final sql = '''UPDATE ${DatabaseConstants.categoryTable}
                SET ${DatabaseConstants.CATEGORY_NAME} = ?
                WHERE ${DatabaseConstants.CATEGORY_ID} == ?
                ;''';

    final List<dynamic> params = [category.name, category.id];
    final result = await database!.rawUpdate(sql, params);
    DatabaseProvider.databaseLog('Update category', sql, null, result, params);
  }

  /// Update subcategory name of [subcategory.id] in the database.
  @override
  Future<void> updateSubcategoryName(int? id, String newName) async {
    final sql = '''UPDATE ${DatabaseConstants.subcategoryTable}
                    SET ${DatabaseConstants.SUBCAT_NAME} = ?
                    WHERE ${DatabaseConstants.SUBCAT_ID} == ?
                    ;''';

    final List<dynamic> params = [newName, id];
    final result = await database!.rawUpdate(sql, params);
    DatabaseProvider.databaseLog('Update subcategory name', sql, null, result, params);
  }

  /// Update account with id [account.id] in the database.
  ///
  /// Fields that can be changed are [account.name] and [account.id].
  @override
  Future<void> updateAccount(Account account) async {
    final sql = '''UPDATE ${DatabaseConstants.accountTable}
                SET ${DatabaseConstants.ACCOUNT_NAME} = ?,
                ${DatabaseConstants.ACCOUNT_BALANCE} = ?
                WHERE ${DatabaseConstants.ACCOUNT_ID} == ?
                ;''';

    final List<dynamic> params = [account.name, account.balance, account.id];
    final result = await database!.rawUpdate(sql, params);
    DatabaseProvider.databaseLog('Update account', sql, null, result, params);
  }

  /// Update payee with id [payee.id] in the database.
  ///
  /// Fields that can be updated are [payee.name].
  @override
  Future<void> updatePayee(Payee payee) async {
    final sql = '''UPDATE ${DatabaseConstants.payeeTable}
                SET ${DatabaseConstants.PAYEE_NAME} = ?
                WHERE ${DatabaseConstants.PAYEE_ID} == ?
                ;''';

    List<dynamic> params = [payee.name, payee.id];
    final result = await database!.rawUpdate(sql, params);
    DatabaseProvider.databaseLog('Update payee', sql, null, result, params);
  }
  //TODO: Transaction update

  /// Update budgetValue with id [budgetValue.id] in the database.
  ///
  /// Fields that can be updated are [budgetValue.budgeted]
  /// and [budgetValue.available]
  @override
  Future<void> updateBudgetValue(BudgetValue? budgetValue) async {
    final sql = '''UPDATE ${DatabaseConstants.budgetValueTable}
                SET ${DatabaseConstants.BUDGET_VALUE_BUDGETED} = ?,
                ${DatabaseConstants.BUDGET_VALUE_AVAILABLE} = ?
                WHERE ${DatabaseConstants.BUDGET_VALUE_ID} == ?
                ;''';

    List<dynamic> params = [
      budgetValue!.budgeted, //
      budgetValue.available,
      budgetValue.id
    ];

    final result = await database!.rawUpdate(sql, params);
    DatabaseProvider.databaseLog('Update budgetValue', sql, null, result, params);
  }

  @override
  Future<DateTime> getStartingBudgetDateConstant() async {
    final sql =
        '''SELECT ${DatabaseConstants.CONSTANT_VALUE} FROM ${DatabaseConstants.constantsTable}
      WHERE ${DatabaseConstants.CONSTANT_NAME} ==  '${DatabaseConstants.STARTING_BUDGET_DATE}';''';

    final data = await database!.rawQuery(sql);
    int startingBudgetDateMillisecondsSinceEpoch = int.parse(data[0]['value'].toString());
    return DateTime.fromMillisecondsSinceEpoch(startingBudgetDateMillisecondsSinceEpoch);
  }

  @override
  Future<DateTime> getMaxBudgetDateConstant() async {
    final sql =
        '''SELECT ${DatabaseConstants.CONSTANT_VALUE} FROM ${DatabaseConstants.constantsTable}
      WHERE ${DatabaseConstants.CONSTANT_NAME} ==  '${DatabaseConstants.MAX_BUDGET_DATE}';''';

    final data = await database!.rawQuery(sql);
    final int maxBudgetDateMillisecondsSinceEpoch = int.parse(data[0]['value'].toString());
    return DateTime.fromMillisecondsSinceEpoch(maxBudgetDateMillisecondsSinceEpoch);
  }

  @override
  Future<void> setMaxBudgetDateConstant(DateTime newMaxBudgetDate) async {
    final sql = '''UPDATE ${DatabaseConstants.constantsTable}
                SET ${DatabaseConstants.CONSTANT_VALUE} = ?
                WHERE ${DatabaseConstants.CONSTANT_NAME} == '${DatabaseConstants.MAX_BUDGET_DATE}'
                ;''';

    final List<dynamic> params = [newMaxBudgetDate.millisecondsSinceEpoch];
    final result = await database!.rawUpdate(sql, params);
    DatabaseProvider.databaseLog('Update maxBudgetDate', sql, null, result, params);
  }

  @override
  Future<void> updateMostRecentAccountUsed(int? accountId) async {
    // TODO: implement setMostRecentAccountUsed

    final sql = '''UPDATE ${DatabaseConstants.constantsTable}
                SET ${DatabaseConstants.CONSTANT_VALUE} = ?
                WHERE ${DatabaseConstants.CONSTANT_NAME} == '${DatabaseConstants.MOST_RECENT_ACCOUNT}'
                ;''';

    final List<dynamic> params = [accountId.toString()];
    final result = await database!.rawUpdate(sql, params);
    DatabaseProvider.databaseLog('Update most recent account used', sql, null, result, params);
  }

  @override
  Future<int> getMostRecentAccountUsed() async {
    final sql =
        '''SELECT ${DatabaseConstants.CONSTANT_VALUE} FROM ${DatabaseConstants.constantsTable}
      WHERE ${DatabaseConstants.CONSTANT_NAME} ==  '${DatabaseConstants.MOST_RECENT_ACCOUNT}';''';

    final data = await database!.rawQuery(sql);
    final int accountId = int.parse(data[0]['value'].toString());
    return accountId;
  }
}
