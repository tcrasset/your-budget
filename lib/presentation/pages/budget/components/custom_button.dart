// Flutter imports:
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  final double buttonHeight;
  final double buttonWidth;
  final Color buttonColor;
  final Function handleOnPressed;
  final Widget? child;
  const CustomButton(
    this.buttonText,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonColor,
    this.handleOnPressed, [
    this.child,
  ]);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
        ),
        onPressed: () => handleOnPressed(context, buttonText),
        child: child ??
            Text(
              buttonText,
              style: const TextStyle(fontSize: 20.0),
            ),
      ),
    );
  }
}
