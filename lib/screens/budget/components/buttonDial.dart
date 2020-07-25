import 'package:flutter/material.dart';
import 'package:mybudget/screens/budget/components/customButton.dart';

class ButtonDial extends StatelessWidget {
  final double height;
  final double width;
  const ButtonDial(this.height, this.width, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      // color: Colors.grey[900],
      height: this.height,
      // width: MediaQuery.of(context).size.width + 60,

      child: Container(
        margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1),
        color: Colors.green[800],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomButton("B", 40, Colors.blueAccent, buttonPressed),
                CustomButton("G", 40, Colors.redAccent, buttonPressed)
              ],
            ),
            Table(
              border: TableBorder.all(),
              children: [
                TableRow(children: [
                  CustomButton("7", 40, Colors.white, buttonPressed),
                  CustomButton("8", 40, Colors.white, buttonPressed),
                  CustomButton("9", 40, Colors.white, buttonPressed),
                ]),
                TableRow(children: [
                  CustomButton("4", 40, Colors.white, buttonPressed),
                  CustomButton("5", 40, Colors.white, buttonPressed),
                  CustomButton("6", 40, Colors.white, buttonPressed),
                ]),
                TableRow(children: [
                  CustomButton("1", 40, Colors.white, buttonPressed),
                  CustomButton("2", 40, Colors.white, buttonPressed),
                  CustomButton("3", 40, Colors.white, buttonPressed),
                ]),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void buttonPressed(String buttonText) {
  print(buttonText);
}
