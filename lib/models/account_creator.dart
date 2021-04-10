// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'account.dart';
import 'constants.dart';
import 'creator.dart';
import 'money_transaction.dart';
import 'money_transaction_creator.dart';
import 'queries.dart';

class AccountCreator implements Creator<Account> {
  final Queries queryContext;
  final String name;
  final double balance;

  int id;

  AccountCreator({@required this.queryContext, @required this.name, @required this.balance});

  @override
  Future<Account> create() async {
    final AccountModel accountModel = AccountModel(name: name, balance: balance);
    id = await queryContext.addAccount(accountModel);
    final Account account = Account(id: id, balance: balance, name: name);
    return account;
  }

  Future<MoneyTransaction> getStartingMoneyTransaction() async {
    final Creator<MoneyTransaction> moneyTransactionCreator = MoneyTransactionCreator(
      queryContext: queryContext,
      subcatId: Constants.UNASSIGNED_SUBCAT_ID,
      payeeId: Constants.UNASSIGNED_PAYEE_ID,
      accountId: id,
      amount: balance,
      memo: "Starting balance",
      date: DateTime.now(),
    );

    return moneyTransactionCreator.create();
  }
}
