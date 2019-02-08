import 'package:flutter/material.dart'; 

class TransactionPage extends StatefulWidget{ 
  @override
  State createState() => new TransactionPageState(); 
}
class TransactionPageState extends State<TransactionPage>{ 

  String number = "0.00";
  String suffix = "€";
  String input = "";

  @override
    Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Input"),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
              alignment: Alignment.centerRight,
              padding: new EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 12.0
              ),
              child: new Text(number + suffix, style: new TextStyle(
                fontSize: 48.0,
                fontWeight: FontWeight.bold,
                
              ))),
            new Expanded(
              child: new Divider(),
            ),
            

            new Column(children: [
              new Row(children: [
                buildButton("7"),
                buildButton("8"),
                buildButton("9"),
              ]),

              new Row(children: [
                buildButton("4"),
                buildButton("5"),
                buildButton("6"),
              ]),

              new Row(children: [
                buildButton("1"),
                buildButton("2"),
                buildButton("3"),
              ]),

              new Row(children: [
                buildButton("."),
                buildButton("0"),
                buildButton("DEL"),
              ]),

              new Row(children: [
                buildButton("CLEAR"),
                buildButton("ACCEPT"),
              ])
            ])
          ],
        )));
  }

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
        padding: new EdgeInsets.all(24.0),
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

}

