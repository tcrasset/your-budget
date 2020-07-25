import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double buttonHeight;
  final Color buttonColor;
  final Function handleOnPressed;

  CustomButton(this.buttonText, this.buttonHeight, this.buttonColor, this.handleOnPressed);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.buttonHeight,
      color: buttonColor,
      child: FlatButton(
          onPressed: () => this.handleOnPressed(buttonText),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: 20.0),
          )),
    );
  }
}
