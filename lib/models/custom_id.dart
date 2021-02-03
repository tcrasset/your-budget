import 'package:meta/meta.dart';
import 'package:your_budget/models/payee.dart';

abstract class PayeeID {
  final int value;

  PayeeID({@required this.value});
}

class AccountAsPayeeID implements PayeeID {
  @override
  int get value => value;
}

class StandardPayeeID implements PayeeID {
  @override
  int get value => value;
}

abstract class SubcatID {
  final int value;

  SubcatID({@required this.value});
}

class TBBSubcatID implements SubcatID {
  @override
  int get value => value;
}

class StandardSubcatID implements SubcatID {
  @override
  int get value => value;
}
