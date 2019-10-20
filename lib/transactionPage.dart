
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:mybudget/categories.dart';
import 'package:mybudget/database_creator.dart';
import 'package:mybudget/entries.dart'; 

class TransactionPage extends StatefulWidget{ 
  @override
  State createState() => new TransactionPageState(); 
}
class TransactionPageState extends State<TransactionPage>{ 

  //Controller for input amount
  MoneyMaskedTextController _amountController;
  final TextStyle _amountTextStyle = new TextStyle(color: Colors.black, fontSize: 32.0);

  final _formKey = GlobalKey<FormState>(); 

  double _amount;
  String _payeeName;
  String _accountName;
  String _subcategoryName;
  DateTime _date;
  String _errorMessage;

  // Will hold async data when FutureBuilder returns
  List<Payee> payees;
  List<Account> accounts;
  List<SubCategory> subcategories;
  List<String> payee_names;
  List<String> account_names;
  List<String> subcategory_names;

  @override
  void initState() {
    super.initState(); 
    _errorMessage = "";
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

    List<Widget> containerList = [
      // Container where one can input the amount to add to the transaction
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
          validator: (value) {
            if(_amountController.numberValue <= 0){
              return "Value must be different than 0";
            }
            return null;
          }, // Always validate because no access to controller value
          onSaved: (value) => this._amount = _amountController.numberValue,
        )
      ),

      //Custom form field for filling out other information related to 
      // the transaction
      TransactionFormField(containerName:'Payee', 
                            initialValue: 'Select Payee',
                            autovalidate: false,
                            validator: (value) {
                              if(!payee_names.contains(value)){
                                // print("ERROR");
                                // setState(() {
                                //   //TODO: Because of setState, the FutureBuilder is called everytime
                                //   print("Hello");
                                //   _errorMessage = "Input must be a known payee";
                                // });
                                // return "Input must be a known payee";
                                return null;
                              }
                              return null;
                            },
                            onSaved: (value) => this._payeeName = value.toLowerCase()),

      TransactionFormField(containerName:'Account',
                            initialValue: 'Select account',
                            autovalidate: false,
                            validator: (value) {

                              if(!account_names.contains(value)){
                                // return "Input must be a known account";
                              }
                              return null;
                            },
                            onSaved: (value) => this._accountName = value.toLowerCase()),

      TransactionFormField(containerName:'Category',
                            initialValue: 'Select category',
                            autovalidate: true,
                            validator: (value) {
                              if(!subcategory_names.contains(value)){
                                // print("Error subat");
                                return "Input must be a known subcategory";
                              }
                              return null;
                            },
                            onSaved: (value) => this._subcategoryName = value.toLowerCase()),

      // TransactionContainer(containerName:'Date', defaultValue: 'Select date'),
      // TransactionContainer(containerName:'Repeat', defaultValue: 'Never'),
      // TransactionContainer(containerName:'Memo', defaultValue: 'Optional'),
      // TransactionContainer(containerName:'Color', defaultValue: 'Default'),
    ];

    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text("New transaction"),
      ),
      // D a list of fields such as Payee, Category, etc...
      body: Form(
        key: _formKey,
        child: FutureBuilder(
          // Perform async operations before displaying the interface
          future: Future.wait([
            SQLQueries.getPayees(),
            SQLQueries.getAccounts(),
            SQLQueries.getSubCategories(),
          ]),

          builder: (context, snapshot) {
            switch(snapshot.connectionState){
              case ConnectionState.none:
                return new Container();      
              case ConnectionState.waiting:
                return new Center(child: new CircularProgressIndicator());
              case ConnectionState.active:
                return new Container();
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return new Text('${snapshot.error}',style: TextStyle(color: Colors.red));
                } else {

                  // Assign the async data to the respective variables
                  payees = snapshot.data[0];
                  accounts = snapshot.data[1];
                  subcategories = snapshot.data[2];
                  payee_names = payees.map((payee) => payee.name.toLowerCase()).toList();
                  account_names = accounts.map((acount) => acount.name.toLowerCase()).toList();
                  subcategory_names = subcategories.map((subcategory) => subcategory.name.toLowerCase()).toList();
                  return Column(
                    children : [
                      Container(
                        height: 350,
                        child: ListView.separated(
                          shrinkWrap: true,
                          itemCount: containerList.length,
                          separatorBuilder: (BuildContext context, int index) => Divider(height:1, color: Colors.black12),
                          itemBuilder: (context, index) {
                            return ListTile(title:containerList[index],);                   
                          }
                        )
                      ),
                      // Container(
                        
                      //   padding: EdgeInsets.all(5),
                      //   child: Text(_errorMessage, style: TextStyle(color:Colors.red)),
                      // ),
                      FloatingActionButton(
                        // color: Colors.blue,
                        // padding: EdgeInsets.all(20),
                        child: Text("Enter"), 
                        onPressed: () async {
                          _formKey.currentState.save();
                          if (_formKey.currentState.validate()) {
                            print("Form validated");
                            print(this._amount);
                            print(this._payeeName);
                            print(this._accountName);
                            print(this._subcategoryName);
                            int moneyTransactionCount = 0; //await SQLQueries.moneyTransactionCount();
                            int payeeID = subcategories.singleWhere((payee) => payee.name.toLowerCase() == this._payeeName).id;
                            int accountID = subcategories.singleWhere((account) => account.name.toLowerCase() == this._accountName).id;
                            int subcategoryID = subcategories.singleWhere((subcat) => subcat.name.toLowerCase() == this._subcategoryName).id;

                            print("Form submitted");
                            MoneyTransaction moneyTransaction = new MoneyTransaction(moneyTransactionCount+1,
                                                                                      subcategoryID, 
                                                                                      payeeID, 
                                                                                      accountID, 
                                                                                      this._amount, 
                                                                                      "", 
                                                                                      DateTime.now());
                            // SQLQueries.addMoneyTransaction(moneyTransaction);
                          }
                        }
                      )
                    ]
                  );
                }
            }
          }
        )
      )
    );
  }
}

class TransactionFormField extends FormField<String>  {
   
  TransactionFormField({String containerName, 
                        String initialValue,
                        bool autovalidate = false,
                        FormFieldSetter<String> onSaved,
                        FormFieldValidator<String> validator,
  }) : super(
    onSaved: onSaved,
    validator: validator,
    initialValue: initialValue,
    autovalidate: autovalidate,
    builder: (FormFieldState<String> state) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        margin: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: Text(containerName,
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0)),
              ), 
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(hintText: state.value.toString())
                ,)
              ,),            
            ],
          ),
          /*TODO: Display error message, multiple possibilityes
            1) Fix field above button with place for one error message.
              Update it using setState, but then i'd have to remove the
              FutureBUilder because everytime one calls setState, the whole 
              scaffold gets rebuild and thus the circularicon. Maybe one can just
              remove the circular icon...
            2) DO it with additional field below each entry, however they don't seem to register
              when the name is correct.
          */
          state.hasError?
          Text(
            state.errorText,
            style: TextStyle(
              color: Colors.red
            ),
          ) :
          Container()
          ]
        )
      );
  });

}

