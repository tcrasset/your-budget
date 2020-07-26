import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColor;
  final Function handleOnPressed;
  final Widget child;
  CustomButton(
      this.buttonText, this.buttonHeight, this.buttonWidth, this.buttonColor, this.handleOnPressed,
      [this.child]);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.buttonHeight,
      width: this.buttonWidth,
      child: RaisedButton(
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0)),
          color: buttonColor,
          onPressed: () => this.handleOnPressed(context, buttonText),
          child: this.child ??
              Text(
                buttonText,
                style: TextStyle(fontSize: 20.0),
              )),
    );
  }
}
