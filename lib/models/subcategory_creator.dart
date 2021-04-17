// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'categories.dart';
import 'categories_model.dart';
import 'creator.dart';
import 'queries.dart';

class SubCategoryCreator implements Creator<SubCategory> {
  final Queries queryContext;
  final String name;
  final String parentId;
  final double budgeted;
  final double available;

  SubCategoryCreator({
    @required this.queryContext,
    @required this.name,
    @required this.parentId,
    @required this.budgeted,
    @required this.available,
  });

  @override
  Future<SubCategory> create() async {
    final SubCategoryModel model = SubCategoryModel(
      name: name,
      parentId: parentId,
      budgeted: budgeted,
      available: available,
    );

    final int id = await queryContext.addSubcategory(model);
    return SubCategory(
      id: id,
      parentId: parentId,
      name: name,
      budgeted: budgeted,
      available: available,
    );
  }
}
