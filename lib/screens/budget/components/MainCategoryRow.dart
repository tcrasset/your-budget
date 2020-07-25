import 'package:flutter/material.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/screens/budget/budgetPageState.dart';
import 'package:provider/provider.dart';

// Widget containing and displaying the information of a category
class MainCategoryRow extends StatelessWidget {
  final MainCategory cat;
  MainCategoryRow({Key key, @required this.cat}) : super(key: key);

  final mainCategoryDivider = SizedBox(
    height: 8.0,
    child: new Container(
      color: new Color(0xFFE8E8E8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Divider separating MainCategories
        mainCategoryDivider,
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                cat.name,
                style: Constants.CATEGORY_TEXT_STYLE,
              )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Budgeted',
                        textAlign: TextAlign.right, style: Constants.CATEGORY_TEXT_STYLE),
                    Text('${cat.budgeted.toStringAsFixed(2)}',
                        textAlign: TextAlign.right, style: Constants.CATEGORY_TEXT_STYLE)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Available',
                        textAlign: TextAlign.right, style: Constants.CATEGORY_TEXT_STYLE),
                    Text('${cat.available.toStringAsFixed(2)}',
                        textAlign: TextAlign.right, style: Constants.CATEGORY_TEXT_STYLE)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
