import 'package:meta/meta.dart';
import 'package:your_budget/models/money_transaction.dart';

class BetweenAccountsMoneyTransaction implements MoneyTransaction {
  final int id;
  final int subcatID;
  final int payeeID;
  final int accountID;
  final double amount;
  final String memo;
  final DateTime date;

  BetweenAccountsMoneyTransaction(
      {@required this.id,
      @required this.subcatID,
      @required this.payeeID,
      @required this.accountID,
      @required this.amount,
      @required this.memo,
      @required this.date});

  @override
  MoneyTransaction copyWith(
      {int id,
      int subcatID,
      int payeeID,
      int accountID,
      double amount,
      String memo,
      DateTime date}) {
    // TODO: implement copyWith
    throw UnimplementedError();
  }
}
