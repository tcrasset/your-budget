import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/components/rowContainer.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/models/goal.dart';
import 'package:mybudget/models/utils.dart';
import 'package:provider/provider.dart';

class AddGoal extends StatefulWidget {
  final String subcategoryName;

  const AddGoal({Key key, this.subcategoryName}) : super(key: key);
  @override
  _AddGoalController createState() => _AddGoalController();
}

class _AddGoalController extends State<AddGoal> {
  GlobalKey _goalFormKey;
  DateTime _date;

  String datePlaceHolder = "Choose a date";
  Object amountPlaceHolder = "Choose an amount";
  GoalType goalType;
  List<String> goalTypeNames = ["Target amount", "Target amount by date", "Monthly goal"];
  Goal testGoal =
      Goal(1, "Test", GoalType.MonthyGoal, 100.0, DateTime.now().month, DateTime.now().year);

  String _amountFieldName;
  String _dateFieldName;

  double amount;

  @override
  void initState() {
    _date = DateTime.now();
    _dateFieldName = datePlaceHolder;
    _amountFieldName = amountPlaceHolder;
    super.initState();
  }

  @override
  Widget build(BuildContext context) => _AddGoalView(this);

  void handleSelectDate() async {
    print("Select date");
    DateTime now = DateTime.now();
    final DateTime picked = await showMonthPicker(
      context: context,
      initialDate: getDateYMD(_date),
      firstDate: DateTime(now.year, now.month),
      lastDate: Jiffy(DateTime(now.year, now.month)).add(months: Constants.MAX_NB_MONTHS_AHEAD),
    );

    if (picked != null && picked != _date) {
      setState(() {
        _date = picked;
        _dateFieldName = "${monthStringFromDate(picked)} ${picked.year}";
      });
    }
  }

  void handleSelectType() {}

  void handleOnGoalTypeChange(GoalType selectedGoalType) {
    setState(() {
      goalType = selectedGoalType;
    });
  }

  void handleSelectAmount(String selectedAmount) {
    setState(() {
      amount = double.parse(selectedAmount);
    });
  }
}

class _AddGoalView extends WidgetView<AddGoal, _AddGoalController> {
  _AddGoalView(_AddGoalController state) : super(state);
  final TextStyle selectedChildTextStyle = TextStyle(color: Colors.black, fontSize: 16.0);
  final TextStyle defaultChildTextStyle =
      TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Add a goal to subcategory ${widget.subcategoryName}"),
        ),
        body: SingleChildScrollView(
            child: Container(
          child: Column(
            children: <Widget>[
              Form(
                key: state._goalFormKey,
                child: Column(
                  children: <Widget>[
                    rowContainer(
                        "Goal Type",
                        DropdownButton<GoalType>(
                          value: state.goalType,
                          onChanged: state.handleOnGoalTypeChange,
                          items:
                              GoalType.values.map<DropdownMenuItem<GoalType>>((GoalType goalType) {
                            return DropdownMenuItem<GoalType>(
                              value: goalType,
                              child: Text(
                                state.goalTypeNames[goalType.index],
                                style: TextStyle(fontSize: 12),
                              ),
                            );
                          }).toList(),
                        )),
                    rowContainer(
                      "Amount",
                      TextField(
                        decoration: InputDecoration.collapsed(
                            hintText: state._amountFieldName, hintStyle: defaultChildTextStyle),
                        keyboardType: TextInputType.number,
                        onChanged: state.handleSelectAmount,
                      ),
                    ),
                    GestureDetector(
                        onTap: state.handleSelectDate,
                        child: rowContainer(
                            "Date",
                            Text(state._dateFieldName,
                                style: (state._dateFieldName == state.datePlaceHolder)
                                    ? defaultChildTextStyle
                                    : selectedChildTextStyle)))
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
