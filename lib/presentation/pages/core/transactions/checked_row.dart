// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../../models/utils.dart';
import '../../../../models/utils.dart';
import '../../modifyTransactions/modify_transaction_state.dart';

class CheckedRow extends StatefulWidget {
  final String/*!*/ subcategoryName;
  final TextStyle subcategoryStyle;

  final String/*!*/ memo;
  final TextStyle memoStyle;
  final double amount;
  final TextStyle amountStyle;
  final DateTime/*!*/ date;
  final TextStyle dateStyle;
  final String payeeName;
  final int transactionId;

  const CheckedRow(this.subcategoryName, this.memo, this.memoStyle, this.amount, this.amountStyle,
      this.date, this.dateStyle, this.payeeName, this.subcategoryStyle, this.transactionId,
      {Key? key})
      : super(key: key);

  @override
  _CheckedRowState createState() => _CheckedRowState();
}

class _CheckedRowState extends State<CheckedRow> {
  bool isChecked = false;

  void handleCheckboxOnChanged(bool value) {
    final ModifyTransactionsState showTransactionsState =
        Provider.of<ModifyTransactionsState>(context, listen: false);
    showTransactionsState.updateIsSelected(widget.transactionId);
    setState(() {
      isChecked = value;
    });
  }

  @override
  void initState() {
    final ModifyTransactionsState showTransactionsState =
        Provider.of<ModifyTransactionsState>(context, listen: false);

    showTransactionsState.setTransaction(widget.transactionId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            if (widget.memo != "Starting balance")
              Checkbox(value: isChecked, onChanged: handleCheckboxOnChanged as void Function(bool?)?),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    getDateString(widget.date),
                    textAlign: TextAlign.right,
                    style: widget.dateStyle,
                  ),
                  const SizedBox(
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
                  const SizedBox(
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
