import 'dart:async';
import 'dart:io';

import 'package:jiffy/jiffy.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Global database variable so as not to handle concurrency issues
Database db;

/// Class that is responsible for creating the database, filling up the default values
/// and assigning it to global variable [db].
class DatabaseCreator {
  /// Names of the database tables
  static const String categoryTable = 'category';
  static const String subcategoryTable = 'subcategory';
  static const String payeeTable = 'payee';
  static const String accountTable = 'account';
  static const String moneyTransactionTable = 'moneyTransaction';
  static const String budgetValueTable = 'budgetValue';
  static const String constantsTable = 'constants';
  static const String goalTable = 'goal';

  /// Field names of the [categoryTable]
  static const String CATEGORY_ID = 'id';
  static const String CATEGORY_NAME = 'name';

  /// Field names of the [subcategoryTable]
  static const String SUBCAT_ID = 'id';
  static const String SUBCAT_NAME = 'name';

  /// Field names of the [payeeTable]
  static const String PAYEE_ID = 'id';
  static const String PAYEE_NAME = 'name';

  /// Field names of the [accountTable]
  static const String ACCOUNT_ID = 'id';
  static const String ACCOUNT_NAME = 'name';
  static const String ACCOUNT_BALANCE = 'balance';

  /// Field names of the [moneyTransactionTable]
  static const String MONEYTRANSACTION_ID = 'id';
  static const String MONEYTRANSACTION_AMOUNT = 'amount';
  static const String MONEYTRANSACTION_MEMO = 'memo';
  static const String MONEYTRANSACTION_DATE = 'date';

  /// Field names of the [budgetValueTable]
  static const BUDGET_VALUE_ID = 'id';
  static const BUDGET_VALUE_BUDGETED = 'budgeted';
  static const BUDGET_VALUE_AVAILABLE = 'available';
  static const BUDGET_VALUE_YEAR = 'year';
  static const BUDGET_VALUE_MONTH = 'month';

  /// Field names of the [constantsTable]
  static const String CONSTANT_ID = 'id';
  static const String CONSTANT_NAME = 'name';
  static const String CONSTANT_VALUE = 'value';

  /// Field names of the [goalTable]
  static const String GOAL_ID = "id";
  static const String GOAL_TYPE = "type";
  static const String GOAL_AMOUNT = "amount";
  static const String GOAL_YEAR = "year";
  static const String GOAL_MONTH = "month";

  /// Field names of the foreign keys
  static const String CAT_ID_OUTSIDE = 'cat_id';
  static const String SUBCAT_ID_OUTSIDE = 'subcat_id';
  static const String PAYEE_ID_OUTSIDE = 'payee_id';
  static const String ACCOUNT_ID_OUTSIDE = 'account_id';
  static const String BUDGET_VALUE_OUTSIDE = 'budgetvalues_id';
  static const String GOAL_ID_OUTSIDE = 'goal_id';

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
  Future<void> initDatabase() async {
    final path = await getDatabasePath('budgetDB');
    db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  /// Creates the database by creating the different tables
  /// that will populate it.
  Future<void> _onCreate(Database db, int version) async {
    await _createTables(db);
    await _createBasicCategories(db);
  }

  /// Creates the table of the database. These are [categoryTable], [subcategoryTable],
  /// [payeeTable], [accountTable], [moneyTransactionTable], [budgetValueTable], [constantsTable],
  /// and [goalTable].
  Future<void> _createTables(Database db) async {
    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $categoryTable (
                        $CATEGORY_ID INTEGER PRIMARY KEY ,
                        $CATEGORY_NAME TEXT NOT NULL UNIQUE
                      );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $subcategoryTable (
                        $SUBCAT_ID INTEGER PRIMARY KEY,
                        $CAT_ID_OUTSIDE INTEGER NOT NULL,
                        $SUBCAT_NAME TEXT NOT NULL
                    );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $payeeTable (
                        $PAYEE_ID INTEGER PRIMARY KEY ,
                        $PAYEE_NAME TEXT NOT NULL UNIQUE
                      );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $accountTable (
                        $ACCOUNT_ID INTEGER PRIMARY KEY ,
                        $ACCOUNT_NAME TEXT NOT NULL UNIQUE,
                        $ACCOUNT_BALANCE FLOAT NOT NULL
                      );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $moneyTransactionTable (
                        $MONEYTRANSACTION_ID INTEGER PRIMARY KEY ,
                        $SUBCAT_ID_OUTSIDE INTEGER NOT NULL,
                        $PAYEE_ID_OUTSIDE INTEGER NOT NULL,
                        $ACCOUNT_ID_OUTSIDE INTEGER NOT NULL,
                        $MONEYTRANSACTION_AMOUNT FLOAT NOT NULL,
                        $MONEYTRANSACTION_MEMO TEXT,
                        $MONEYTRANSACTION_DATE INTEGER NOT NULL,
                        FOREIGN KEY ($SUBCAT_ID_OUTSIDE) REFERENCES $subcategoryTable($SUBCAT_ID),
                        FOREIGN KEY ($PAYEE_ID_OUTSIDE) REFERENCES $payeeTable($PAYEE_ID),
                        FOREIGN KEY ($ACCOUNT_ID_OUTSIDE) REFERENCES $accountTable($ACCOUNT_ID)
                    );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $budgetValueTable (
                        $BUDGET_VALUE_ID INTEGER PRIMARY KEY,
                        $SUBCAT_ID_OUTSIDE INTEGER NOT NULL,
                        $BUDGET_VALUE_BUDGETED FLOAT DEFAULT 0.00,
                        $BUDGET_VALUE_AVAILABLE FLOAT DEFAULT 0.00,
                        $BUDGET_VALUE_YEAR INTEGER NOT NULL,
                        $BUDGET_VALUE_MONTH INTEGER NOT NULL,
                        FOREIGN KEY ($SUBCAT_ID_OUTSIDE) REFERENCES $categoryTable($SUBCAT_ID)
                    );''');
    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $goalTable (
                        $GOAL_ID INTEGER PRIMARY KEY,
                        $SUBCAT_ID_OUTSIDE INTEGER NOT NULL,
                        $GOAL_TYPE INTEGER NOT NULL,
                        $GOAL_AMOUNT FLOAT NOT NULL,
                        $GOAL_YEAR INTEGER,
                        $GOAL_MONTH INTEGER,
                        FOREIGN KEY ($SUBCAT_ID_OUTSIDE) REFERENCES $subcategoryTable($SUBCAT_ID)

                    );''');

    await db.execute('''
                      CREATE TABLE IF NOT EXISTS $constantsTable (
                        $CONSTANT_ID INTEGER PRIMARY KEY,
                        $CONSTANT_NAME TEXT,
                        $CONSTANT_VALUE TEXT
                    );''');
  }

  /// Populates the tables of database [db] with the default categories, subcategories and
  /// their budgetValues.
  Future<void> _createBasicCategories(Database db) async {
    const String CREATE_CATEGORY = '''INSERT INTO $categoryTable
      ($CATEGORY_ID,$CATEGORY_NAME)
      VALUES(?, ?);''';

    const String CREATE_SUBCATEGORY = '''INSERT INTO $subcategoryTable
      ($SUBCAT_ID,
      $CAT_ID_OUTSIDE,
      $SUBCAT_NAME)
      VALUES(?, ?, ?);''';

    const String CREATE_BUDGETVALUE = '''INSERT INTO $budgetValueTable
      ($BUDGET_VALUE_ID,
      $SUBCAT_ID_OUTSIDE,
      $BUDGET_VALUE_BUDGETED,
      $BUDGET_VALUE_AVAILABLE,
      $BUDGET_VALUE_YEAR,
      $BUDGET_VALUE_MONTH)
      VALUES(?, ?, ?, ?, ?, ?);''';

    await db.rawInsert(CREATE_CATEGORY, [1, "Essentials"]);

    List<String> subcategoryNames = ["Rent", "Eletricity", "Water", "Food", "Internet", "Phone"];
    for (int i = 1; i <= subcategoryNames.length; i++) {
      await db.rawInsert(CREATE_SUBCATEGORY, [i, 1, subcategoryNames[i - 1]]);
    }

    /// Insert [BudgetValues] corresponding to the subcategories into the data base
    /// for every month of the budget, from the current Date to [MAX_NB_MONTHS_AHEAD]
    /// months in the future.
    final DateTime startingDate = getDateFromMonthStart(DateTime.now());
    int budgetValueId = 1;
    for (int monthDifference = 0;
        monthDifference < Constants.MAX_NB_MONTHS_AHEAD;
        monthDifference++) {
      for (int subcatId = 1; subcatId <= subcategoryNames.length; subcatId++) {
        DateTime newDate = Jiffy(startingDate).add(months: monthDifference);
        await db.rawInsert(CREATE_BUDGETVALUE, [
          budgetValueId++, //
          subcatId,
          0.00,
          0.00,
          newDate.year,
          newDate.month
        ]);
      }
    }
  }
}

//TODO: When starting a new month, create a new month in the database
