import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';
import 'package:provider/provider.dart';

class TransactionRow extends StatelessWidget {
  final MoneyTransaction moneyTransaction;
  final List<Category> categories;

  const TransactionRow(this.moneyTransaction, this.categories);

  @override
  Widget build(BuildContext context) {
    String subcategoryName = "No subcategory"; //Default value
    SubCategory correspondingSubcategory;

    AppState appState = Provider.of<AppState>(context, listen: false);

    /// Extract name of subcategory associated to transaction [moneyTransaction]
    if (moneyTransaction.subcatID == -1) {
      // Transfer between accounts
      for (final Account account in appState.accounts) {
        if (account.id == -moneyTransaction.payeeID) {
          subcategoryName = "To/From " + account.name;
        }
      }
    } else {
      // Transaction into subcategories
      for (final cat in categories) {
        if (cat is SubCategory && cat.id == moneyTransaction.subcatID) {
          correspondingSubcategory = cat;
          subcategoryName = correspondingSubcategory.name;
          break;
        }
      }
    }
    return Container(
        padding: EdgeInsets.symmetric(vertical: 10),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  moneyTransaction.memo == "" ? "No memo" : moneyTransaction.memo,
                  textAlign: TextAlign.left,
                ),
              ),
              Text("${moneyTransaction.amount} €", textAlign: TextAlign.right),
            ],
          ),
          Row(
            children: <Widget>[
              Text(
                subcategoryName,
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: Text(getDateString(moneyTransaction.date), textAlign: TextAlign.right)),
            ],
          ),
        ]));
  }
}
