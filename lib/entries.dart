
import 'package:mybudget/database_creator.dart';

class Payee {
  int id;
  String name;

  Payee(this.id, this.name);

  Payee.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.PAYEE_ID];
    this.name = json[DatabaseCreator.PAYEE_NAME];
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
}
