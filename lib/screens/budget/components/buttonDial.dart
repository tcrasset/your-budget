import 'package:flutter/material.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/utils.dart';
import 'package:your_budget/screens/budget/budgetPageState.dart';
import 'package:your_budget/screens/budget/components/customButton.dart';
import 'package:provider/provider.dart';

class ButtonDial extends StatelessWidget {
  final double height;
  final double width;
  final double buttonHeight = 55.0;
  final double buttonWidth = 55.0;
  const ButtonDial(this.height, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Constants.PRIMARY_COLOR,
      // color: Colors.grey[900],
      height: this.height,
      // width: MediaQuery.of(context).size.width + 60,

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.20),
        color: Constants.PRIMARY_COLOR,
        // color: Constants.PRIMARY_COLOR,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CustomButton("7", buttonHeight, buttonWidth, Colors.white, buttonPressed),
              CustomButton("4", buttonHeight, buttonWidth, Colors.white, buttonPressed),
              CustomButton("1", buttonHeight, buttonWidth, Colors.white, buttonPressed),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CustomButton("8", buttonHeight, buttonWidth, Colors.white, buttonPressed),
              CustomButton("5", buttonHeight, buttonWidth, Colors.white, buttonPressed),
              CustomButton("2", buttonHeight, buttonWidth, Colors.white, buttonPressed),
            ]),
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              CustomButton("9", buttonHeight, buttonWidth, Colors.white, buttonPressed),
              CustomButton("6", buttonHeight, buttonWidth, Colors.white, buttonPressed),
              CustomButton("3", buttonHeight, buttonWidth, Colors.white, buttonPressed),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomButton(
                    "Remove",
                    buttonHeight,
                    buttonWidth,
                    Colors.white,
                    buttonPressed,
                    Icon(
                      Icons.backspace,
                      color: Constants.SECONDARY_COLOR,
                    )),
                CustomButton(
                    "Done",
                    buttonHeight,
                    buttonWidth,
                    Colors.white,
                    buttonPressed,
                    Icon(
                      Icons.done,
                      color: Constants.SECONDARY_COLOR,
                    )),
                CustomButton("0", buttonHeight, buttonWidth, Colors.white, buttonPressed),
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
