import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';
import 'package:provider/provider.dart';

class TransactionRow extends StatefulWidget {
  final MoneyTransaction moneyTransaction;
  final List<Category> categories;
  final bool isEditable;

  TransactionRow(this.moneyTransaction, this.categories, this.isEditable);

  @override
  _TransactionRowState createState() => _TransactionRowState();
}

class _TransactionRowState extends State<TransactionRow> {
  final TextStyle memoStyle =
      TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey);

  final TextStyle dateStyle =
      TextStyle(fontSize: 14.0, fontStyle: FontStyle.italic, color: Colors.black);

  final TextStyle subcategoryStyle =
      TextStyle(fontSize: 22.0, fontWeight: FontWeight.w600, color: Colors.black);

  TextStyle amountStyle;

  void initState() {
    amountStyle = TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w600,
        color: widget.moneyTransaction.amount.isNegative
            ? Constants.RED_COLOR
            : Constants.GREEN_COLOR);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String subcategoryName = "";
    String payeeName;
    AppState appState = Provider.of<AppState>(context, listen: false);

    if (appState.payees.isNotEmpty) {
      // orElse is for starting balance
      Payee payee = appState.payees
          .singleWhere((payee) => payee.id == widget.moneyTransaction.payeeID, orElse: () => null);

      payeeName = payee != null ? payee.name : "";
    } else {
      payeeName = "";
    }

    /// Extract name of subcategory associated to transaction [moneyTransaction]
    if (widget.moneyTransaction.subcatID == -1) {
      // Transfer between accounts
      for (final Account account in appState.accounts) {
        if (account.id == -widget.moneyTransaction.payeeID) {
          subcategoryName = "To/From " + account.name;
        }
      }
    } else {
      // Transaction into subcategories
      var correspondingSubcategory = widget.categories.singleWhere(
          ((cat) => cat is SubCategory && cat.id == widget.moneyTransaction.subcatID),
          orElse: () => null);
      subcategoryName = correspondingSubcategory != null ? correspondingSubcategory.name : "";
    }

    return widget.isEditable
        ? RowWithCheckbox(
            subcategoryName,
            widget.moneyTransaction.memo,
            memoStyle,
            widget.moneyTransaction.amount,
            amountStyle,
            widget.moneyTransaction.date,
            dateStyle,
            payeeName,
            subcategoryStyle)
        : RowWithoutCheckbox(
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
}

class RowWithoutCheckbox extends StatelessWidget {
  final String subcategoryName;
  final TextStyle subcategoryStyle;

  final String memo;
  final TextStyle memoStyle;
  final double amount;
  final TextStyle amountStyle;
  final DateTime date;
  final TextStyle dateStyle;
  final String payeeName;

  const RowWithoutCheckbox(this.subcategoryName, this.memo, this.memoStyle, this.amount,
      this.amountStyle, this.date, this.dateStyle, this.payeeName, this.subcategoryStyle,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                subcategoryName,
                style: subcategoryStyle,
              ),
              Text(
                memo == "" ? "No memo" : memo,
                textAlign: TextAlign.left,
                style: memoStyle,
              ),
              Text("$amount €", style: amountStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(getDatePhrase(date), textAlign: TextAlign.right, style: dateStyle),
              Text("$payeeName")
            ],
          ),
        ]));
  }
}

class RowWithCheckbox extends StatefulWidget {
  final String subcategoryName;
  final TextStyle subcategoryStyle;

  final String memo;
  final TextStyle memoStyle;
  final double amount;
  final TextStyle amountStyle;
  final DateTime date;
  final TextStyle dateStyle;
  final String payeeName;

  const RowWithCheckbox(this.subcategoryName, this.memo, this.memoStyle, this.amount,
      this.amountStyle, this.date, this.dateStyle, this.payeeName, this.subcategoryStyle,
      {Key key})
      : super(key: key);

  @override
  _RowWithCheckboxState createState() => _RowWithCheckboxState();
}

class _RowWithCheckboxState extends State<RowWithCheckbox> {
  bool isChecked = false;
  void handleCheckboxOnChanged(bool value) {
    setState(() {
      isChecked = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Checkbox(value: isChecked, onChanged: handleCheckboxOnChanged),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(getDateString(widget.date),
                      textAlign: TextAlign.right, style: widget.dateStyle),
                  Text(
                    widget.memo == "" ? "No memo" : widget.memo,
                    textAlign: TextAlign.left,
                    style: widget.memoStyle,
                  ),
                  Text("${widget.amount} €", style: widget.amountStyle),
                ],
              ),
            ),
          ],
        ));
  }
}
