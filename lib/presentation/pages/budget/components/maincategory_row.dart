// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import '../../../../models/categories.dart';
import '../../../../models/constants.dart';

// Widget containing and displaying the information of a category
class MainCategoryRow extends StatelessWidget {
  final MainCategory cat;
  MainCategoryRow({Key key, @required this.cat}) : super(key: key);

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
                cat.name,
                style: Constants.CATEGORY_TEXT_STYLE,
              )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Budgeted',
                        textAlign: TextAlign.right, style: Constants.CATEGORY_TEXT_STYLE),
                    Text(cat.budgeted.toStringAsFixed(2),
                        textAlign: TextAlign.right, style: Constants.CATEGORY_TEXT_STYLE)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Available',
                        textAlign: TextAlign.right, style: Constants.CATEGORY_TEXT_STYLE),
                    Text(cat.available.toStringAsFixed(2),
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
