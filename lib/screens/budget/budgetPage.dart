import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/screens/modifyCategories/ModifyCategories.dart';
import 'package:your_budget/screens/about/aboutScreen.dart';
import 'package:your_budget/screens/budget/budgetPageState.dart';
import 'package:your_budget/screens/budget/components/buttonDial.dart';
import 'package:your_budget/screens/budget/components/toBeBudgeted.dart';
import 'package:your_budget/screens/budget/components/dateButtons.dart';
import 'package:your_budget/screens/budget/components/categoriesList.dart';
import 'package:provider/provider.dart';

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

  void handlePopUpMenuButtonSelected(String selectedItem) async {
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
    BudgetPageState buttonDialState = Provider.of<BudgetPageState>(context);
    ButtonDial buttonDial = buttonDialState.showButtonDial
        ? ButtonDial(MediaQuery.of(context).size.height * 0.3,
            MediaQuery.of(context).size.width * 0.6)
        : null;

    print("Budget page build");
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Constants.PRIMARY_COLOR,
          leading: Icon(Constants.BUDGET_ICON),
          actions: <Widget>[
            Container(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: Icon(FontAwesomeIcons.checkSquare),
                    onPressed: handleModifyCategories,
                  ),
                  PopupMenuButton(
                    onSelected: handlePopUpMenuButtonSelected,
                    itemBuilder: (context) => [
                      PopupMenuItem<String>(
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
