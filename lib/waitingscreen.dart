import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WaitingScreen extends StatelessWidget {
  const WaitingScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(child: Center(child: CircularProgressIndicator())),
      ),
    );
  }
}
