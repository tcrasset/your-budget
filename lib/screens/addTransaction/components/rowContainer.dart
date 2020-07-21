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
              child: Row(
                children: <Widget>[
                  Expanded(child: childWidget),
                  name == "Date"
                      ? Icon(IconData(59701, fontFamily: 'MaterialIcons'))
                      : Icon(Icons.edit),
                ],
              ),
            ),
          ],
        ),
      ]));
}

// Icon(IconData(58823, fontFamily: 'MaterialIcons'))

// child: Row(
//   children: <Widget>[
//     Expanded(child: childWidget),
//     name == "Date"
//         ? Icon(IconData(59701, fontFamily: 'MaterialIcons'))
//         : Icon(IconData(58823, fontFamily: 'MaterialIcons')),
//   ],
// ),
