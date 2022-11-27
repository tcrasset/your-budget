// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'constants.dart';

class AccountModel {
  final String name;
  final double balance;

  AccountModel({
    required this.name,
    required this.balance,
  });
}

/// Class representing the physical account where the money is stored.
class Account {
  /// Unique id of this.
  int? id;

  /// Name given to this.
  String? name;

  /// Balance of this.
  double? balance;

  /// Default constructor for [Account] with an unique [id], a [name] and the
  /// current [balance].
  Account({required this.id, required this.name, required this.balance});

  /// Constructor building an [Account] from a [json] representation taken
  /// from a database.
  Account.fromJson(Map<String, dynamic> json) {
    id = json[DatabaseConstants.ACCOUNT_ID] as int;
    name = json[DatabaseConstants.ACCOUNT_NAME] as String;
    balance = json[DatabaseConstants.ACCOUNT_BALANCE] as double;
  }

  bool hasSameValues(Account account) {
    return account.id == id &&
        account.name == name &&
        account.balance == balance;
  }

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name, balance: $balance}""";
  }

  Account copyWith({
    int? id,
    String? name,
    double? balance,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      balance: balance ?? this.balance,
    );
  }
}
