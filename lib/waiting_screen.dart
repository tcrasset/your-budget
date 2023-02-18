// Flutter imports:
import 'package:flutter/material.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ColoredBox(
          color: Constants.PRIMARY_COLOR,
          child: Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Constants.SECONDARY_COLOR),
            ),
          ),
        ),
      ),
    );
  }
}
