// Dart imports:
import 'dart:async';
import 'dart:io';

// Package imports:
import 'package:jiffy/jiffy.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';

//Global database variable so as not to handle concurrency issues
Database db;

/// Class that is responsible for creating the database, filling up the default values
/// and assigning it to global variable [db].
class DatabaseProvider {
  /// Logs every action taken on the database to console.
  /// The method name [functionName] along with the raw sql query
  /// [sql] and the parameters used are logged.
  /// Furthermore, either the results [selectQueryResult] of a SELECT query or
  /// the results [insertAndUpdateQueryResult] of an INSERT query are returned.
  /// This depends on what action was taken on the database.
  static void databaseLog(String functionName, String sql,
      [List<Map<String, dynamic>> selectQueryResult,
      int insertAndUpdateQueryResult,
      List<dynamic> params]) {
    print("Method called : $functionName");
    print("SQL: $sql");
    if (params != null) {
      print("Paramaters : $params");
    } else
      print("Parameters: NULL");

    if (selectQueryResult != null) {
      print("SELECT result: $selectQueryResult");
    } else if (insertAndUpdateQueryResult != null) {
      print("INSERT result: $insertAndUpdateQueryResult");
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
  Future<Database> open() async {
    final path = await getDatabasePath('budgetDB');
    db = await openDatabase(
      path,
      version: 2,
      onCreate: _onCreate,
      onUpgrade: _onUpgrade,
    );

    return db;
  }

  /// Creates the database by creating the different tables
  /// that will populate it.
  Future<void> _onCreate(Database db, int version) async {
    await _createTables(db);
    await _createConstants(db);
    await _createBasicCategories(db);
  }

  /// Creates the table of the database. These are [categoryTable], [subcategoryTable],
  /// [payeeTable], [accountTable], [moneyTransactionTable], [budgetValueTable], [constantsTable],
  /// and [goalTable].
  Future<void> _createTables(Database db) async {
    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.categoryTable} (
                        ${DatabaseConstants.CATEGORY_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.CATEGORY_NAME} TEXT NOT NULL UNIQUE
                      );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.subcategoryTable} (
                        ${DatabaseConstants.SUBCAT_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.CAT_ID_OUTSIDE} INTEGER NOT NULL,
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
                        ${DatabaseConstants.SUBCAT_ID_OUTSIDE} INTEGER NOT NULL,
                        ${DatabaseConstants.PAYEE_ID_OUTSIDE} INTEGER NOT NULL,
                        ${DatabaseConstants.ACCOUNT_ID_OUTSIDE} INTEGER NOT NULL,
                        ${DatabaseConstants.MONEYTRANSACTION_AMOUNT} FLOAT NOT NULL,
                        ${DatabaseConstants.MONEYTRANSACTION_MEMO} TEXT,
                        ${DatabaseConstants.MONEYTRANSACTION_DATE} INTEGER NOT NULL,
                        FOREIGN KEY (${DatabaseConstants.SUBCAT_ID_OUTSIDE}) REFERENCES ${DatabaseConstants.subcategoryTable}(${DatabaseConstants.SUBCAT_ID}),
                        FOREIGN KEY (${DatabaseConstants.PAYEE_ID_OUTSIDE}) REFERENCES ${DatabaseConstants.payeeTable}(${DatabaseConstants.PAYEE_ID}),
                        FOREIGN KEY (${DatabaseConstants.ACCOUNT_ID_OUTSIDE}) REFERENCES ${DatabaseConstants.accountTable}(${DatabaseConstants.ACCOUNT_ID})
                    );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.budgetValueTable} (
                        ${DatabaseConstants.BUDGET_VALUE_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.SUBCAT_ID_OUTSIDE} INTEGER NOT NULL,
                        ${DatabaseConstants.BUDGET_VALUE_BUDGETED} FLOAT DEFAULT 0.00,
                        ${DatabaseConstants.BUDGET_VALUE_AVAILABLE} FLOAT DEFAULT 0.00,
                        ${DatabaseConstants.BUDGET_VALUE_YEAR} INTEGER NOT NULL,
                        ${DatabaseConstants.BUDGET_VALUE_MONTH} INTEGER NOT NULL,
                        FOREIGN KEY (${DatabaseConstants.SUBCAT_ID_OUTSIDE}) REFERENCES ${DatabaseConstants.categoryTable}(${DatabaseConstants.SUBCAT_ID})
                    );''');
    await db.execute('''
                      CREATE TABLE IF NOT EXISTS ${DatabaseConstants.goalTable} (
                        ${DatabaseConstants.GOAL_ID} INTEGER PRIMARY KEY AUTOINCREMENT,
                        ${DatabaseConstants.SUBCAT_ID_OUTSIDE} INTEGER NOT NULL,
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
    const String CREATE_CATEGORY =
        '''INSERT INTO ${DatabaseConstants.categoryTable}
      (${DatabaseConstants.CATEGORY_NAME})
      VALUES(?);''';

    const String CREATE_SUBCATEGORY =
        '''INSERT INTO ${DatabaseConstants.subcategoryTable}
      (${DatabaseConstants.CAT_ID_OUTSIDE},
      ${DatabaseConstants.SUBCAT_NAME})
      VALUES(?, ?);''';

    const String CREATE_BUDGETVALUE =
        '''INSERT INTO ${DatabaseConstants.budgetValueTable}
      (${DatabaseConstants.SUBCAT_ID_OUTSIDE},
      ${DatabaseConstants.BUDGET_VALUE_BUDGETED},
      ${DatabaseConstants.BUDGET_VALUE_AVAILABLE},
      ${DatabaseConstants.BUDGET_VALUE_YEAR},
      ${DatabaseConstants.BUDGET_VALUE_MONTH})
      VALUES(?, ?, ?, ?, ?);''';

    int categoryId = await db.rawInsert(CREATE_CATEGORY, ["Essentials"]);

    List<String> subcategoryNames = [
      "Rent",
      "Electricity",
      "Water",
      "Food",
      "Internet",
      "Phone"
    ];
    List<int> subcategoryIds = [];
    for (int i = 0; i < subcategoryNames.length; i++) {
      int subcategoryId = await db
          .rawInsert(CREATE_SUBCATEGORY, [categoryId, subcategoryNames[i]]);
      subcategoryIds.add(subcategoryId);
    }

    /// Insert [BudgetValues] corresponding to the subcategories into the data base
    /// for every month of the budget, from the current Date to [MAX_NB_MONTHS_AHEAD]
    /// months in the future.
    final DateTime startingDate = getDateFromMonthStart(DateTime.now());
    for (int monthDifference = 0;
        monthDifference <= Constants.MAX_NB_MONTHS_AHEAD;
        monthDifference++) {
      DateTime newDate = Jiffy(startingDate).add(months: monthDifference);
      for (int subcatId in subcategoryIds) {
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

  Future<void> _createConstants(Database db) async {
    const String CREATE_CONSTANT =
        '''INSERT INTO ${DatabaseConstants.constantsTable}
      (${DatabaseConstants.CONSTANT_NAME}, ${DatabaseConstants.CONSTANT_VALUE})
      VALUES(?, ?);''';

    /// Create the starting budget date based on the first time the user uses the app
    String startingDateMillisecondsSinceEpoch =
        getDateYMD(DateTime.now()).millisecondsSinceEpoch.toString();
    db.rawInsert(CREATE_CONSTANT, [
      DatabaseConstants.STARTING_BUDGET_DATE,
      startingDateMillisecondsSinceEpoch
    ]);

    /// Create the maximum budget date based on current date + Constants.MAX_NB_MONTHS_AHEAD
    String maxBudgetDateMillisecondsSinceEpoch =
        getMaxBudgetDate().millisecondsSinceEpoch.toString();
    db.rawInsert(CREATE_CONSTANT, [
      DatabaseConstants.MAX_BUDGET_DATE,
      maxBudgetDateMillisecondsSinceEpoch
    ]);

    ///Save account most recently used.
    db.rawInsert(CREATE_CONSTANT, [DatabaseConstants.MOST_RECENT_ACCOUNT, "0"]);
  }

  FutureOr<void> _onUpgrade(Database db, int oldVersion, int newVersion) {
    const String CREATE_CONSTANT =
        '''INSERT INTO ${DatabaseConstants.constantsTable}
      (${DatabaseConstants.CONSTANT_NAME}, ${DatabaseConstants.CONSTANT_VALUE})
      VALUES(?, ?);''';

    if (oldVersion == 1) {
      ///Save account most recently used.
      db.rawInsert(
          CREATE_CONSTANT, [DatabaseConstants.MOST_RECENT_ACCOUNT, "0"]);
      print("Upgrading from version 1 to version 2");
    }
  }
}
