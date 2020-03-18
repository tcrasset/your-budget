import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  List listEntries;
  String title;

  SearchPage({@required this.title, @required this.listEntries});

  @override
  State createState() => new SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  TextEditingController controller = new TextEditingController();
  String filter;

  @override
  initState() {
    super.initState();
    print("In init state of searchPage");
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new TextField(
            decoration: new InputDecoration(
                hintText: "Search something", icon: Icon(Icons.search)),
            controller: controller,
          ),
          new Expanded(
              child: new ListView.separated(
                shrinkWrap: true,
                itemCount: widget.listEntries.length,
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(height: 1, color: Colors.black12),
                itemBuilder: (BuildContext context, int index) {
                  var item = widget.listEntries[index];
                  if (filter == null || filter == "") {
                    return new ListTile(
                        title: Text(item.name),
                        onTap: () {
                          Navigator.pop(context, item);
                        });
                  } else {
                    if (item.name.toLowerCase().contains(filter.toLowerCase())) {
                      return new ListTile(
                          title: Text(item.name),
                          onTap: () {
                            Navigator.pop(context, item);
                          });
                    } else {
                      return new Container();
                    }
                  }
                },
              ))
        ],
      ),
    );
  }
}
