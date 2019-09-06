
import 'package:mybudget/database_creator.dart';

class Payee {
  int id;
  String name;

  Payee(this.id, this.name);

  /// Create a Payee from a json file
  Payee.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.PAYEE_ID];
    this.name = json[DatabaseCreator.PAYEE_NAME];
  }

  /// Convert a Payee into a Map. 
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.PAYEE_ID: id,
      DatabaseCreator.PAYEE_NAME: name,
    };
  }

}

class MoneyTransaction {
  int id;
  int categoryID;
  int subcatID;
  int payeeID;
  int accountID;
  int amount;
  String memo;
  DateTime date;

  MoneyTransaction(this.id, this.categoryID, this.subcatID,  
              this.payeeID, this.accountID, this.amount, 
              this.memo, this.date);
  
  /// Create a MoneyTransaction from a json file
  MoneyTransaction.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.MONEYTRANSACTION_ID];
    this.categoryID = json[DatabaseCreator.CATEGORY_ID];
    this.subcatID = json[DatabaseCreator.SUBCAT_ID];
    this.payeeID = json[DatabaseCreator.PAYEE_ID];
    this.accountID = json[DatabaseCreator.ACCOUNT_ID];
    this.amount = json[DatabaseCreator.MONEYTRANSACTION_AMOUNT];
    this.memo = json[DatabaseCreator.MONEYTRANSACTION_MEMO];
    //TODO: Transform to datetime object
    this.date = json[DatabaseCreator.MONEYTRANSACTION_DATE];
  }

  ///Convert a MoneyTransaction into a Map. 
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.MONEYTRANSACTION_ID:id,
      DatabaseCreator.CATEGORY_ID:categoryID,
      DatabaseCreator.SUBCAT_ID:subcatID,
      DatabaseCreator.PAYEE_ID:payeeID,
      DatabaseCreator.ACCOUNT_ID:accountID,
      DatabaseCreator.MONEYTRANSACTION_AMOUNT:amount,
      DatabaseCreator.MONEYTRANSACTION_MEMO:memo,
      DatabaseCreator.MONEYTRANSACTION_DATE:date,
    };
  }
}

class Account {
  
  int id;
  String name;
  double balance;

  Account(this.id, this.name, this.balance);

  Account.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.ACCOUNT_ID];
    this.name = json[DatabaseCreator.ACCOUNT_NAME];
    this.balance = json[DatabaseCreator.ACCOUNT_BALANCE];
  }

  /// Convert an Account into a Map. 
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.ACCOUNT_ID: id,
      DatabaseCreator.ACCOUNT_NAME: name,
      DatabaseCreator.ACCOUNT_BALANCE: balance,
    };
  }

}
