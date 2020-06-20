import 'package:flutter/material.dart';
import 'package:mybudget/models/categories.dart';
import 'package:flutter/services.dart';
import 'package:mybudget/models/SQLQueries.dart';

/// Widget containing and displaying the information of a category
class MainCategoryRow extends StatefulWidget {
  final MainCategory cat;
  MainCategoryRow({Key key, @required this.cat}) : super(key: key);

  @override
  _MainCategoryRowState createState() => _MainCategoryRowState();
}

class _MainCategoryRowState extends State<MainCategoryRow> {
  TextEditingController _nameController;
  final _categoryTextStyle =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16.0);

  final mainCategoryBox = new SizedBox(
    height: 8.0,
    child: new Center(
      child: new Container(
        height: 8.0,
        color: new Color(0xFFE8E8E8),
      ),
    ),
  );

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: '${widget.cat.name}');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        mainCategoryBox,
        Container(
          padding: EdgeInsets.symmetric(vertical: 10),
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: <Widget>[
              Expanded(
                  child: TextFormField(
                decoration: new InputDecoration.collapsed(
                  hintText: "",
                ),
                controller: _nameController,
                textAlign: TextAlign.left,
                inputFormatters: [LengthLimitingTextInputFormatter(25)], //To remove length counter
                textInputAction: TextInputAction.done,
                style: _categoryTextStyle,
                onFieldSubmitted: (String value) {
                  print("Changed available value in subcategory");
                  if (_nameController.text != widget.cat.name) {
                    setState(() {
                      widget.cat.name = _nameController.text;
                    });
                    SQLQueryClass.updateCategory(widget.cat);
                  }
                },
              )),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Budgeted', textAlign: TextAlign.right, style: _categoryTextStyle),
                    Text('${widget.cat.budgeted}',
                        textAlign: TextAlign.right, style: _categoryTextStyle)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Available', textAlign: TextAlign.right, style: _categoryTextStyle),
                    Text('${widget.cat.available}',
                        textAlign: TextAlign.right, style: _categoryTextStyle)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
