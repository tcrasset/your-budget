import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
}
