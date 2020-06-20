import 'package:flutter/material.dart';

Container rowContainer(String name, Widget childWidget) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Text(name,
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0)),
            ),
            Expanded(
              child: childWidget,
            ),
          ],
        ),
      ]));
}
