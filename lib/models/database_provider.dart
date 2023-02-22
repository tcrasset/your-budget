// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:uuid/uuid.dart';
import 'package:your_budget/domain/category/category.dart' as category;
import 'package:your_budget/domain/subcategory/subcategory.dart' as subcategory;
// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

//Global database variable so as not to handle concurrency issues
Database? db;

/// Class that is responsible for creating the database, filling up the default values
/// and assigning it to global variable [db].
class DatabaseProvider {
  /// Logs every action taken on the database to console.
  /// The method name [functionName] along with the raw sql query
  /// [sql] and the parameters used are logged.
  /// Furthermore, either the results [selectQueryResult] of a SELECT query or
  /// the results [insertAndUpdateQueryResult] of an INSERT query are returned.
  /// This depends on what action was taken on the database.
  static void databaseLog(
    String functionName,
    String sql, [
    List<Map<String, dynamic>>? selectQueryResult,
    int? insertAndUpdateQueryResult,
    List<dynamic>? params,
  ]) {
    debugPrint("Method called : $functionName");
    debugPrint("SQL: $sql");
    if (params != null) {
      debugPrint("Parameters : $params");
    } else {
      debugPrint("Parameters: NULL");
    }

    if (selectQueryResult != null) {
      debugPrint("SELECT result: $selectQueryResult");
    } else if (insertAndUpdateQueryResult != null) {
      debugPrint("INSERT result: $insertAndUpdateQueryResult");
    }
  }

  /// Returns the path of the database [dbName].
  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //Make sure the folder exists
    if (!await Directory(dirname(path)).exists()) {
      await Directory(dirname(path)).create(recursive: true);
    }

    return path;
  }

  /// Initiates the database and assigns it to the global variable [db]
  /// by calling [DatabaseCreator.onCreate()] with the path to the database
  /// and the version number.
  Future<Database?> open() async {
    final path = await getDatabasePath('budgetDB');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// Creates the database by creating the different tables
  /// that will populate it.
  Future<void> _onCreate(Database db, int version) async {
    await _createTables(db);
    await _createConstants(db);
    await _createBasicCategories(db);
    await _populatePayees(db);
    await _populateAccounts(db);
  }

  /// Creates the table of the database. These are [categoryTable], [subcategoryTable],
  /// [payeeTable], [accountTable], [moneyTransactionTable], [budgetValueTable], [constantsTable],
  /// and [goalTable].
  Future<void> _createTables(Database db) async {
    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.categoryTable} (
                        ${DatabaseConstants.CATEGORY_ID} TEXT PRIMARY KEY,
                        ${DatabaseConstants.CATEGORY_NAME} TEXT NOT NULL UNIQUE
                      );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.subcategoryTable} (
                        ${DatabaseConstants.SUBCAT_ID} TEXT PRIMARY KEY,
                        ${DatabaseConstants.CAT_ID_OUTSIDE} TEXT NOT NULL,
                        ${DatabaseConstants.SUBCAT_NAME} TEXT NOT NULL
                    );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.payeeTable} (
                        ${DatabaseConstants.PAYEE_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.PAYEE_NAME} TEXT NOT NULL UNIQUE
                      );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.accountTable} (
                        ${DatabaseConstants.ACCOUNT_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.ACCOUNT_NAME} TEXT NOT NULL UNIQUE,
                        ${DatabaseConstants.ACCOUNT_BALANCE} FLOAT NOT NULL
                      );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.moneyTransactionTable} (
                        ${DatabaseConstants.MONEYTRANSACTION_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.MONEYTRANSACTION_GIVER_ID} TEXT NOT NULL,
                        ${DatabaseConstants.MONEYTRANSACTION_RECEIVER_ID} TEXT NOT NULL,
                        ${DatabaseConstants.SUBCAT_ID_OUTSIDE} TEXT DEFAULT NULL,
                        ${DatabaseConstants.MONEYTRANSACTION_AMOUNT} FLOAT NOT NULL,
                        ${DatabaseConstants.MONEYTRANSACTION_MEMO} TEXT,
                        ${DatabaseConstants.MONEYTRANSACTION_DATE} INTEGER NOT NULL,
                        ${DatabaseConstants.MONEYTRANSACTION_TYPE} TEXT NOT NULL
                    );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.budgetValueTable} (
                        ${DatabaseConstants.BUDGET_VALUE_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.SUBCAT_ID_OUTSIDE} TEXT NOT NULL,
                        ${DatabaseConstants.BUDGET_VALUE_BUDGETED} FLOAT DEFAULT 0.00,
                        ${DatabaseConstants.BUDGET_VALUE_AVAILABLE} FLOAT DEFAULT 0.00,
                        ${DatabaseConstants.BUDGET_VALUE_YEAR} INTEGER NOT NULL,
                        ${DatabaseConstants.BUDGET_VALUE_MONTH} INTEGER NOT NULL,
                        FOREIGN KEY (${DatabaseConstants.SUBCAT_ID_OUTSIDE}) REFERENCES ${DatabaseConstants.categoryTable}(${DatabaseConstants.SUBCAT_ID})
                    );''');
    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.goalTable} (
                        ${DatabaseConstants.GOAL_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.SUBCAT_ID_OUTSIDE} TEXT NOT NULL,
                        ${DatabaseConstants.GOAL_TYPE} INTEGER NOT NULL,
                        ${DatabaseConstants.GOAL_AMOUNT} FLOAT NOT NULL,
                        ${DatabaseConstants.GOAL_YEAR} INTEGER,
                        ${DatabaseConstants.GOAL_MONTH} INTEGER,
                        FOREIGN KEY (${DatabaseConstants.SUBCAT_ID_OUTSIDE}) REFERENCES ${DatabaseConstants.subcategoryTable}(${DatabaseConstants.SUBCAT_ID})

                    );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.constantsTable} (
                        ${DatabaseConstants.CONSTANT_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.CONSTANT_NAME} TEXT,
                        ${DatabaseConstants.CONSTANT_VALUE} TEXT
                    );''');
  }

  /// Populates the tables of database [db] with the default categories, subcategories and
  /// their budgetValues.
  Future<void> _createBasicCategories(Database db) async {
    final String categoryId = await _populateCategories(db);
    final List<String> subcategoryIds = await _populateSubcategories(db, categoryId);
    await _populateBudgetValues(subcategoryIds, db);
  }

  Future<void> _populateBudgetValues(List<String> subcategoryIds, Database db) async {
    const String CREATE_BUDGETVALUE = '''
    INSERT INTO ${DatabaseConstants.budgetValueTable}
      (${DatabaseConstants.SUBCAT_ID_OUTSIDE},
      ${DatabaseConstants.BUDGET_VALUE_BUDGETED},
      ${DatabaseConstants.BUDGET_VALUE_AVAILABLE},
      ${DatabaseConstants.BUDGET_VALUE_YEAR},
      ${DatabaseConstants.BUDGET_VALUE_MONTH})
      VALUES(?, ?, ?, ?, ?);''';

    /// Insert [BudgetValues] corresponding to the subcategories into the data base
    /// for every month of the budget, from the current Date to [MAX_NB_MONTHS_AHEAD]
    /// months in the future.
    final DateTime startingDate = getDateFromMonthStart(DateTime.now());
    for (int monthDifference = 0;
        monthDifference <= Constants.MAX_NB_MONTHS_AHEAD;
        monthDifference++) {
      final DateTime newDate = Jiffy(startingDate).add(months: monthDifference).dateTime;
      for (final String subcatId in subcategoryIds) {
        await db.rawInsert(CREATE_BUDGETVALUE, [
          subcatId,
          0.00,
          0.00,
          newDate.year,
          newDate.month,
        ]);
      }
    }
  }

  Future<String> _populateCategories(Database db) async {
    const String CREATE_CATEGORY = '''
    INSERT INTO ${DatabaseConstants.categoryTable}
      (${DatabaseConstants.CATEGORY_ID},
      ${DatabaseConstants.CATEGORY_NAME})
      VALUES(?, ?);''';
    final id = const Uuid().v4();
    db.rawInsert(CREATE_CATEGORY, [id, "Essentials"]);
    db.rawInsert(CREATE_CATEGORY, [category.UNSELECTABLE_ID, category.UNSELECTABLE_NAME]);

    // We do not include category.UNSELECTABLE_ID as we do not want subcategories for this category
    return id;
  }

  Future<int> _populatePayees(Database db) async {
    const String CREATE_PAYEE = '''
    INSERT INTO ${DatabaseConstants.payeeTable}
      (${DatabaseConstants.PAYEE_NAME})
      VALUES(?);''';
    return db.rawInsert(CREATE_PAYEE, [DatabaseConstants.STARTING_BALANCE_PAYEE_NAME]);
  }

  Future<List<String>> _populateSubcategories(Database db, String categoryId) async {
    const String CREATE_SUBCATEGORY = '''
    INSERT INTO ${DatabaseConstants.subcategoryTable}
      (${DatabaseConstants.SUBCAT_ID},
        ${DatabaseConstants.CAT_ID_OUTSIDE},
      ${DatabaseConstants.SUBCAT_NAME})
      VALUES(?, ?, ?);''';

    final Map<String, String> idToNameMap = {
      const Uuid().v4(): DatabaseConstants.TO_BE_BUDGETED,
      const Uuid().v4(): "Rent",
      const Uuid().v4(): "Electricity",
      const Uuid().v4(): "Water",
      const Uuid().v4(): "Food",
      const Uuid().v4(): "Internet",
      const Uuid().v4(): "Phone"
    };

    idToNameMap.forEach((id, name) async {
      await db.rawInsert(CREATE_SUBCATEGORY, [id, categoryId, name]);
    });

    await db.rawInsert(CREATE_SUBCATEGORY, [
      subcategory.UNSELECTABLE_ID,
      category.UNSELECTABLE_ID,
      subcategory.UNSELECTABLE_NAME,
    ]);

    // We do not include subcategory.UNSELECTABLE_ID as we do not want budgetvalues for this subcat
    return idToNameMap.keys.toList();
  }

  Future<void> _createConstants(Database db) async {
    const String CREATE_CONSTANT = '''
    INSERT INTO ${DatabaseConstants.constantsTable}
      (${DatabaseConstants.CONSTANT_NAME}, ${DatabaseConstants.CONSTANT_VALUE})
      VALUES(?, ?);''';

    /// Create the starting budget date based on the first time the user uses the app
    final String startingDateMillisecondsSinceEpoch =
        getDateFromMonthStart(DateTime.now()).millisecondsSinceEpoch.toString();
    db.rawInsert(
      CREATE_CONSTANT,
      [DatabaseConstants.STARTING_BUDGET_DATE, startingDateMillisecondsSinceEpoch],
    );

    /// Create the maximum budget date based on current date + Constants.MAX_NB_MONTHS_AHEAD
    final String maxBudgetDateMillisecondsSinceEpoch =
        getMaxBudgetDate().millisecondsSinceEpoch.toString();
    db.rawInsert(
      CREATE_CONSTANT,
      [DatabaseConstants.MAX_BUDGET_DATE, maxBudgetDateMillisecondsSinceEpoch],
    );

    ///Save account most recently used.
    db.rawInsert(CREATE_CONSTANT, [DatabaseConstants.MOST_RECENT_ACCOUNT, "0"]);
  }

  Future<void> _populateAccounts(Database db) async {
    const String CREATE_ACCOUNT = '''
    INSERT INTO ${DatabaseConstants.accountTable}
      (${DatabaseConstants.ACCOUNT_NAME}, ${DatabaseConstants.ACCOUNT_BALANCE})
      VALUES(?, ?);''';
    await db.rawInsert(CREATE_ACCOUNT, [DatabaseConstants.TO_BE_BUDGETED, 0.00]);
  }
}
