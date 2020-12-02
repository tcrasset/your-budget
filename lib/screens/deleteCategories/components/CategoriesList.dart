import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/screens/deleteCategories/components/checked_row.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  final ScrollController _scrollController = ScrollController();
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List categories = Provider.of<AppState>(context).allCategories;
    return Container(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _scrollController,
        child: new ListView.separated(
          controller: _scrollController,
          shrinkWrap: true,
          itemCount: categories.length,
          separatorBuilder: (BuildContext context, int index) =>
              Divider(height: 1, color: Colors.black12),
          itemBuilder: (BuildContext context, int index) {
            var type = categories[index].runtimeType;
            return Card(
              child: CheckedRow(
                  categories[index].name,
                  categories[index].id,
                  type,
                  type == MainCategory
                      ? Constants.CATEGORY_TEXT_STYLE
                      : Constants.SUBCATEGORY_TEXT_STYLE),
            );
          },
        ),
      ),
    );
  }
}
