import 'package:flutter/material.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';
import 'package:your_budget/screens/budget/budgetPageState.dart';
import 'package:your_budget/screens/budget/components/customButton.dart';
import 'package:provider/provider.dart';

class ButtonDial extends StatelessWidget {
  final double height;
  final double width;
  const ButtonDial(this.height, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.PRIMARY_COLOR,
      // color: Colors.grey[900],
      height: this.height,
      // width: MediaQuery.of(context).size.width + 60,

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
        color: Constants.PRIMARY_COLOR,
        // color: Constants.PRIMARY_COLOR,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CustomButton("7", 50, 50, Colors.white, buttonPressed),
              CustomButton("4", 50, 50, Colors.white, buttonPressed),
              CustomButton("1", 50, 50, Colors.white, buttonPressed),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CustomButton("8", 50, 50, Colors.white, buttonPressed),
              CustomButton("5", 50, 50, Colors.white, buttonPressed),
              CustomButton("2", 50, 50, Colors.white, buttonPressed),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CustomButton("9", 50, 50, Colors.white, buttonPressed),
              CustomButton("6", 50, 50, Colors.white, buttonPressed),
              CustomButton("3", 50, 50, Colors.white, buttonPressed),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    "Remove",
                    50,
                    50,
                    Colors.white,
                    buttonPressed,
                    Icon(
                      Icons.backspace,
                      color: Constants.SECONDARY_COLOR,
                    )),
                CustomButton(
                    "Done",
                    50,
                    50,
                    Colors.white,
                    buttonPressed,
                    Icon(
                      Icons.done,
                      color: Constants.SECONDARY_COLOR,
                    )),
                CustomButton("0", 50, 50, Colors.white, buttonPressed),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    "Goals",
                    82.5,
                    77,
                    Constants.SECONDARY_COLOR,
                    buttonPressed,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.fiber_new), Text("Goals")])),
                CustomButton(
                    "Budget",
                    82.5,
                    77,
                    Constants.SECONDARY_COLOR,
                    buttonPressed,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Constants.BUDGET_ICON), Text("Budget")])),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(
                    "More",
                    50.5,
                    65,
                    Constants.SECONDARY_COLOR,
                    buttonPressed,
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Icon(Icons.more_horiz), Text("More")])),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void buttonPressed(BuildContext context, String buttonText) {
  BudgetPageState buttonDialState = Provider.of<BudgetPageState>(context, listen: false);
  if (isNumeric(buttonText)) {
    buttonDialState.addDigit(buttonText);
  } else if (buttonText == "Done") {
    //Done
    buttonDialState.submitValue(context);
  } else if (buttonText == "Remove") {
    //Done
    buttonDialState.removeDigit();
  }
}
