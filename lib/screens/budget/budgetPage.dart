import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/screens/modifyCategories/ModifyCategories.dart';
import 'package:your_budget/screens/about/aboutScreen.dart';
import 'package:your_budget/screens/budget/budgetPageState.dart';
import 'package:your_budget/screens/budget/components/MainCategoryRow.dart';
import 'package:your_budget/screens/budget/components/SubCategoryRow.dart';
import 'package:your_budget/screens/budget/components/buttonDial.dart';
import 'package:your_budget/screens/budget/components/toBeBudgeted.dart';
import 'package:your_budget/screens/budget/components/dateButtons.dart';
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
  void handleSettings() {
  }

  void handlePopUpMenuButtonSelected(String selectedItem) async {
    if (selectedItem == "About") {
      await Navigator.push(
          context, MaterialPageRoute(builder: (context) => AboutPage()));
    }
  }

  void handleModifyCategories() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyCategories()));
  }

  @override
  Widget build(BuildContext context) {
    BudgetPageState buttonDialState = Provider.of<BudgetPageState>(context);
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
          Expanded(child: _CategoriesList()),

          buttonDialState.showButtonDial
              ? ButtonDial(
                  MediaQuery.of(context).size.height * 0.3, MediaQuery.of(context).size.width * 0.6)
              : ButtonDial(0, 0),
        ]));
  }
}

class _CategoriesList extends StatefulWidget {
  @override
  __CategoriesListState createState() => __CategoriesListState();
}

class __CategoriesListState extends State<_CategoriesList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
    final List<Category> categories = appState.allCategories;

    if (categories.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: ListView.separated(
        controller: _scrollController,
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) =>
            Divider(height: 1, color: Colors.black12),
        itemBuilder: (context, index) {
          var item = categories[index];
          return (item is MainCategory) ? MainCategoryRow(cat: item) : SubcategoryRow(subcat: item);
        },
      ),
    );
  }
}
