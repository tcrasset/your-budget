import 'package:flutter/material.dart';
import 'package:your_budget/models/utils.dart';
import 'package:your_budget/screens/showTransactions/modifyTransactionsState.dart';
import 'package:provider/provider.dart';

class CheckedRow extends StatefulWidget {
  final String subcategoryName;
  final TextStyle subcategoryStyle;

  final String memo;
  final TextStyle memoStyle;
  final double amount;
  final TextStyle amountStyle;
  final DateTime date;
  final TextStyle dateStyle;
  final String payeeName;
  final int transactionId;

  const CheckedRow(
      this.subcategoryName,
      this.memo,
      this.memoStyle,
      this.amount,
      this.amountStyle,
      this.date,
      this.dateStyle,
      this.payeeName,
      this.subcategoryStyle,
      this.transactionId,
      {Key key})
      : super(key: key);

  @override
  _CheckedRowState createState() => _CheckedRowState();
}

class _CheckedRowState extends State<CheckedRow> {
  bool isChecked = false;

  void handleCheckboxOnChanged(bool value) {
    ModifyTransactionsState showTransactionsState =
        Provider.of<ModifyTransactionsState>(context, listen: false);
    showTransactionsState.updateIsSelected(widget.transactionId);
    setState(() {
      isChecked = value;
    });
  }

  @override
  void initState() {
    ModifyTransactionsState showTransactionsState =
        Provider.of<ModifyTransactionsState>(context, listen: false);

    showTransactionsState.setTransaction(widget.transactionId);
    super.initState();
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
            if (widget.memo != "Starting balance")
              Checkbox(value: isChecked, onChanged: handleCheckboxOnChanged),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getDateString(widget.date),
                    textAlign: TextAlign.right,
                    style: widget.dateStyle,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      widget.memo == "" ? "No memo" : widget.memo,
                      textAlign: TextAlign.left,
                      style: widget.memoStyle,
                      overflow: TextOverflow.fade,
                      maxLines: 1,
                      softWrap: false,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("${widget.amount} €", style: widget.amountStyle),
                ],
              ),
            ),
          ],
        ));
  }
}
