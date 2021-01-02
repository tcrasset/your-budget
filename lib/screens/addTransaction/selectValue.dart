import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/components/addDialog.dart';
import 'package:your_budget/models/categories.dart';
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
  bool isSubcategories;

  AppState appState;
  @override
  initState() {
    super.initState();
    appState = Provider.of(context, listen: false);
    isPayee = widget.title == "Payees";
    isSubcategories = widget.title == "Subcategories";
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

  List<dynamic> _getDuplicateEntries(){
    var map = Map<String, int>(); // Mapping between name and id

    Set<int> duplicateIDs = Set<int>();
    widget.listEntries.forEach((element) {
      if(element is SubCategory){
        if(!map.containsKey(element.name)) {
          map[element.name] = element.id;
        } else {
          duplicateIDs.add(element.id);
          duplicateIDs.add(map[element.name]); //Other duplicate that is in map
        }
      }
    });
    return appState.subcategories.where((element) => duplicateIDs.contains(element.id)).toList();
  }


  List _addLabelForDuplicateEntries(List<dynamic> duplicateEntries) {

    List modifiedListEntries = [];
    List maincategories = appState.allCategories.whereType<MainCategory>().toList();

    widget.listEntries.forEach((entry) {
      if(entry is SubCategory){

        bool isDuplicate = duplicateEntries.singleWhere(
          (duplicate) => duplicate.id == entry.id, orElse: () => null) != null;

        if(isDuplicate){
          var modifiedEntry = _addCategoryName(entry, maincategories);
          modifiedListEntries.add(modifiedEntry);
        }else{
          modifiedListEntries.add(entry);
        }
      }
    });
    return modifiedListEntries;
  }

  dynamic _addCategoryName(var entry, List maincategories) {
    var modifiedEntry = entry.copy();
    MainCategory category = maincategories.singleWhere((maincat) => maincat.id == entry.parentId, orElse: null);
    modifiedEntry.name = modifiedEntry.name + ' (' + category.name + ')' ?? "" ;
    return modifiedEntry;
  }


  @override
  Widget build(BuildContext context) {

    List listEntries = [];
    if(isSubcategories){

      List<dynamic> duplicates = _getDuplicateEntries();
      if(duplicates.isNotEmpty)
        listEntries = _addLabelForDuplicateEntries(duplicates);

      else
        listEntries = widget.listEntries;
    }
    else
      listEntries = widget.listEntries;

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
            itemCount: listEntries.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 1, color: Colors.black12),
            itemBuilder: (BuildContext context, int index) {

              var item = listEntries[index];
              var itemToShow = item is Text ? item : Text(item.name);
              var itemToFilter = item is Text ? item.data : item.name;
              bool noFilter = filter == null || filter == "";

              if (noFilter == true)
                // The filter is empty, show everything
                return ListTile(
                    title: itemToShow, onTap: () => handlePopContext(item));
              else if (noFilter == false) {
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
