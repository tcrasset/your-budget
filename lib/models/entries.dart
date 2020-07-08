import 'package:mybudget/models/database_creator.dart';

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

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name}""";
  }
}

class MoneyTransaction {
  int id;
  int subcatID;
  int payeeID;
  int accountID;
  double amount;
  String memo;
  DateTime date;

  MoneyTransaction(
      this.id, this.subcatID, this.payeeID, this.accountID, this.amount, this.memo, this.date);

  /// Create a MoneyTransaction from a json file
  MoneyTransaction.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.MONEYTRANSACTION_ID];
    this.subcatID = json[DatabaseCreator.SUBCAT_ID_OUTSIDE];
    this.payeeID = json[DatabaseCreator.PAYEE_ID_OUTSIDE];
    this.accountID = json[DatabaseCreator.ACCOUNT_ID_OUTSIDE];
    this.amount = json[DatabaseCreator.MONEYTRANSACTION_AMOUNT];
    this.memo = json[DatabaseCreator.MONEYTRANSACTION_MEMO];
    this.date = DateTime.fromMillisecondsSinceEpoch(json[DatabaseCreator.MONEYTRANSACTION_DATE]);
  }

  ///Convert a MoneyTransaction into a Map.
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.MONEYTRANSACTION_ID: id,
      DatabaseCreator.SUBCAT_ID_OUTSIDE: subcatID,
      DatabaseCreator.PAYEE_ID_OUTSIDE: payeeID,
      DatabaseCreator.ACCOUNT_ID_OUTSIDE: accountID,
      DatabaseCreator.MONEYTRANSACTION_AMOUNT: amount,
      DatabaseCreator.MONEYTRANSACTION_MEMO: memo,
      DatabaseCreator.MONEYTRANSACTION_DATE: date,
    };
  }

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, subcatID: $subcatID, payeeID: $payeeID, accountID: $accountID, amount: $amount, date: $date}""";
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

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name, balance: $balance}""";
  }
}
