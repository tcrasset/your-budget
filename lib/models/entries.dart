/// This file will contain the classes for the common objects used throughout the codebase, namely
/// [Payee], [MoneyTransaction], and [Account].

import 'package:your_budget/models/constants.dart';
import 'package:meta/meta.dart';

/// Class that defines an entity/person that either received money or gave money to the budget
/// holder.
/// It is defined using an unique [id] and a [name].
class Payee {
  /// Unique id of this.
  int id;

  /// Name of this.
  String name;

  /// Default constructor of [Payee]
  Payee(this.id, this.name);

  /// Constructor building a [Payee] from a [json] representation taken
  /// from a database.
  Payee.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseConstants.PAYEE_ID];
    this.name = json[DatabaseConstants.PAYEE_NAME];
  }

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name}""";
  }
}

/// Class that defines a MoneyTransaction between the user and another entity.
/// The [amount] is transfered between the user and the entity specified by [payeeID] at the given
/// [date], from the account specified by [accountID] and the subcategory specified
/// by [subcategoryID].
/// A [memo] detailing the transaction is added as well.

class MoneyTransaction {
  /// Unique id of this.
  int id;

  /// Id of the SubCategory that this is operating on.
  int subcatID;

  /// Id of the entity where the money comes from/goes to.
  int payeeID;

  /// Id of the account where the money is input/output.
  int accountID;

  /// Monetary value that is exchanged.
  double amount;

  /// Description of this.
  String memo;

  /// Date of this.
  DateTime date;

  /// Default constructor of [MoneyTransaction].
  MoneyTransaction({
    @required this.id,
    @required this.subcatID,
    @required this.payeeID,
    @required this.accountID,
    @required this.amount,
    @required this.memo,
    @required this.date,
  });

  /// Constructor building a [MoneyTransaction] from a [json] representation taken
  /// from a database.
  MoneyTransaction.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseConstants.MONEYTRANSACTION_ID];
    this.subcatID = json[DatabaseConstants.SUBCAT_ID_OUTSIDE];
    this.payeeID = json[DatabaseConstants.PAYEE_ID_OUTSIDE];
    this.accountID = json[DatabaseConstants.ACCOUNT_ID_OUTSIDE];
    this.amount = json[DatabaseConstants.MONEYTRANSACTION_AMOUNT];
    this.memo = json[DatabaseConstants.MONEYTRANSACTION_MEMO];
    this.date = DateTime.fromMillisecondsSinceEpoch(
        json[DatabaseConstants.MONEYTRANSACTION_DATE]);
  }

  @override
  String toString() {
    return super.toString() +
        """{id: $id, subcatID: $subcatID, payeeID: $payeeID, accountID: $accountID, amount: $amount, date: $date}\n""";
  }

  MoneyTransaction copy() {
    return MoneyTransaction(
        id: this.id,
        subcatID: this.subcatID,
        payeeID: this.payeeID,
        accountID: this.accountID,
        amount: this.amount,
        memo: this.memo,
        date: this.date);
  }
}

/// Class representing the physical account where the money is stored.
class Account {
  /// Unique id of this.
  int id;

  /// Name given to this.
  String name;

  /// Balance of this.
  double balance;

  /// Default constructor for [Account] with an unique [id], a [name] and the
  /// current [balance].
  Account(this.id, this.name, this.balance);

  /// Constructor building an [Account] from a [json] representation taken
  /// from a database.
  Account.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseConstants.ACCOUNT_ID];
    this.name = json[DatabaseConstants.ACCOUNT_NAME];
    this.balance = json[DatabaseConstants.ACCOUNT_BALANCE];
  }

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name, balance: $balance}""";
  }
}
