// Flutter imports:
import 'package:flutter/material.dart';

class RowContainer extends StatelessWidget {
  final String name;

  final Widget childWidget;
  const RowContainer({
    Key key,
    @required this.name,
    @required this.childWidget,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
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
        ],
      ),
    );
  }
}
