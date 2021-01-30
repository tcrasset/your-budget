import 'package:meta/meta.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/creator.dart';
import 'package:your_budget/models/queries.dart';

class MainCategoryCreator implements Creator<MainCategory> {
  final Queries queryContext;
  final String name;

  MainCategoryCreator({@required this.queryContext, @required this.name});

  @override
  Future<MainCategory> create() async {
    MainCategoryModel model = MainCategoryModel(name: name);
    int id = await queryContext.addCategory(model);
    return MainCategory(id: id, name: name);
  }
}
