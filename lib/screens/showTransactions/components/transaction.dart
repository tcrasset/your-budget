import 'package:flutter/material.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';

Widget transaction(MoneyTransaction moneyTransaction, List<Category> categories) {
  String subcategoryName = "No subcategory"; //Default value
  SubCategory correspondingSubcategory;

  /// Extract name of subcategory associated to transaction [moneyTransaction]
  for (final cat in categories) {
    if (cat is SubCategory && cat.id == moneyTransaction.subcatID) {
      correspondingSubcategory = cat;
      subcategoryName = correspondingSubcategory.name;
      break;
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
            Expanded(child: Text(getDateString(moneyTransaction.date), textAlign: TextAlign.right)),
          ],
        ),
      ]));
}
