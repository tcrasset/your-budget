import 'package:meta/meta.dart';

class PayeeModel {
  final String name;

  PayeeModel({
    @required this.name,
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

class AccountModel {
  final String name;
  final double balance;

  AccountModel({
    @required this.name,
    @required this.balance,
  });
}
