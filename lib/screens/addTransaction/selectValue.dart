import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
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

  handleCreateNewPayee(String payeeName) async {
    if (payeeName == null || payeeName.trim() == "") {
      print("Name must be valid");
      //TODO: Add error message
      return;
    }
    print("Created payee $payeeName");
    Payee payee = await appState.addPayee(payeeName: payeeName);
    handlePopContext(payee);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: new Column(
        children: [
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextField(
            decoration: new InputDecoration(
              hintText: "Search something",
              icon: Icon(Icons.search),
            ),
            controller: searchController,
          ),

          // Add the "Create new payee" if we are on the payee page
          if (isPayee)
            ListTile(
              title: Text(
                "Create new payee \"${(filter == null) ? "" : filter}\"",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
              onTap: () => handleCreateNewPayee(filter),
            ),

          new Expanded(
              child: new ListView.separated(
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
                return ListTile(title: itemToShow, onTap: () => handlePopContext(item));
              else if (noFilter = false) {
                // The filter is not empty, we filter by name
                if (itemToFilter.toLowerCase().contains(filter.toLowerCase()))
                  return ListTile(title: item, onTap: () => handlePopContext(item));
              }
              // There is an error
              return new Container();
            },
          ))
        ],
      ),
    );
  }
}
