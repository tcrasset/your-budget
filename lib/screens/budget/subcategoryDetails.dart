import 'package:flutter/material.dart';

class SubcategoryDetails extends StatelessWidget {
  final String subcategoryName;
  const SubcategoryDetails({Key key, this.subcategoryName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("$subcategoryName"),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Center(child: Text("Subcategory details")),
          ),
        ));
  }
}
