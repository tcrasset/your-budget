import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';
import 'package:provider/provider.dart';

class TransactionRow extends StatefulWidget {
  final MoneyTransaction moneyTransaction;
  final List<Category> categories;

  TransactionRow(this.moneyTransaction, this.categories);

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
        color: widget.moneyTransaction.amount.isNegative ? Colors.red : Colors.green);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String subcategoryName = "No subcategory"; //Default value
    SubCategory correspondingSubcategory;

    AppState appState = Provider.of<AppState>(context, listen: false);

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
      for (final cat in widget.categories) {
        if (cat is SubCategory && cat.id == widget.moneyTransaction.subcatID) {
          correspondingSubcategory = cat;
          subcategoryName = correspondingSubcategory.name;
          break;
        }
      }
    }
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        height: 90,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                subcategoryName,
                style: subcategoryStyle,
              ),
              Text(getDatePhrase(widget.moneyTransaction.date),
                  textAlign: TextAlign.right, style: dateStyle),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                widget.moneyTransaction.memo == "" ? "No memo" : widget.moneyTransaction.memo,
                textAlign: TextAlign.left,
                style: memoStyle,
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Text("${widget.moneyTransaction.amount} €", style: amountStyle),
            ],
          ),
        ]));
  }
}
