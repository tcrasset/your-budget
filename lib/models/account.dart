import 'package:meta/meta.dart';

import 'package:your_budget/models/constants.dart';

class AccountModel {
  final String name;
  final double balance;

  AccountModel({
    @required this.name,
    @required this.balance,
  });
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
  Account({@required this.id, @required this.name, @required this.balance});

  /// Constructor building an [Account] from a [json] representation taken
  /// from a database.
  Account.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseConstants.ACCOUNT_ID];
    this.name = json[DatabaseConstants.ACCOUNT_NAME];
    this.balance = json[DatabaseConstants.ACCOUNT_BALANCE];
  }

  bool hasSameValues(Account account) {
    return account.id == this.id &&
        account.name == this.name &&
        account.balance == this.balance;
  }

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name, balance: $balance}""";
  }
}
