// Flutter imports:
import 'package:flutter/material.dart';

Container rowContainer(String name, Widget childWidget) {
  return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Row(
          children: <Widget>[
            Expanded(
              child: Text(name,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0)),
            ),
            Expanded(
              flex: 2,
              child: Row(
                children: <Widget>[
                  Expanded(child: childWidget),
                  if (name == "Date") const Icon(Icons.date_range) else const Icon(Icons.edit),
                ],
              ),
            ),
          ],
        ),
      ]));
}
