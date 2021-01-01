import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/components/addDialog.dart';
import 'package:your_budget/models/entries.dart';
import 'package:provider/provider.dart';

class SelectValuePage extends StatefulWidget {
  final List listEntries;
  final String title;
  SelectValuePage({@required this.title, @required this.listEntries});

  @override
  State createState() => new SelectValuePageState();
}

class SelectValuePageState extends State<SelectValuePage> {
  TextEditingController searchController = new TextEditingController();
  String filter;
  bool isPayee;

  AppState appState;
  @override
  initState() {
    super.initState();
    appState = Provider.of(context, listen: false);
    isPayee = widget.title == "Payees";
    searchController.addListener(() {
      setState(() {
        filter = searchController.text;
      });
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  handlePopContext(dynamic item) {
    Navigator.pop(context, item);
  }

  String newPayeeValidator(String payeeName) {
    if (payeeName == null || payeeName.trim() == "") {
      return "Name must be valid";
    }
    return null;
  }

  void createNewPayee(
      {@required BuildContext context, String defaultName}) async {
    String hint = "Add new payee";
    String payeeName = await addDialog(
        context: context,
        title: hint,
        hintText: hint,
        successButtonName: "Create and select",
        defaultValue: defaultName,
        nameValidator: newPayeeValidator);

    if (payeeName != null) {
      print("Created payee $payeeName");
      Payee payee = await appState.addPayee(payeeName: payeeName);
      handlePopContext(payee);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
         Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          TextField(
            decoration: InputDecoration(
              hintText: "Search something",
              icon: Icon(Icons.search),
            ),
            controller: searchController,
          ),

          // Add the "Create new payee" if we are on the payee page
          if (isPayee)
            ListTile(
              title: Text(
                "Create new payee",
                style: TextStyle(
                    fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
              onTap: () => createNewPayee(
                  context: context, defaultName: searchController.text),
            ),

          Expanded(
              child: ListView.separated(
            shrinkWrap: true,
            itemCount: widget.listEntries.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1, color: Colors.black12),
            itemBuilder: (BuildContext context, int index) {
              var item = widget.listEntries[index];
              print(item);
              bool noFilter = filter == null || filter == "";
              var itemToShow = item is Text ? item : Text(item.name);
              var itemToFilter = item is Text ? item.data : item.name;
              if (noFilter == true)
                // The filter is empty, show everything
                return ListTile(
                    title: itemToShow, onTap: () => handlePopContext(item));
              else if (noFilter = false) {
                // The filter is not empty, we filter by name
                if (itemToFilter.toLowerCase().contains(filter.toLowerCase()))
                  return ListTile(
                      title: item, onTap: () => handlePopContext(item));
              }
              // There is an error
              return Container();
            },
          ))
        ],
      ),
    );
  }
}
