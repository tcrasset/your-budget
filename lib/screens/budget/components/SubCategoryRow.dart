import 'package:flutter/material.dart';
import 'package:mybudget/models/categories.dart';
import 'package:flutter/services.dart';
import 'package:mybudget/models/SQLQueries.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

/// Widget containing and displaying the information a subcategory
class SubcategoryRow extends StatefulWidget {
  final SubCategory subcat;
  SubcategoryRow({Key key, @required this.subcat}) : super(key: key);

  @override
  _SubcategoryRowState createState() => _SubcategoryRowState();
}

class _SubcategoryRowState extends State<SubcategoryRow> {
  MoneyMaskedTextController _budgetedController;
  MoneyMaskedTextController _availableController;
  TextEditingController _nameController;

  final TextStyle _subcategoryTextStyle = new TextStyle(color: Colors.black, fontSize: 16.0);
  final TextStyle _greenNumberTextStyle = new TextStyle(color: Colors.green, fontSize: 16.0);
  final TextStyle _redNumberTextStyle = new TextStyle(color: Colors.red, fontSize: 16.0);

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: '${widget.subcat.name}');

    _availableController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');

    _budgetedController = new MoneyMaskedTextController(
        decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
  }

  @override
  void dispose() {
    _availableController.dispose();
    _budgetedController.dispose();
    _nameController.dispose();
    super.dispose();
  }

  //TODO : Update MainCategory budget when subcategory budget is changed
  @override
  Widget build(BuildContext context) {
    print(widget.subcat);
    _budgetedController.updateValue(widget.subcat.budgeted);
    _availableController.updateValue(widget.subcat.available);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
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
            style: _subcategoryTextStyle,
            onFieldSubmitted: (String value) {
              print("Changed available value in subcategory");
              if (_nameController.text != widget.subcat.name) {
                setState(() {
                  widget.subcat.name = _nameController.text;
                  SQLQueryClass.updateSubcategory(widget.subcat);
                });
              }
              ;
            },
          )),
          Expanded(
            child: TextFormField(
              decoration: new InputDecoration.collapsed(
                hintText: "",
              ),
              keyboardType: TextInputType.numberWithOptions(),
              controller: _budgetedController,
              inputFormatters: [LengthLimitingTextInputFormatter(12)], //To remove length counter
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.right,
              style: _subcategoryTextStyle,
              // When the user presses the 'Enter' key, update the respective entry in the database
              onFieldSubmitted: (String value) {
                print("Changed budgeted value in subcategory");
                if (_budgetedController.numberValue != widget.subcat.budgeted) {
                  setState(() {
                    widget.subcat.budgeted = _budgetedController.numberValue;
                  });
                  SQLQueryClass.updateSubcategory(widget.subcat);
                }
              },
            ),
          ),
          Expanded(
            child: TextFormField(
              decoration: new InputDecoration.collapsed(hintText: "${widget.subcat.available}"),
              keyboardType: TextInputType.numberWithOptions(),
              controller: _availableController,
              inputFormatters: [LengthLimitingTextInputFormatter(12)], //To remove length counter
              textInputAction: TextInputAction.done,

              textAlign: TextAlign.right,
              style: widget.subcat.available > 0 ? _greenNumberTextStyle : _redNumberTextStyle,
              // When the user presses the 'Enter' key, update the respective entry in the database
              onFieldSubmitted: (String value) {
                print("Changed available value in subcategory");
                if (_budgetedController.numberValue != widget.subcat.available) {
                  setState(() {
                    widget.subcat.available = _availableController.numberValue;
                  });
                  SQLQueryClass.updateSubcategory(widget.subcat);
                }
              },
            ),
          )
        ],
      ),
    );
  }
  //TODO: Big numbers get cutoff when sending to database (e.g. 50 0004.05 becommes 5000.0, small numbers too !)
  //TODO: Fix numbers not loading from DB --> DB IS NOT THE CULPRIT? THE CONTROLLEr IS
}
