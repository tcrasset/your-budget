// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import '../../../../appstate.dart';
import '../../../../models/categories.dart';
import '../../../../models/constants.dart';
import 'checked_row.dart';

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
    final List<Category?> categories = Provider.of<AppState>(context).allCategories;
    return Scrollbar(
      isAlwaysShown: true,
      controller: _scrollController,
      child: ListView.separated(
        controller: _scrollController,
        shrinkWrap: true,
        itemCount: categories.length,
        separatorBuilder: (BuildContext context, int index) =>
            const Divider(height: 1, color: Colors.black12),
        itemBuilder: (BuildContext context, int index) {
          final type = categories[index].runtimeType;
          return Card(
            child: CheckedRow(
                categories[index]!.name,
                categories[index]!.id,
                type,
                type == MainCategory
                    ? Constants.CATEGORY_TEXT_STYLE
                    : Constants.SUBCATEGORY_TEXT_STYLE),
          );
        },
      ),
    );
  }
}
