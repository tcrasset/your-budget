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
            json[DatabaseCreator.SUBCAT_BUDGETED],
            json[DatabaseCreator.SUBCAT_AVAILABLE]);

  /// Convert a SubCategory into a Map.
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.SUBCAT_ID: id,
      DatabaseCreator.SUBCAT_NAME: name,
      DatabaseCreator.SUBCAT_BUDGETED: budgeted,
      DatabaseCreator.SUBCAT_AVAILABLE: available,
    };
  }

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, parentId: $parentId, name: $name, available: $available, budgeted: $budgeted}""";
  }

  SubCategory blank() {
    return SubCategory(id, parentId, name, 0.0, available);
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

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, name: $name, available: $available, budgeted: $budgeted}""";
  }
}

class BudgetValue {
  double budgeted;
  double available;
  int id;
  int subcategoryId;
  DateTime date;

  BudgetValue(this.id, this.subcategoryId, this.budgeted, this.available, this.date);

  /// [BudgetValue] are imported from the database as json file
  BudgetValue.fromJson(Map<String, dynamic> json)
      : id = json[DatabaseCreator.BUDGET_VALUE_ID], //
        subcategoryId = json[DatabaseCreator.SUBCAT_ID],
        budgeted = json[DatabaseCreator.SUBCAT_BUDGETED],
        available = json[DatabaseCreator.SUBCAT_AVAILABLE],
        date =
            DateTime.fromMillisecondsSinceEpoch(int.parse(json[DatabaseCreator.BUDGET_VALUE_DATE]));

  /// Convert a SubCategory into a Map.
  Map<String, dynamic> toMap() {
    return {
      DatabaseCreator.BUDGET_VALUE_ID: id,
      DatabaseCreator.SUBCAT_ID_OUTSIDE: subcategoryId,
      DatabaseCreator.BUDGET_VALUE_BUDGETED: budgeted,
      DatabaseCreator.BUDGET_VALUE_AVAILABLE: available,
      DatabaseCreator.BUDGET_VALUE_DATE: date,
    };
  }

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, subcategoryId: $subcategoryId, available: $available, budgeted: $budgeted, date: ${date.millisecondsSinceEpoch}}""";
  }
}

class Budget {
  List<MainCategory> maincategories;
  List<SubCategory> subcategories;
  int month;
  int year;

  Budget(this.maincategories, this.subcategories, this.month, this.year);

  @override
  String toString() {
    return super.toString() + """ {month: $month, year: $year, subcategories: $subcategories}\n""";
  }
}
