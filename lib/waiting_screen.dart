// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import 'models/constants.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          color: Constants.PRIMARY_COLOR,
          child: const Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Constants.SECONDARY_COLOR),
            ),
          ),
        ),
      ),
    );
  }
}
