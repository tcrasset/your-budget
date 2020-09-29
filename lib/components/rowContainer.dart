import 'package:flutter/material.dart';

Container rowContainer(String name, Widget childWidget) {
  return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Text(name,
                  textAlign: TextAlign.left,
                  style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0)),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(child: childWidget),
                  name == "Date" ? Icon(Icons.date_range) : Icon(Icons.edit),
                ],
              ),
            ),
          ],
        ),
      ]));
}
