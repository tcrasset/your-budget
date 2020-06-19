import 'dart:async';
import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//Global variable so as not to handle concurrency issues
Database db;

class DatabaseCreator {
  static const String categoryTable = 'category';
  static const String subcategoryTable = 'subcategory';
  static const String payeeTable = 'payee';
  static const String accountTable = 'account';
  static const String moneyTransactionTable = 'moneyTransaction';

  static const String CATEGORY_ID = 'id';
  static const String CATEGORY_NAME = 'name';

  static const String SUBCAT_ID = 'id';
  static const String SUBCAT_NAME = 'name';
  static const String SUBCAT_BUDGETED = 'budgeted';
  static const String SUBCAT_AVAILABLE = 'available';

  static const String PAYEE_ID = 'id';
  static const String PAYEE_NAME = 'name';

  static const String ACCOUNT_ID = 'id';
  static const String ACCOUNT_NAME = 'name';
  static const String ACCOUNT_BALANCE = 'balance';

  static const String MONEYTRANSACTION_ID = 'id';
  static const String MONEYTRANSACTION_AMOUNT = 'amount';
  static const String MONEYTRANSACTION_MEMO = 'memo';
  static const String MONEYTRANSACTION_DATE = 'date';

  static const String CAT_ID_OUTSIDE = 'cat_id';
  static const String SUBCAT_ID_OUTSIDE = 'subcat_id';
  static const String PAYEE_ID_OUTSIDE = 'payee_id';
  static const String ACCOUNT_ID_OUTSIDE = 'account_id';

  /// Every action taken on the database gets logged to console
  ///
  /// Logs the method name [functionName] along with the raw sql query
  /// [sql] and the parameters used.
  /// Furthermore, either the results [selectQueryResult] of a SELECT query or
  /// the results [insertAndUpdateQueryResult] of a INSERT query are returned.
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

  /// Returns the path of the database [dbName]
  Future<String> getDatabasePath(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, dbName);

    //Make sure the folder exists
    if (await Directory(dirname(path)).exists()) {
      //await deleteDatabase(path)
    } else {
      await Directory(dirname(path)).create(recursive: true);
    }

    return path;
  }

  /// Initiates the database and assigns it to the global variable [db]
  /// by calling [DatabaseCreator.onCreate()] with the path to the database
  /// and the version number.
  Future<void> initDatabase() async {
    final path = await getDatabasePath('budgetDB');

    db = await openDatabase(path, version: 1, onCreate: onCreate);

    print(db);
  }

  /// Creates the database by creating the different tables
  /// that will populate it, namely [categoryTable], [subcategoryTable],
  /// [payeeTable], [accountTable], [moneyTransactionTable].
  Future<void> onCreate(Database db, int version) async {
    await db.execute('''
            CREATE TABLE IF NOT EXISTS $categoryTable (
              $CATEGORY_ID INTEGER PRIMARY KEY ,
              $CATEGORY_NAME TEXT NOT NULL UNIQUE
            );''');

    await db.execute('''
            CREATE TABLE IF NOT EXISTS $subcategoryTable (
              $SUBCAT_ID INTEGER,
              $CAT_ID_OUTSIDE INTEGER,
              $SUBCAT_NAME TEXT NOT NULL,
              $SUBCAT_BUDGETED FLOAT DEFAULT 0.00,
              $SUBCAT_AVAILABLE FLOAT DEFAULT 0.00,
              PRIMARY KEY ($SUBCAT_ID, $CAT_ID_OUTSIDE),
              FOREIGN KEY ($CAT_ID_OUTSIDE) REFERENCES category($CATEGORY_ID)
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
              FOREIGN KEY ($SUBCAT_ID_OUTSIDE) REFERENCES subcategory($SUBCAT_ID),
              FOREIGN KEY ($PAYEE_ID_OUTSIDE) REFERENCES payee($PAYEE_ID),
              FOREIGN KEY ($ACCOUNT_ID_OUTSIDE) REFERENCES account($ACCOUNT_ID)
          );''');
  }
}
