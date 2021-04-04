// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';

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
    id = json[DatabaseConstants.MONEYTRANSACTION_ID] as int;
    subcatID = json[DatabaseConstants.SUBCAT_ID_OUTSIDE] as int;
    payeeID = json[DatabaseConstants.PAYEE_ID_OUTSIDE] as int;
    accountID = json[DatabaseConstants.ACCOUNT_ID_OUTSIDE] as int;
    amount = json[DatabaseConstants.MONEYTRANSACTION_AMOUNT] as double;
    memo = json[DatabaseConstants.MONEYTRANSACTION_MEMO] as String;
    date = DateTime.fromMillisecondsSinceEpoch(
        json[DatabaseConstants.MONEYTRANSACTION_DATE] as int);
  }

  @override
  String toString() {
    return super.toString() +
        """{id: $id, subcatID: $subcatID, payeeID: $payeeID, accountID: $accountID, amount: $amount, date: $date}\n""";
  }

  MoneyTransaction copyWith({
    int id,
    int subcatID,
    int payeeID,
    int accountID,
    double amount,
    String memo,
    DateTime date,
  }) {
    return MoneyTransaction(
      id: id ?? this.id,
      subcatID: subcatID ?? this.subcatID,
      payeeID: payeeID ?? this.payeeID,
      accountID: accountID ?? this.accountID,
      amount: amount ?? this.amount,
      memo: memo ?? this.memo,
      date: date ?? this.date,
    );
  }
}

class MoneyTransactionModel {
  final int subcatID;
  final int payeeID;
  final int accountID;
  final double amount;
  final String memo;
  final DateTime date;

  MoneyTransactionModel({
    @required this.subcatID,
    @required this.payeeID,
    @required this.accountID,
    @required this.amount,
    @required this.memo,
    @required this.date,
  });
}
