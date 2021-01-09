import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/screens/budget/components/MainCategoryRow.dart';
import 'package:your_budget/screens/budget/components/SubCategoryRow.dart';

class CategoriesList extends StatefulWidget {
  @override
  _CategoriesListState createState() => _CategoriesListState();
}

class _CategoriesListState extends State<CategoriesList> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Consumer<AppState>(
          builder: (_, appState, __) => Column(
            children: _buildList(appState),
          ),
        ),
      ),
    );
  }
}

List<Widget> _buildList(AppState appState) {
  List<Category> categories = appState.allCategories;
  List<Widget> widgetList = [];

  Divider divider = Divider(height: 1, color: Colors.black12);

  for (final Category category in categories) {
    var categoryWidget = (category is MainCategory)
        ? MainCategoryRow(cat: category)
        : SubcategoryRow(subcat: category);
    widgetList.add(categoryWidget);
    widgetList.add(divider);
  }

  return widgetList;
}
