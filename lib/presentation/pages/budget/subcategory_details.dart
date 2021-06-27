// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../appstate.dart';
import '../../../models/categories.dart';
import '../../../models/goal.dart';
import '../../../models/utils.dart';

class SubcategoryDetails extends StatelessWidget {
  final SubCategory subcat;
  const SubcategoryDetails({Key? key, required this.subcat}) : super(key: key);

  List<Widget> createListOfGoals(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
    final List<GoalRow> goalWidgets = [];
    final List<Goal> goals =
        appState.goals.where((goal) => goal.correspondingSubcategoryId == subcat.id).toList();

    goals.forEach((goal) {
      goalWidgets.add(GoalRow(goal));
    });

    return goalWidgets;
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> items = [];

    items.add(Information(subcat));
    items.add(SizedBox(
      child: Container(
        height: 20,
      ),
    ));
    items.add(const GoalRowsTitle());
    items.addAll(createListOfGoals(context));

    return Scaffold(
        appBar: AppBar(
          title: Text(subcat.name!),
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

  const Information(this.subcat, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context);
    return SizedBox(
      height: 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InformationRow("Budgeted", subcat.budgeted!),
          InformationRow("Available", subcat.available!),
          InformationRow("Average budgeted", appState.computeAverageBudgeted(subcat.id)),
          InformationRow("Last month budgeted", appState.computeLastMonthBudgeted(subcat.id)!),
        ],
      ),
    );
  }
}

class InformationRow extends StatelessWidget {
  final String title;
  final double value;
  const InformationRow(
    this.title,
    this.value, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle titleStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Row(
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: titleStyle,
          ),
        ),
        Expanded(
            child: Text(
          value.toStringAsFixed(2) + " €",
          style: titleStyle,
          textAlign: TextAlign.right,
        ))
      ],
    );
  }
}

class GoalRow extends StatelessWidget {
  final Goal goal;
  const GoalRow(this.goal, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(goalTypeNames[goal.goalType!.index]),
          Text("${goal.amount} €"),
          Text("${monthStringFromDate(DateTime(goal.year!, goal.month!))} ${goal.year}")
        ],
      ),
    );
  }
}

class GoalRowsTitle extends StatelessWidget {
  const GoalRowsTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const TextStyle subtitlesStyle = TextStyle(fontWeight: FontWeight.bold);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
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
              const Text("Goal Type", textAlign: TextAlign.left, style: subtitlesStyle),
              const Text("Amount", textAlign: TextAlign.left, style: subtitlesStyle),
              const Text("Date", textAlign: TextAlign.left, style: subtitlesStyle)
            ],
          ),
        ),
      ],
    );
  }
}
