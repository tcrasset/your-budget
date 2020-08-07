import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jiffy/jiffy.dart';
import 'package:month_picker_dialog/month_picker_dialog.dart';
import 'package:mybudget/components/rowContainer.dart';
import 'package:mybudget/components/widgetViewClasses.dart';
import 'package:mybudget/models/constants.dart';
import 'package:mybudget/models/goal.dart';
import 'package:mybudget/models/utils.dart';

class AddGoal extends StatefulWidget {
  final String subcategoryName;

  const AddGoal({Key key, this.subcategoryName}) : super(key: key);
  @override
  _AddGoalController createState() => _AddGoalController();
}

class _AddGoalController extends State<AddGoal> {
  final _goalFormKey = GlobalKey<FormState>();
  final TextEditingController dateController = TextEditingController();
  GoalType goalType;
  DateTime _date;
  double amount;

  @override
  Widget build(BuildContext context) => _AddGoalView(this);

  void handleSelectDate() async {
    print("Select date");
    DateTime now = DateTime.now();
    final DateTime picked = await showMonthPicker(
      context: context,
      initialDate: getDateYMD(DateTime.now()),
      firstDate: DateTime(now.year, now.month),
      lastDate: Jiffy(DateTime(now.year, now.month)).add(months: Constants.MAX_NB_MONTHS_AHEAD),
    );

    if (picked != null) {
      setState(() {
        _date = picked;
        dateController.text = "${monthStringFromDate(picked)} ${picked.year}";
      });
    }
  }

  void handleOnGoalTypeChange(GoalType selectedGoalType) {
    _goalFormKey.currentState.validate();
    setState(() {
      goalType = selectedGoalType;
    });
  }

  void handleSelectAmount(String selectedAmount) {
    _goalFormKey.currentState.validate();

    setState(() {
      amount = double.parse(selectedAmount);
    });
  }

  void handleCreateGoal() {
    if (_goalFormKey.currentState.validate()) {
      print("Creating new goal");
      Goal newGoal = Goal(1, goalType, amount, _date.month, _date.year);
      print(newGoal);
    }
  }

  //TODO: Add custom keyboard to goals
  String validateAmountField(String value) {
    if (isNumeric(value) && !double.parse(value).isNegative) return null;
    return "Amount must be a valid non-negative value";
  }

  String validateGoalTypeField(GoalType goalType) {
    if (goalType == null) {
      return "Select the goal type";
    }
    return null;
  }

  String handleValidateDate(String value) {
    print("Validate date");
    print(value);
    if (_date == null) {
      return "Select a date";
    }
    return null;
  }
}

class _AddGoalView extends WidgetView<AddGoal, _AddGoalController> {
  _AddGoalView(_AddGoalController state) : super(state);
  final TextStyle selectedChildTextStyle = TextStyle(color: Colors.black, fontSize: 16.0);
  final TextStyle defaultChildTextStyle =
      TextStyle(color: Colors.grey, fontStyle: FontStyle.italic, fontSize: 16.0);
  final List<String> goalTypeNames = ["Target amount", "Target amount by date", "Monthly goal"];

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
                        DropdownButtonFormField<GoalType>(
                          value: state.goalType,
                          hint: Text(
                            "Choose a goal type",
                            style: defaultChildTextStyle,
                          ),
                          onChanged: state.handleOnGoalTypeChange,
                          validator: state.validateGoalTypeField,
                          decoration: InputDecoration.collapsed(hintText: ''),
                          iconEnabledColor: Colors.white,
                          items:
                              GoalType.values.map<DropdownMenuItem<GoalType>>((GoalType goalType) {
                            return DropdownMenuItem<GoalType>(
                              value: goalType,
                              child: Text(goalTypeNames[goalType.index],
                                  style: selectedChildTextStyle),
                            );
                          }).toList(),
                        )),
                    rowContainer(
                      "Amount",
                      TextFormField(
                        decoration: InputDecoration.collapsed(
                            hintText: "Choose an amount", hintStyle: defaultChildTextStyle),
                        keyboardType: TextInputType.number,
                        onChanged: state.handleSelectAmount,
                        inputFormatters: [FilteringTextInputFormatter.allow(RegExp("[0-9\.]"))],
                        validator: state.validateAmountField,
                      ),
                    ),
                    if (state.goalType != null && state.goalType == GoalType.TargetAmountByDate)
                      GestureDetector(
                          onTap: state.handleSelectDate,
                          child: rowContainer(
                              "Date",
                              TextFormField(
                                  readOnly: true,
                                  enabled: false,
                                  decoration: InputDecoration.collapsed(
                                      hintText: "Choose a date", hintStyle: defaultChildTextStyle),
                                  validator: state.handleValidateDate,
                                  controller: state.dateController,
                                  style: selectedChildTextStyle))),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        color: Theme.of(context).accentColor,
                        onPressed: state.handleCreateGoal,
                        child: Text(
                          'Add goal',
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
