// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:your_budget/models/utils.dart';

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

  const UncheckedRow(
      this.subcategoryName,
      this.memo,
      this.memoStyle,
      this.amount,
      this.amountStyle,
      this.date,
      this.dateStyle,
      this.payeeName,
      this.subcategoryStyle,
      {Key key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 70,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: Text(
                  subcategoryName,
                  style: subcategoryStyle,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Text(
                  memo == "" ? "No memo" : memo,
                  textAlign: TextAlign.left,
                  style: memoStyle,
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                  softWrap: false,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text("$amount €", style: amountStyle),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(getDatePhrase(date),
                  textAlign: TextAlign.right, style: dateStyle),
              Text(payeeName)
            ],
          ),
        ]));
  }
}
