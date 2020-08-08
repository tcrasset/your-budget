import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:mybudget/models/goal.dart';
import 'package:mybudget/models/utils.dart';
import 'package:provider/provider.dart';

class SubcategoryDetails extends StatelessWidget {
  final SubCategory subcat;
  const SubcategoryDetails({Key key, this.subcat}) : super(key: key);

  List<Widget> createListOfGoals(BuildContext context) {
    AppState appState = Provider.of<AppState>(context);
    List<GoalRow> goalWidgets = [];
    List<Goal> goals =
        appState.goals.where((goal) => goal.correspondingSubcategoryId == subcat.id).toList();

    goals.forEach((goal) {
      goalWidgets.add(GoalRow(goal));
    });

    return goalWidgets;
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> items = [];

    items.add(Information(subcat));
    items.add(SizedBox(
      child: Container(
        height: 20,
      ),
    ));
    items.add(GoalRowsTitle());
    items.addAll(createListOfGoals(context));

    return Scaffold(
        appBar: AppBar(
          title: Text("${subcat.name}"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              color: Colors.red,
              child: Center(
                child: Column(children: items),
              ),
            ),
          ),
        ));
  }
}

class Information extends StatelessWidget {
  final SubCategory subcat;

  Information(this.subcat, {Key key}) : super(key: key);
  final TextStyle titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  "Budgeted",
                  style: titleStyle,
                ),
              ),
              Expanded(
                  child: Text(
                "${subcat.budgeted} €",
                style: titleStyle,
                textAlign: TextAlign.right,
              ))
            ],
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                "Available",
                style: titleStyle,
              )),
              Expanded(
                  child: Text(
                "${subcat.available} €",
                style: titleStyle,
                textAlign: TextAlign.right,
              ))
            ],
          ),
        ],
      ),
    );
  }
}

class GoalRow extends StatelessWidget {
  final Goal goal;
  const GoalRow(this.goal, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text("${goalTypeNames[goal.goalType.index]}"),
          Text("${goal.amount} €"),
          Text("${monthStringFromDate(DateTime(goal.year, goal.month))} ${goal.year}")
        ],
      ),
    );
  }
}

class GoalRowsTitle extends StatelessWidget {
  GoalRowsTitle({Key key}) : super(key: key);

  final TextStyle subtitlesStyle = TextStyle(fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Goals",
            textAlign: TextAlign.left,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 2,
            child: Container(
              color: Colors.black,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Goal Type", textAlign: TextAlign.left, style: subtitlesStyle),
                Text("Amount", textAlign: TextAlign.left, style: subtitlesStyle),
                Text("Date", textAlign: TextAlign.left, style: subtitlesStyle)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
