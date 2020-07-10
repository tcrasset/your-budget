import 'package:flutter/material.dart';
import 'package:mybudget/appState.dart';
import 'package:mybudget/models/categories.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

// Widget containing and displaying the information of a category

class MainCategoryRow extends StatefulWidget {
  final MainCategory cat;
  MainCategoryRow({Key key, @required this.cat}) : super(key: key);

  @override
  _MainCategoryRowState createState() => _MainCategoryRowState();
}

class _MainCategoryRowState extends State<MainCategoryRow> {
  AppState appState;

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
    appState = Provider.of(context, listen: false);
    _nameController = new TextEditingController(text: '${widget.cat.name}');
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  handleMainCategoryNameChange() {
    //TODO : On focus lost, put back old value
    if (_nameController.text != widget.cat.name) {
      print("Changed name of category from ${widget.cat.name} to ${_nameController.text}");
      setState(() {
        widget.cat.name = _nameController.text;
      });
      appState.updateCategoryName(widget.cat);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // Divider separating MainCategories
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
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(25)
                      ], //To remove length counter
                      textInputAction: TextInputAction.done,
                      style: _categoryTextStyle,
                      onFieldSubmitted: (value) => handleMainCategoryNameChange())),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Budgeted', textAlign: TextAlign.right, style: _categoryTextStyle),
                    Text('${widget.cat.budgeted.toStringAsFixed(2)}',
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
                    Text('${widget.cat.available.toStringAsFixed(2)}',
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
