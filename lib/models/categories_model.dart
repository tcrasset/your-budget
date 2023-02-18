class SubCategoryModel {
  final String parentId;
  final String name;
  final double budgeted;
  final double available;

  SubCategoryModel({
    required this.parentId,
    required this.name,
    required this.budgeted,
    required this.available,
  });
}

class MainCategoryModel {
  final String name;

  MainCategoryModel({required this.name});
}

class BudgetValueModel {
  int? subcategoryId;
  double budgeted;
  double? available;
  int? year;
  int? month;

  BudgetValueModel({
    required this.subcategoryId,
    required this.budgeted,
    required this.available,
    required this.year,
    required this.month,
  });
}
