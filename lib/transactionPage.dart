import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/database_creator.dart'; 

class TransactionPage extends StatefulWidget{ 
  @override
  State createState() => new TransactionPageState(); 
}
class TransactionPageState extends State<TransactionPage>{ 

  MoneyMaskedTextController _amountController;
  final TextStyle _amountTextStyle = new TextStyle(color: Colors.black, fontSize: 32.0);

  @override
  void initState() {
    super.initState(); 
    _amountController = new MoneyMaskedTextController(
      decimalSeparator: '.', thousandSeparator: ' ', rightSymbol: ' \€');
      }

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    List<Widget> containerList= [
      Container(
        height: 50,
        alignment: Alignment.centerRight,
        padding: new EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        child: TextFormField(
          decoration: new InputDecoration.collapsed(hintText: "",),
          keyboardType: TextInputType.number,
          controller: _amountController,
          inputFormatters: [LengthLimitingTextInputFormatter(12)],
          textInputAction: TextInputAction.done,
          textAlign: TextAlign.right,
          style: _amountTextStyle,
        )
      ),

      TransactionContainer(name:'Payee',defaultValue: 'Select hhh'),
      TransactionContainer(name:'Account',defaultValue: 'Select account',listIndex:1),
      TransactionContainer(name:'Category',defaultValue: 'Select category',listIndex:2),
      TransactionContainer(name:'Date', defaultValue: 'Select date'),
      TransactionContainer(name:'Repeat', defaultValue: 'Never'),
      TransactionContainer(name:'Memo', defaultValue: 'Optional'),
      TransactionContainer(name:'Color', defaultValue: 'Default'),
    ];

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("New transaction"),
      ),
      // Contains a list of fields such as Payee, Category, etc...
      body: Container(
        height: 350,
          child: ListView.separated(
            shrinkWrap: true,
            itemCount: containerList.length,
            separatorBuilder: (BuildContext context, int index) => Divider(height:1, color: Colors.black12),
            itemBuilder: (context, index) {
              return containerList[index]   ;                   
            }
          )
      ),
    );
  }
}

class TransactionContainer extends StatefulWidget {

    final String name;
    final defaultValue;
    final int listIndex;
    TransactionContainer({Key key, @required this.name, @required this.defaultValue,
                              this.listIndex}) : super(key: key);

  @override
  _TransactionContainerState createState() => _TransactionContainerState();
}


class _TransactionContainerState extends State<TransactionContainer> {

  TextEditingController _dropdownEntriesController;
  TextEditingController _valueController;
  String filter;

  final TextStyle fadedTextStyle =  TextStyle(
              color: Colors.grey,
              fontSize: 16.0);
  final TextStyle titleTextStyle =  TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16.0);

  @override
  void initState(){

    super.initState();
    _valueController = new TextEditingController(text:'${widget.defaultValue}');
    _dropdownEntriesController = new TextEditingController();
      
    //fill dropDownEntries with objects
    _dropdownEntriesController.addListener(() {
      setState(() {
        filter = _dropdownEntriesController.text;
      });
    });
  }

  @override
  void dispose(){
    _valueController.dispose();
    _dropdownEntriesController.dispose();
    super.dispose();
  }

  // Dropdown ListView for the value of the TransactionContainer
  Widget _buildListView() {
    return FutureBuilder(
      future: Future.wait([
        SQLQueries.getPayees(),
        SQLQueries.getAccounts(),
        SQLQueries.getSubCategories(),
      ]),
      builder: (context, dropDownEntries) {
        // If future not completed, return container
        if (dropDownEntries.connectionState == ConnectionState.none &&
            dropDownEntries.hasData == null) {
          return Container();
        }
        // Else return listview object
        return ListView.builder(
          itemCount: dropDownEntries.data.length,
          itemBuilder: (BuildContext context, int i) {
            var entry = dropDownEntries.data[widget.listIndex][0];
            if (filter == null || filter == "") {
              return new ListTile(title: Text(entry.name));
            } else {
              if (entry.name .toLowerCase().contains(filter.toLowerCase())) { 
              return new ListTile(title: Text(entry.name));
              } else {
                return new Container();
              }
            }
          }
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Text(widget.name,
            textAlign: TextAlign.left,
            style: titleTextStyle),
          ), 
          Expanded(
            child:
              TextFormField(
                decoration: new InputDecoration.collapsed(hintText: "\n",),
                controller: _valueController,
                textAlign: TextAlign.left,
                inputFormatters: [LengthLimitingTextInputFormatter(12)], //To remove length counter
                textInputAction: TextInputAction.done,
                style: fadedTextStyle,
              )
          ),
              // Expanded(
              //   child: new Padding(
              //       padding: new EdgeInsets.only(top: 1.0),
              //       child: _buildListView()),
              // )
        ],
      )
    );
  }
}

