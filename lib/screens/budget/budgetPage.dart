import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/screens/budget/ModifyCategories.dart';
import 'package:mybudget/screens/budget/budgetPageState.dart';
import 'package:mybudget/screens/budget/components/MainCategoryRow.dart';
import 'package:mybudget/screens/budget/components/SubCategoryRow.dart';
import 'package:mybudget/screens/budget/components/buttonDial.dart';
import 'package:provider/provider.dart';

class BudgetPage extends StatefulWidget {
  final String title;

  const BudgetPage({Key key, this.title}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  bool showMenu = true;

  void handleSettings() {}

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
                  IconButton(
                    icon: Icon(FontAwesomeIcons.bars),
                    onPressed: handleSettings,
                  ),
                ],
              ),
            )
          ],
        ),
        body: Column(children: <Widget>[
          _DateButtons(), //
          _ToBeBudgeted(),
          Expanded(child: _CategoriesList()),

          buttonDialState.showButtonDial
              ? ButtonDial(MediaQuery.of(context).size.height * 0.25,
                  MediaQuery.of(context).size.width * 0.6)
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
          final item = categories[index];
          return (item is MainCategory) ? MainCategoryRow(cat: item) : SubcategoryRow(subcat: item);
        },
      ),
    );
  }
}

class _ToBeBudgeted extends StatelessWidget {
  final TextStyle _textStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25.0);

  final TextStyle _positiveAmountTextStyle = new TextStyle(color: Colors.green, fontSize: 32.0);
  final TextStyle _negativeAmountTextStyle = new TextStyle(color: Colors.red, fontSize: 32.0);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: Row(
          children: [
            Expanded(
                child: Text(
              "To be budgeted",
              style: _textStyle,
            )),
            Consumer<AppState>(
              builder: (context, appState, child) {
                return Text(
                  appState.toBeBudgeted?.toStringAsFixed(2) ?? "0.00" + " €",
                  style: appState.toBeBudgeted >= 0
                      ? _positiveAmountTextStyle
                      : _negativeAmountTextStyle,
                );
              },
            )
          ],
        ));
  }
}

class _DateButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppState>(builder: (_, appState, __) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(icon: Icon(Icons.arrow_back), onPressed: appState.decrementMonth),
          Text("${appState.currentBudget.monthAsString} ${appState.currentBudget.year}",
              style: TextStyle(fontSize: 20)),
          IconButton(icon: Icon(Icons.arrow_forward), onPressed: appState.incrementMonth)
        ],
      );
    });
  }
}
