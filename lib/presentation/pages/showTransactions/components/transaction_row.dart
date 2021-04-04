// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../../appstate.dart';
import '../../../../models/account.dart';
import '../../../../models/categories.dart';
import '../../../../models/constants.dart';
import '../../../../models/money_transaction.dart';
import '../../../../models/payee.dart';
import 'checked_row.dart';
import 'unchecked_row.dart';

class TransactionRow extends StatefulWidget {
  final MoneyTransaction moneyTransaction;
  final List<Category> categories;
  final bool isEditable;

  const TransactionRow(this.moneyTransaction, this.categories, this.isEditable);

  @override
  _TransactionRowState createState() => _TransactionRowState();
}

class _TransactionRowState extends State<TransactionRow> {
  @override
  Widget build(BuildContext context) {
    const TextStyle memoStyle = TextStyle(
        fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey);

    const TextStyle dateStyle = TextStyle(
        fontSize: 14.0, fontStyle: FontStyle.italic, color: Colors.black);

    const TextStyle subcategoryStyle = TextStyle(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black);

    String subcategoryName = "";
    String payeeName;
    final TextStyle amountStyle = TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: widget.moneyTransaction.amount.isNegative
            ? Constants.RED_COLOR
            : Constants.GREEN_COLOR);
    final AppState appState = Provider.of<AppState>(context, listen: false);

    payeeName = _setPayeeName(appState);
    subcategoryName = _setSubcategoryName(appState);

    return widget.isEditable
        ? CheckedRow(
            subcategoryName,
            widget.moneyTransaction.memo,
            memoStyle,
            widget.moneyTransaction.amount,
            amountStyle,
            widget.moneyTransaction.date,
            dateStyle,
            payeeName,
            subcategoryStyle,
            widget.moneyTransaction.id)
        : UncheckedRow(
            subcategoryName,
            widget.moneyTransaction.memo,
            memoStyle,
            widget.moneyTransaction.amount,
            amountStyle,
            widget.moneyTransaction.date,
            dateStyle,
            payeeName,
            subcategoryStyle);
  }

  String _setSubcategoryName(AppState appState) {
    /// Extract name of subcategory associated to transaction [moneyTransaction]
    if (widget.moneyTransaction.subcatID == Constants.UNASSIGNED_SUBCAT_ID) {
      // Transfer between accounts
      for (final Account account in appState.accounts) {
        if (account.id == -widget.moneyTransaction.payeeID) {
          return "To/From ${account.name}";
        }
      }
    } else if (widget.moneyTransaction.subcatID ==
        Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION) {
      //Transaction into to be budgeted
      return "To be budgeted";
    }
    // Transaction into subcategories
    final correspondingSubcategory = widget.categories.singleWhere(
        (cat) =>
            cat is SubCategory && cat.id == widget.moneyTransaction.subcatID,
        orElse: () => null);
    return correspondingSubcategory != null
        ? correspondingSubcategory.name
        : "";
  }

  String _setPayeeName(AppState appState) {
    if (appState.payees.isNotEmpty) {
      // orElse is for starting balance
      final Payee payee = appState.payees.singleWhere(
          (payee) => payee.id == widget.moneyTransaction.payeeID,
          orElse: () => null);

      return payee != null ? payee.name : "";
    }
    return "";
  }
}
