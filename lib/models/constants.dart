import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Constants {
  static const IconData BUDGET_ICON = FontAwesomeIcons.landmark;
  static const IconData ACCOUNT_ICON = FontAwesomeIcons.piggyBank;
  static const IconData ALLTRANSACTION_ICON = FontAwesomeIcons.receipt;
  static const IconData ADD_TRANSACTION_ICON = FontAwesomeIcons.plusCircle;

  static const TextStyle CATEGORY_TEXT_STYLE =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0);

  static const TextStyle SUBCATEGORY_TEXT_STYLE = TextStyle(color: Colors.black, fontSize: 18.0);
  static const int MAX_NB_MONTHS_AHEAD = 24;
}
