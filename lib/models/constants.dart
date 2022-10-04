// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

// ignore: avoid_classes_with_only_static_members
/// Class storing constants used throughout the project.
class Constants {
  /// Common icons used throughout the project
  static const IconData BUDGET_ICON = FontAwesomeIcons.landmark;
  static const IconData ACCOUNT_ICON = FontAwesomeIcons.piggyBank;
  static const IconData ALLTRANSACTION_ICON = FontAwesomeIcons.receipt;
  static const IconData ADD_TRANSACTION_ICON = FontAwesomeIcons.plusCircle;

  /// Colors used throughout the project
  static const Color PRIMARY_COLOR = Color.fromRGBO(38, 70, 83, 1);
  static const Color SECONDARY_COLOR = Color.fromRGBO(42, 157, 143, 1);
  static const Color GREEN_COLOR = SECONDARY_COLOR;
  static const Color RED_COLOR = Color.fromRGBO(231, 111, 81, 1);

  /// [TextStyle]'s used throughout the project
  static const TextStyle CATEGORY_TEXT_STYLE =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0);
  static const TextStyle SUBCATEGORY_TEXT_STYLE = TextStyle(color: Colors.black, fontSize: 18.0);

  /// Maximum number of months that can be budgeted ahead of the current month
  static const int MAX_NB_MONTHS_AHEAD = 24;
  static const UNASSIGNED_SUBCAT_ID = 0;
  static const UNASSIGNED_PAYEE_ID = 0;
  static const TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION = 1048576;

  static const String CURRENCY_SYMBOL = "€";
  // ignore: non_constant_identifier_names
  static NumberFormat CURRENCY_FORMAT = NumberFormat.currency(
    locale: 'be',
    decimalDigits: 2,
    symbol: CURRENCY_SYMBOL,
  );
}

class DatabaseConstants {
  /// Names of the database tables
  static const String categoryTable = 'category';
  static const String subcategoryTable = 'subcategory';
  static const String payeeTable = 'payee';
  static const String accountTable = 'account';
  static const String moneyTransactionTable = 'moneyTransaction';
  static const String budgetValueTable = 'budgetValue';
  static const String constantsTable = 'constants';
  static const String goalTable = 'goal';

  /// Field names of the [categoryTable]
  static const String CATEGORY_ID = 'id';
  static const String CATEGORY_NAME = 'categoryName';

  /// Field names of the [subcategoryTable]
  static const String SUBCAT_ID = 'id';
  static const String SUBCAT_NAME = 'subcategoryName';

  /// Field names of the [payeeTable]
  static const String PAYEE_ID = 'id';
  static const String PAYEE_NAME = 'payeeName';

  /// Field names of the [accountTable]
  static const String ACCOUNT_ID = 'id';
  static const String ACCOUNT_NAME = 'accountName';
  static const String ACCOUNT_BALANCE = 'balance';

  /// Field names of the [moneyTransactionTable]
  static const String MONEYTRANSACTION_ID = 'id';
  static const String MONEYTRANSACTION_AMOUNT = 'amount';
  static const String MONEYTRANSACTION_MEMO = 'memo';
  static const String MONEYTRANSACTION_IS_INITIAL_TRANSACTION = 'isInitialTransaction';
  static const String MONEYTRANSACTION_DATE = 'dateInMillisecondsSinceEpoch';

  /// Field names of the [budgetValueTable]
  static const BUDGET_VALUE_ID = 'id';
  static const BUDGET_VALUE_BUDGETED = 'budgeted';
  static const BUDGET_VALUE_AVAILABLE = 'available';
  static const BUDGET_VALUE_YEAR = 'year';
  static const BUDGET_VALUE_MONTH = 'month';

  /// Field names of the [constantsTable]
  static const String CONSTANT_ID = 'id';
  static const String CONSTANT_NAME = 'constantName';
  static const String CONSTANT_VALUE = 'value';

  /// Field names of the [goalTable]
  static const String GOAL_ID = "id";
  static const String GOAL_TYPE = "type";
  static const String GOAL_AMOUNT = "amount";
  static const String GOAL_YEAR = "year";
  static const String GOAL_MONTH = "month";

  /// Field names of the foreign keys
  static const String CAT_ID_OUTSIDE = 'categoryID';
  static const String SUBCAT_ID_OUTSIDE = 'subcatID';
  static const String PAYEE_ID_OUTSIDE = 'payeeID';
  static const String ACCOUNT_ID_OUTSIDE = 'accountID';
  static const String BUDGET_VALUE_OUTSIDE = 'budgetvalueID';
  static const String GOAL_ID_OUTSIDE = 'goalID';

  /// Constants
  static const String STARTING_BUDGET_DATE = "STARTING_BUDGET_DATE";
  static const String MAX_BUDGET_DATE = "MAX_BUDGET_DATE";
  static const String MOST_RECENT_ACCOUNT = "MOST_RECENT_ACCOUNT";
  static const String TO_BE_BUDGETED = "To be budgeted";
}
