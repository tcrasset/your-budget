// Flutter imports:
import 'package:flutter/material.dart';
import 'package:your_budget/domain/category/category.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';

// Widget containing and displaying the information of a category
class MainCategoryRow extends StatelessWidget {
  final String name;
  final double budgeted;
  final double available;
  MainCategoryRow({Key? key, required this.name, required this.budgeted, required this.available})
      : super(key: key);

  final mainCategoryDivider = SizedBox(
    height: 8.0,
    child: Container(
      color: const Color(0xFFE8E8E8),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Divider separating MainCategories
        mainCategoryDivider,
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  name,
                  style: Constants.CATEGORY_TEXT_STYLE,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Budgeted',
                      textAlign: TextAlign.right,
                      style: Constants.CATEGORY_TEXT_STYLE,
                    ),
                    Text(
                      Constants.CURRENCY_FORMAT.format(budgeted),
                      textAlign: TextAlign.right,
                      style: Constants.CATEGORY_TEXT_STYLE,
                    )
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text(
                      'Available',
                      textAlign: TextAlign.right,
                      style: Constants.CATEGORY_TEXT_STYLE,
                    ),
                    Text(
                      Constants.CURRENCY_FORMAT.format(available),
                      textAlign: TextAlign.right,
                      style: Constants.CATEGORY_TEXT_STYLE,
                    )
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
