import 'package:flutter/material.dart';
import 'package:mybudget/models/utils.dart';

class UncheckedRow extends StatelessWidget {
  final String subcategoryName;
  final TextStyle subcategoryStyle;

  final String memo;
  final TextStyle memoStyle;
  final double amount;
  final TextStyle amountStyle;
  final DateTime date;
  final TextStyle dateStyle;
  final String payeeName;

  const UncheckedRow(this.subcategoryName, this.memo, this.memoStyle, this.amount, this.amountStyle,
      this.date, this.dateStyle, this.payeeName, this.subcategoryStyle,
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
