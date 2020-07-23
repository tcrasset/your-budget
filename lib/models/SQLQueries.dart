import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/database_creator.dart';
import 'package:mybudget/models/entries.dart';

class SQLQueryClass {
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
    final sql = '''SELECT * FROM ${DatabaseCreator.moneyTransactionTable};''';
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

  static Future<List<SubCategory>> getSubCategoriesJoined(int year, int month) async {
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
    return MoneyTransaction.fromJson(data[0]);
  }

  /// Adds the [category] of type [MainCategory] to the database.
  ///
  /// The [MainCategory] is specified using [category.id] and [category.name]
  static Future<void> addCategory(MainCategory category) async {
    final sql = '''INSERT INTO ${DatabaseCreator.categoryTable}
      (${DatabaseCreator.CATEGORY_ID},${DatabaseCreator.CATEGORY_NAME})
      VALUES(?, ?);''';

    List<dynamic> params = [category.id, category.name];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add category', sql, null, result, params);
  }

  /// Adds the [subcategory] of type [SubCategory] to the database.
  ///
  /// The [SubCategory] is specified using [subcategory.id],
  /// [subcategory.parent_id], and [subcategory.name]
  static Future<void> addSubcategory(SubCategory subcategory) async {
    final sql = '''INSERT INTO ${DatabaseCreator.subcategoryTable}
      (${DatabaseCreator.SUBCAT_ID},
      ${DatabaseCreator.CAT_ID_OUTSIDE},
      ${DatabaseCreator.SUBCAT_NAME})
      VALUES(?, ?, ?);''';

    List<dynamic> params = [
      subcategory.id,
      subcategory.parentId,
      subcategory.name,
    ];

    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add subcategory', sql, null, result, params);
  }

  /// Adds the [payee] of type [Payee] to the database.
  ///
  /// The [Payee] is specified using [payee.id] and [payee.name]
  static Future<void> addPayee(Payee payee) async {
    final sql = '''INSERT INTO ${DatabaseCreator.payeeTable}
      (${DatabaseCreator.PAYEE_ID},${DatabaseCreator.PAYEE_NAME})
      VALUES(?, ?);''';

    List<dynamic> params = [payee.id, payee.name];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add payee', sql, null, result, params);
  }

  /// Adds the [account] of type [Account] to the database.
  ///
  /// The [Account] is specified using [account.id] and [account.name]
  static Future<void> addAccount(Account account) async {
    final sql = '''INSERT INTO ${DatabaseCreator.accountTable}
      (${DatabaseCreator.ACCOUNT_ID},
      ${DatabaseCreator.ACCOUNT_NAME},
      ${DatabaseCreator.ACCOUNT_BALANCE}
      )
      VALUES(?, ?, ?);''';

    List<dynamic> params = [account.id, account.name, account.balance];
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add account', sql, null, result, params);
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
  ///that it doesn't affect the budget. Therefore, subcat.ID is set to '-1' and payee.id
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

  static Future<void> addMoneyTransaction(MoneyTransaction moneyTransaction) async {
    final sql = '''INSERT INTO ${DatabaseCreator.moneyTransactionTable}
      (${DatabaseCreator.MONEYTRANSACTION_ID},
        ${DatabaseCreator.SUBCAT_ID_OUTSIDE},
        ${DatabaseCreator.PAYEE_ID_OUTSIDE},
        ${DatabaseCreator.ACCOUNT_ID_OUTSIDE},
        ${DatabaseCreator.MONEYTRANSACTION_AMOUNT},
        ${DatabaseCreator.MONEYTRANSACTION_MEMO},
        ${DatabaseCreator.MONEYTRANSACTION_DATE})
      VALUES(?, ?, ?, ?, ?, ?, ?);''';

    List<dynamic> params = [
      moneyTransaction.id,
      moneyTransaction.subcatID,
      moneyTransaction.payeeID,
      moneyTransaction.accountID,
      moneyTransaction.amount,
      moneyTransaction.memo,
      moneyTransaction.date.millisecondsSinceEpoch
    ];

    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add moneyTransaction', sql, null, result, params);
  }

  /// Adds the [budgetvalue] of type [BudgetValue] to the database.
  static Future<void> addBudgetValue(BudgetValue budgetvalue) async {
    final sql = '''INSERT INTO ${DatabaseCreator.budgetValueTable}
      (${DatabaseCreator.BUDGET_VALUE_ID},
      ${DatabaseCreator.SUBCAT_ID_OUTSIDE},
      ${DatabaseCreator.BUDGET_VALUE_BUDGETED},
      ${DatabaseCreator.BUDGET_VALUE_AVAILABLE},
      ${DatabaseCreator.BUDGET_VALUE_YEAR},
      ${DatabaseCreator.BUDGET_VALUE_MONTH})
      VALUES(?, ?, ?, ?, ?, ?);''';

    List<dynamic> params = [
      budgetvalue.id,
      budgetvalue.subcategoryId,
      budgetvalue.budgeted,
      budgetvalue.available,
      budgetvalue.year,
      budgetvalue.month
    ];

    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add budgetvalue', sql, null, result, params);
  }

  /// Deletes the [category] of id [category.id] from the database.
  static Future<void> deleteCategory(MainCategory category) async {
    final sql = '''DELETE FROM ${DatabaseCreator.categoryTable}
      WHERE ${DatabaseCreator.CATEGORY_ID} == ?;''';

    List<dynamic> params = [category.id];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete category', sql, null, result, params);
  }

  /// Deletes the [subcategory] of id [subcategory.id] from the database.
  static Future<void> deleteSubcategory(SubCategory subcategory) async {
    final sql = '''DELETE FROM ${DatabaseCreator.subcategoryTable}
      WHERE ${DatabaseCreator.SUBCAT_ID} == ?;''';

    List<dynamic> params = [subcategory.id];
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
  static Future<void> deleteTransaction(MoneyTransaction moneytransaction) async {
    final sql = '''DELETE FROM ${DatabaseCreator.moneyTransactionTable}
      WHERE ${DatabaseCreator.MONEYTRANSACTION_ID} == ?;''';

    List<dynamic> params = [moneytransaction.id];
    final result = await db.rawDelete(sql, params);
    DatabaseCreator.databaseLog('Delete moneyTransaction', sql, null, result, params);
  }

  /// Deletes the [budgetValue] of id [budgetValue.id] from the database.
  static Future<void> deleteBudgetValue(BudgetValue budgetValue) async {
    final sql = '''DELETE FROM ${DatabaseCreator.budgetValueTable}
      WHERE ${DatabaseCreator.BUDGET_VALUE_ID} == ?;''';

    List<dynamic> params = [budgetValue.id];
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

  /// Returns the number of categories in the database.
  static Future<int> categoryCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.categoryTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of subcategories in the database.
  static Future<int> subcategoryCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.subcategoryTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of accounts in the database.
  static Future<int> accountCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.accountTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of payees in the database.
  static Future<int> payeeCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.payeeTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of transactions in the database.
  static Future<int> moneyTransactionCount() async {
    final data =
        await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.moneyTransactionTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of budgetVvalues in the database.
  static Future<int> budgetValuesCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.budgetValueTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }
}
