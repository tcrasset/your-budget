import 'package:mybudget/models/database_creator.dart';

class Category {
  int id;
  String name;
  double budgeted;
  double available;

  Category(this.id, this.name, this.budgeted, this.available);
}

class SubCategory extends Category {
  final parentId;

  SubCategory(int id, int parentId, String name, double budgeted, double available)
      : parentId = parentId,
        super(id, name, budgeted, available);

  // Subcategories are imported from the database as json file
  SubCategory.fromJson(Map<String, dynamic> json)
      : parentId = json[DatabaseCreator.CAT_ID_OUTSIDE],
        super(
            json[DatabaseCreator.SUBCAT_ID], //
            json[DatabaseCreator.SUBCAT_NAME],
            json[DatabaseCreator.BUDGET_VALUE_BUDGETED],
            json[DatabaseCreator.BUDGET_VALUE_AVAILABLE]);

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, parentId: $parentId, name: $name, available: $available, budgeted: $budgeted}\n""";
  }

  SubCategory blank() {
    return SubCategory(id, parentId, name, 0.0, available);
  }

  SubCategory copy() {
    return SubCategory(id, parentId, name, budgeted, available);
  }
}

class MainCategory extends Category {
  List<SubCategory> _subcategories = [];

  MainCategory(int id, String name) : super(id, name, 0.00, 0.00);

  /// Categories are imported from the database as json file
  MainCategory.fromJson(Map<String, dynamic> json)
      : super(
            json[DatabaseCreator.CATEGORY_ID], //
            json[DatabaseCreator.CATEGORY_NAME],
            0.00,
            0.00);

  /// Convert a MainCategory into a Map.
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.CATEGORY_ID: id,
      DatabaseCreator.CATEGORY_NAME: name,
    };
  }

  List<SubCategory> get subcategories {
    return _subcategories;
  }

  set subcategories(List<SubCategory> subcategories) {
    _subcategories = subcategories;
  }

  void updateFields() {
    double budgeted = 0;
    double available = 0;
    this._subcategories.forEach((SubCategory cat) {
      budgeted += cat.budgeted;
    });
    this._subcategories.forEach((SubCategory cat) {
      available += cat.available;
    });

    this.budgeted = budgeted;
    this.available = available;
  }

  MainCategory copy() {
    return MainCategory(id, name);
  }

  void addSubcategory(SubCategory newSub) {
    this._subcategories.add(newSub);
    updateFields();
  }

  void addMultipleSubcategories(List<SubCategory> subcategories) {
    subcategories.forEach((sub) {
      this._subcategories.add(sub);
    });
    updateFields();
  }

  void removeSubcategory(int subcategoryId) {
    subcategories.removeWhere((subcat) => subcat.id == subcategoryId);
    updateFields();
  }

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, name: $name, available: $available, budgeted: $budgeted}\n""";
  }
}

class BudgetValue {
  double budgeted;
  double available;
  int id;
  int subcategoryId;
  int month;
  int year;
  //TODO: Convert date field to month/year field
  BudgetValue(this.id, this.subcategoryId, this.budgeted, this.available, this.year, this.month);

  /// [BudgetValue] are imported from the database as json file
  BudgetValue.fromJson(Map<String, dynamic> json)
      : id = json[DatabaseCreator.BUDGET_VALUE_ID], //
        subcategoryId = json[DatabaseCreator.SUBCAT_ID_OUTSIDE],
        budgeted = json[DatabaseCreator.BUDGET_VALUE_BUDGETED],
        available = json[DatabaseCreator.BUDGET_VALUE_AVAILABLE],
        year = json[DatabaseCreator.BUDGET_VALUE_YEAR],
        month = json[DatabaseCreator.BUDGET_VALUE_MONTH];

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, subcategoryId: $subcategoryId, available: $available, budgeted: $budgeted, year: $year, month:$month}\n""";
  }
}
