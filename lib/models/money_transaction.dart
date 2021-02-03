import 'package:meta/meta.dart';
import 'package:your_budget/models/TBB_money_transaction.dart';
import 'package:your_budget/models/between_accounts_money_transaction.dart';

import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/standard_money_transaction.dart';

/// Class that defines a MoneyTransaction between the user and another entity.
/// The [amount] is transfered between the user and the entity specified by [payeeID] at the given
/// [date], from the account specified by [accountID] and the subcategory specified
/// by [subcategoryID].
/// A [memo] detailing the transaction is added as well.

abstract class MoneyTransaction {
  /// Default constructor of [MoneyTransaction].

  factory MoneyTransaction(
      {@required id,
      @required subcatID,
      @required payeeID,
      @required accountID,
      @required amount,
      @required memo,
      @required date}) {
    if (subcatID == Constants.UNASSIGNED_SUBCAT_ID) {
      return BetweenAccountsMoneyTransaction(
          id: id,
          accountID: accountID,
          payeeID: payeeID,
          subcatID: subcatID,
          amount: amount,
          date: date,
          memo: memo);
    } else if (subcatID == Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION) {
      return TBBMoneyTransaction(
          id: id,
          accountID: accountID,
          payeeID: payeeID,
          subcatID: subcatID,
          amount: amount,
          date: date,
          memo: memo);
    } else {
      return StandardMoneyTransaction(
          id: id,
          accountID: accountID,
          payeeID: payeeID,
          subcatID: subcatID,
          amount: amount,
          date: date,
          memo: memo);
    }
  }

  /// Constructor building a [MoneyTransaction] from a [json] representation taken
  /// from a database.
  factory MoneyTransaction.fromJson(Map<String, dynamic> json) {
    return MoneyTransaction(
      id: json[DatabaseConstants.MONEYTRANSACTION_ID],
      subcatID: json[DatabaseConstants.SUBCAT_ID_OUTSIDE],
      payeeID: json[DatabaseConstants.PAYEE_ID_OUTSIDE],
      accountID: json[DatabaseConstants.ACCOUNT_ID_OUTSIDE],
      amount: json[DatabaseConstants.MONEYTRANSACTION_AMOUNT],
      memo: json[DatabaseConstants.MONEYTRANSACTION_MEMO],
      date: DateTime.fromMillisecondsSinceEpoch(
          json[DatabaseConstants.MONEYTRANSACTION_DATE]),
    );
  }

  @override
  String toString();

  MoneyTransaction copyWith({
    int id,
    int subcatID,
    int payeeID,
    int accountID,
    double amount,
    String memo,
    DateTime date,
  });
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
