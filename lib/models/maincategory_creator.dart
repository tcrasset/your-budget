// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/creator.dart';
import 'package:your_budget/models/queries.dart';

class MainCategoryCreator implements Creator<MainCategory> {
  final Queries? queryContext;
  final String name;

  MainCategoryCreator({required this.queryContext, required this.name});

  @override
  Future<MainCategory> create() async {
    final MainCategoryModel model = MainCategoryModel(name: name);
    final int id = await queryContext!.addCategory(model);
    return MainCategory(id: id, name: name);
  }
}
