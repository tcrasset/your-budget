import 'package:flutter/material.dart'; 

class TransactionPage extends StatefulWidget{ 
  @override
  State createState() => new TransactionPageState(); 
}
class TransactionPageState extends State<TransactionPage>{ 

  String number = "0.00";
  String currency = "€";
  String input = "";


  @override
  Widget build(BuildContext context) {
    List<Container> containerList= [
          Container(
            alignment: Alignment.centerRight,
            padding: new EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0
            ),
            child: new Text(number + currency, 
                            style: new TextStyle(fontSize: 40.0)
            )
          ),
          
          _createContainer('Payee', 'Select payee'),
          _createContainer('Category', 'Select category'),
          _createContainer('Account', 'Select account'),
          _createContainer('Date', 'Select date'),
          _createContainer('Repeat', 'Never'),
          _createContainer('Memo', 'Optional'),
          _createContainer('Color', 'Default'),
    ];
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Input"),
        ),
        body:Column(
              children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: containerList.length,
                      separatorBuilder: (BuildContext context, int index) => Divider(height:1, color: new Color(0xFFE8E8E8)),
                      itemBuilder: (context, index) {
                        return containerList[index]   ;                   
                      }
                    )
                  ),
                Container (
                  width:325, 
                  child: Column(children: [
                      Row(children: [
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                      ]),

                      Row(children: [
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                      ]),

                      Row(children: [
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                      ]),

                      Row(children: [
                        buildButton("."),
                        buildButton("0"),
                        buildButton("DEL"),
                      ]),

                      Row(children: [
                        buildButton("CLEAR"),
                        buildButton("ACCEPT"),
                      ])
                    ]),
                )
              ]
            ),
    );}

  bool _isNumeric(String str) {
    if(str == null) {
      return false;
    }
    return double.tryParse(str) != null;
  }

  buttonPressed(String buttonText){

    if(buttonText == "CLEAR"){
      input = '';
    }
    else if(buttonText == "DEL"){
      if(number != ''){
        input = number.substring(0,number.length-1);
      }
    }
    else if(_isNumeric(buttonText) || buttonText =='.'){
      input = '$input' '$buttonText';
    }

    setState(() {
      number = input;
    });
  }

  Widget buildButton(String buttonText) {
    return new Expanded(
      child: new OutlineButton(
        padding: new EdgeInsets.all(15.0),
        child: new Text(buttonText,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          ),
          ),
        onPressed: () => buttonPressed(buttonText),
      ),
    );
  }


  Widget _createContainer(String firstFieldName, String secondFieldName){
    TextStyle fadedTextStyle =  TextStyle(
                color: Colors.grey,
                fontSize: 16.0);
    TextStyle titleTextStyle =  TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 16.0);



    return new Container(
            padding: EdgeInsets.symmetric(vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Expanded(
                  child: Text('$firstFieldName',                        
                  textAlign: TextAlign.left,
                  style: titleTextStyle),
                ), 
                Expanded(
                  child: Text('$secondFieldName',                        
                  textAlign: TextAlign.right,
                  style: fadedTextStyle),
                ),             ],
            ),
          );
  }
}

