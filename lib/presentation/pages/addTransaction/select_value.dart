// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../appstate.dart';
import '../../../components/add_dialog.dart';
import '../../../models/categories.dart';
import '../../../models/payee.dart';
import 'components/search_field.dart';

class SelectValuePage extends StatefulWidget {
  final List listEntries;
  final String title;
  const SelectValuePage({required this.title, required this.listEntries});

  @override
  State createState() => SelectValuePageState();
}

class SelectValuePageState extends State<SelectValuePage> {
  TextEditingController searchController = TextEditingController();
  String? filter;
  late bool isPayee;
  late bool isSubcategories;

  late AppState appState;
  @override
  void initState() {
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

  void handlePopContext(dynamic item) {
    Navigator.pop(context, item);
  }

  String? newPayeeValidator(String payeeName) {
    if (payeeName == null || payeeName.trim() == "") {
      return "Name must be valid";
    }
    return null;
  }

  Future<void> createNewPayee({required BuildContext context, String? defaultName}) async {
    const String hint = "Add new payee";
    final String? payeeName = await addDialog(
        context: context,
        title: hint,
        hintText: hint,
        successButtonName: "Create and select",
        defaultValue: defaultName,
        nameValidator: newPayeeValidator);

    if (payeeName != null) {
      print("Created payee $payeeName");
      final Payee payee = await appState.addPayee(payeeName: payeeName);
      handlePopContext(payee);
    }
  }

  List<dynamic> _getDuplicateEntries() {
    final map = Map<String?, int?>(); // Mapping between name and id

    final Set<int?> duplicateIDs = Set<int?>();
    widget.listEntries.forEach((element) {
      if (element is SubCategory) {
        if (!map.containsKey(element.name)) {
          map[element.name] = element.id;
        } else {
          duplicateIDs.add(element.id);
          duplicateIDs.add(map[element.name]); //Other duplicate that is in map
        }
      }
    });
    return appState.subcategories.where((element) => duplicateIDs.contains(element!.id)).toList();
  }

  List _addLabelForDuplicateEntries(List<dynamic> duplicateEntries) {
    final List modifiedListEntries = [];
    final List maincategories = appState.allCategories.whereType<MainCategory>().toList();

    widget.listEntries.forEach((entry) {
      if (entry is SubCategory) {
        final bool isDuplicate = duplicateEntries
                .singleWhere((duplicate) => duplicate.id == entry.id, orElse: () => null) !=
            null;

        if (isDuplicate) {
          final modifiedEntry = _addCategoryName(entry, maincategories);
          modifiedListEntries.add(modifiedEntry);
        } else {
          modifiedListEntries.add(entry);
        }
      }
    });
    return modifiedListEntries;
  }

  dynamic _addCategoryName(var entry, List maincategories) {
    final modifiedEntry = entry.copy();
    final MainCategory category = maincategories
        .singleWhere((maincat) => maincat.id == entry.parentId, orElse: () => null) as MainCategory;
    modifiedEntry.name = modifiedEntry.name + ' (' + category.name + ")" ?? "";
    return modifiedEntry;
  }

  @override
  Widget build(BuildContext context) {
    List listEntries = [];

    if (isSubcategories) {
      final List<dynamic> duplicates = _getDuplicateEntries();
      if (duplicates.isNotEmpty) {
        listEntries = _addLabelForDuplicateEntries(duplicates);
      } else {
        listEntries = widget.listEntries;
      }
    } else {
      listEntries = widget.listEntries;
    }

    if (isPayee) {
      listEntries.sort((a, b) => a.name.compareTo(b.name) as int);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: [
          SearchField(searchController: searchController),
          // Add the "Create new payee" if we are on the payee page
          if (isPayee)
            ListTile(
              title: const Text(
                "Create new payee",
                style: TextStyle(fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
              ),
              onTap: () => createNewPayee(context: context, defaultName: searchController.text),
            ),

          Expanded(
              child: ListView.separated(
            shrinkWrap: true,
            itemCount: listEntries.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1, color: Colors.black12),
            itemBuilder: (BuildContext context, int index) {
              final item = listEntries[index];
              final itemToShow = item is Text ? item : Text(item.name as String);
              final itemToFilter = item is Text ? item.data : item.name;
              final bool noFilter = filter == null || filter == "";

              if (noFilter == true) {
                return ListTile(title: itemToShow, onTap: () => handlePopContext(item));
              } else if (noFilter == false) {
                // The filter is not empty, we filter by name
                if (itemToFilter.toLowerCase().contains(filter!.toLowerCase()) == true) {
                  return ListTile(title: item as Text, onTap: () => handlePopContext(item));
                }
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
