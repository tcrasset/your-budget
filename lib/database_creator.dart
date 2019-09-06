import 'package:mybudget/categories.dart';
import 'package:mybudget/entries.dart';
import 'package:sqflite/sqflite.dart';
//import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';


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
    }
    else 
      print("Parameters: NULL");

    if(selectQueryResult != null){
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
    if(await Directory(dirname(path)).exists()) {
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
              $CAT_ID_OUTSIDE INTEGER NOT NULL,
              $PAYEE_ID_OUTSIDE INTEGER NOT NULL,
              $ACCOUNT_ID_OUTSIDE INTEGER NOT NULL,
              $MONEYTRANSACTION_AMOUNT FLOAT NOT NULL,
              $MONEYTRANSACTION_MEMO TEXT,
              $MONEYTRANSACTION_DATE TEXT,
              FOREIGN KEY ($SUBCAT_ID_OUTSIDE) REFERENCES subcategory($SUBCAT_ID),
              FOREIGN KEY ($CAT_ID_OUTSIDE) REFERENCES category($CATEGORY_ID),
              FOREIGN KEY ($PAYEE_ID_OUTSIDE) REFERENCES payee($PAYEE_ID),
              FOREIGN KEY ($ACCOUNT_ID_OUTSIDE) REFERENCES account($ACCOUNT_ID)
          );''');
  }
}


class SQLQueries {

  /// Returns the list of all [MainCategory] in the database.
  static Future<List<Category>> getCategories() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.categoryTable}''';
    final data = await db.rawQuery(sql);
    List<MainCategory> categories = List();

    for(final node in data) {
      final category = MainCategory.fromJson(node);
      categories.add(category);
    }

    return categories;
  }

  /// Returns the list of all [SubCategory] in the database.
  static Future<List<Category>> getSubCategories() async {
    final sql = '''SELECT * FROM ${DatabaseCreator.subcategoryTable};''';
    final data = await db.rawQuery(sql);
    List<SubCategory> subcategories = List();

    for(final node in data) {
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

    for(final node in data) {
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

    for(final node in data) {
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

    for(final node in data) {
      final transaction = MoneyTransaction.fromJson(node);
      transactions.add(transaction);
    }

    return transactions;
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
  /// [subcategory.parent_id], [subcategory.name], [subcategory.budgeted]
  /// and [subcategory.available].
  static Future<void> addSubcategory(SubCategory subcategory) async {
    final sql = '''INSERT INTO ${DatabaseCreator.subcategoryTable} 
      (${DatabaseCreator.SUBCAT_ID},
      ${DatabaseCreator.CAT_ID_OUTSIDE},
      ${DatabaseCreator.SUBCAT_NAME},
      ${DatabaseCreator.SUBCAT_BUDGETED},
      ${DatabaseCreator.SUBCAT_AVAILABLE})
      VALUES(?, ?, ?, ?, ?);''';

    List<dynamic> params = [
      subcategory.id, 
      subcategory.parentId,
      subcategory.name,
      subcategory.budgeted,
      subcategory.available];
      
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
  /// [moneyTransaction.categoryID],
  /// [moneyTransaction.subcatID],
  /// [moneyTransaction.payeeID],
  /// [moneyTransaction.accountID],
  /// [moneyTransaction.amount],
  /// [moneyTransaction.memo] and
  ///[moneyTransaction.date] 
  /// 

  static Future<void> addMoneyTransaction(MoneyTransaction moneyTransaction) async {
    final sql = '''INSERT INTO ${DatabaseCreator.moneyTransactionTable} 
      (${DatabaseCreator.MONEYTRANSACTION_ID},
        ${DatabaseCreator.SUBCAT_ID_OUTSIDE},
        ${DatabaseCreator.CAT_ID_OUTSIDE},
        ${DatabaseCreator.PAYEE_ID_OUTSIDE},
        ${DatabaseCreator.ACCOUNT_ID_OUTSIDE},
        ${DatabaseCreator.MONEYTRANSACTION_AMOUNT},
        ${DatabaseCreator.MONEYTRANSACTION_MEMO},
        ${DatabaseCreator.MONEYTRANSACTION_DATE})
      VALUES(?, ?, ?, ?, ?, ?, ?, ?);''';

    List<dynamic> params = [
      moneyTransaction.id, 
      moneyTransaction.subcatID,
      moneyTransaction.categoryID,
      moneyTransaction.payeeID,
      moneyTransaction.accountID,
      moneyTransaction.amount,
      moneyTransaction.memo,
      moneyTransaction.date];
      
    final result = await db.rawInsert(sql, params);
    DatabaseCreator.databaseLog('Add moneyTransaction', sql, null, result, params);
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

  //TODO: Implements other SQL queries

  /// Rename [category.name] of category with id [category.id] in the database.
  static Future<void> renameCategory(MainCategory category) async {
    final sql = '''UPDATE ${DatabaseCreator.categoryTable} 
                SET ${DatabaseCreator.CATEGORY_NAME} = ?
                WHERE ${DatabaseCreator.CATEGORY_ID} == ?
                ;''';
    
    List<dynamic> params = [category.name, category.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Rename category', sql, null, result, params);
  }

  /// Rename [subcategory.name] of subcategory with id [subcategory.id] in the database.
  static Future<void> renameSubcategory(SubCategory subcategory) async {
    final sql = '''UPDATE ${DatabaseCreator.subcategoryTable} 
                SET ${DatabaseCreator.SUBCAT_NAME} = ?
                WHERE ${DatabaseCreator.SUBCAT_ID} == ?
                ;''';
    
    List<dynamic> params = [subcategory.name, subcategory.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Rename subcategory', sql, null, result, params);
  }

  /// Rename [account.name] of account with id [account.id] in the database.
  static Future<void> renameAccount(Account account) async {
    final sql = '''UPDATE ${DatabaseCreator.accountTable} 
                SET ${DatabaseCreator.ACCOUNT_NAME} = ?
                WHERE ${DatabaseCreator.ACCOUNT_ID} == ?
                ;''';
    
    List<dynamic> params = [account.name, account.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Rename account', sql, null, result, params);
  }

  /// Rename [payee.name] of payee with id [payee.id] in the database.
  static Future<void> renamePayee(Payee payee) async {
    final sql = '''UPDATE ${DatabaseCreator.payeeTable} 
                SET ${DatabaseCreator.PAYEE_NAME} = ?
                WHERE ${DatabaseCreator.PAYEE_ID} == ?
                ;''';
    
    List<dynamic> params = [payee.name, payee.id];
    final result = await db.rawUpdate(sql, params);
    DatabaseCreator.databaseLog('Rename payee', sql, null, result, params);
  }

  //TODO: Update other parameters than name (e.g. balance)
  //TODO: Transaction update

  /// Returns the number of categories in the database.
  /// 
  /// Used as [MainCategory.id] to create a new [MainCategory].
  static Future<int> categoryCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.categoryTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of subcategories in the database.
  /// 
  /// Used as [SubCategory.id] to create a new [SubCategory].
  static Future<int> subcategoryCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.subcategoryTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of accounts in the database.
  /// 
  /// Used as [Account.id] to create a new [Account].
  static Future<int> accountCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.accountTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

  /// Returns the number of payees in the database.
  /// 
  /// Used as [Payee.id] to create a new [Payee].
  static Future<int> payeeCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.payeeTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }


  /// Returns the number of transactions in the database.
  /// 
  /// Used as [MoneyTransaction.id] to create a new [MoneyTransaction].
  static Future<int> moneyTransactionCount() async {
    final data = await db.rawQuery('''SELECT COUNT(*) FROM ${DatabaseCreator.moneyTransactionTable};''');
    int count = data[0].values.elementAt(0);
    return count;
  }

}