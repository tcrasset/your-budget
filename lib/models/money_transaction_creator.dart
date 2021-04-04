// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/creator.dart';
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/models/queries.dart';

class MoneyTransactionCreator implements Creator<MoneyTransaction> {
  final Queries queryContext;
  final int accountId;
  final int payeeId;
  final int subcatId;
  final double amount;
  final DateTime date;
  final String memo;

  MoneyTransactionCreator({
    @required this.queryContext,
    @required this.accountId,
    @required this.payeeId,
    @required this.subcatId,
    @required this.amount,
    @required this.date,
    @required this.memo,
  });

  @override
  Future<MoneyTransaction> create() async {
    final MoneyTransactionModel moneyTransactionModel = MoneyTransactionModel(
        accountID: accountId,
        payeeID: payeeId,
        subcatID: subcatId,
        amount: amount,
        date: date,
        memo: memo);

    final int id =
        await queryContext.addMoneyTransaction(moneyTransactionModel);

    return MoneyTransaction(
        id: id,
        accountID: accountId,
        payeeID: payeeId,
        subcatID: subcatId,
        amount: amount,
        date: date,
        memo: memo);
  }
}
