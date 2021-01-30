import 'package:meta/meta.dart';
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
    this.id = json[DatabaseConstants.PAYEE_ID];
    this.name = json[DatabaseConstants.PAYEE_NAME];
  }

  @override
  String toString() {
    return super.toString() + """ {id: $id, name: $name}""";
  }

  bool hasSameValues(Payee payee) {
    return payee.id == this.id && payee.name == this.name;
  }
}


class PayeeModel {
  final String name;

  PayeeModel({
    @required this.name,
  });
}
