// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/about/about_screen.dart';
import 'package:your_budget/presentation/pages/budget/budget_page_state.dart';
import 'package:your_budget/presentation/pages/budget/components/button_dial.dart';
import 'package:your_budget/presentation/pages/budget/components/categories_list.dart';
import 'package:your_budget/presentation/pages/budget/components/date_button.dart';
import 'package:your_budget/presentation/pages/budget/components/to_be_budgeted.dart';
import 'package:your_budget/presentation/pages/modifyCategories/modify_categories.dart';

class BudgetPage extends StatefulWidget {
  final String title;

  const BudgetPage({Key key, this.title}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  bool showMenu = true;

  //TODO: Settings
  void handleSettings() {}

  Future<void> handlePopUpMenuButtonSelected(String selectedItem) async {
    if (selectedItem == "About") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutPage()));
    }
  }

  void handleModifyCategories() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => ModifyCategories()));
  }

  @override
  Widget build(BuildContext context) {
    final BudgetPageState buttonDialState =
        Provider.of<BudgetPageState>(context);
    final ButtonDial buttonDial = buttonDialState.showButtonDial
        ? ButtonDial(MediaQuery.of(context).size.height * 0.3,
            MediaQuery.of(context).size.width * 0.6)
        : null;

    print("Budget page build");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Constants.PRIMARY_COLOR,
          leading: const Icon(Constants.BUDGET_ICON),
          actions: <Widget>[
            SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.checkSquare),
                    onPressed: handleModifyCategories,
                  ),
                  PopupMenuButton(
                    onSelected: handlePopUpMenuButtonSelected,
                    itemBuilder: (context) => [
                      const PopupMenuItem<String>(
                        value: "About",
                        child: Text("About"),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(children: <Widget>[
          DateButtons(), //
          ToBeBudgeted(),
          Expanded(child: CategoriesList()),
          if (buttonDial != null) buttonDial
        ]));
  }
}
