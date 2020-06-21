import 'package:flutter/material.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/entries.dart';
import 'package:mybudget/models/utils.dart';

Widget transaction(AsyncSnapshot snapshot, int index) {
  MoneyTransaction moneyTransaction = snapshot.data[0][index];
  List<SubCategory> subcategories = snapshot.data[3];
  String subcategoryName;

  SubCategory subcategory = subcategories.singleWhere(
      (subcategory) => subcategory.id == moneyTransaction.subcatID,
      orElse: () => null);

  if (subcategory == null) {
    subcategoryName = "No subcategory";
  } else {
    subcategoryName = subcategory.name;
  }

  return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Text(
                moneyTransaction.memo,
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
