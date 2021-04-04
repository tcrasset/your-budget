// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';

/// Class that defines an entity/person that either received money or gave money to the budget
/// holder.
/// It is defined using an unique [id] and a [name].
class Payee {
  /// Unique id of this.
  int id;

  /// Name of this.
  String name;

  /// Default constructor of [Payee]
  Payee({@required this.id, @required this.name});

  /// Constructor building a [Payee] from a [json] representation taken
  /// from a database.
  Payee.fromJson(Map<String, dynamic> json) {
    id = json[DatabaseConstants.PAYEE_ID] as int;
    name = json[DatabaseConstants.PAYEE_NAME] as String;
  }

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name}""";
  }

  bool hasSameValues(Payee payee) {
    return payee.id == id && payee.name == name;
  }
}

class PayeeModel {
  final String name;

  PayeeModel({
    @required this.name,
  });
}
