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
  DateTime date;
  //TODO: Convert date field to month/year field
  BudgetValue(this.id, this.subcategoryId, this.budgeted, this.available, this.date);

  /// [BudgetValue] are imported from the database as json file
  BudgetValue.fromJson(Map<String, dynamic> json)
      : id = json[DatabaseCreator.BUDGET_VALUE_ID], //
        subcategoryId = json[DatabaseCreator.SUBCAT_ID_OUTSIDE],
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
        """ {id: $id, subcategoryId: $subcategoryId, available: $available, budgeted: $budgeted, date: ${date.millisecondsSinceEpoch}}\n""";
  }
}

class Budget {
  List<MainCategory> maincategories = [];
  List<SubCategory> subcategories = [];
  List<Category> _allcategories;
  int month;
  int year;
  double totalBudgeted = 0;

  List<Category> get allcategories {
    _updateAllcategories();
    return _allcategories;
  }

  Budget(List<MainCategory> maincategories, List<SubCategory> subcategories, int month, int year) {
    /// Add a copy of each maincategory to the budget, add the corresponding subcategories
    /// to each maincategory and update the fields to reflect the total budget amount of
    /// the subcategories under a given maincategory.
    maincategories.forEach((cat) => this.maincategories.add(cat.copy()));
    this.subcategories = subcategories;
    this.month = month;
    this.year = year;
    this.maincategories.forEach((cat) {
      cat.subcategories = subcategories.where((subcat) => subcat.parentId == cat.id).toList();
      cat.updateFields();
      totalBudgeted += cat.budgeted;
    });

    _updateAllcategories();
  }

  void makeCategoryChange(SubCategory modifiedSubcategory) {
    _updateSubCategory(modifiedSubcategory);
    _updateMainCategory(modifiedSubcategory);
  }

  ///Must be called before [_updateMainCategory()] because the former
  ///modifies the subcategories in each [MainCategory], and the latter
  ///updates the maincategories based on the subcategories' values.
  void _updateSubCategory(SubCategory modifiedSubcategory) {
    for (final SubCategory subcat in subcategories) {
      if (subcat.id == modifiedSubcategory.id) {
        subcat.name = modifiedSubcategory.name;
        subcat.budgeted = modifiedSubcategory.budgeted;
        subcat.available = modifiedSubcategory.available;
      }
    }
  }

  void _updateMainCategory(SubCategory modifiedSubcategory) {
    for (final MainCategory cat in maincategories) {
      if (cat.id == modifiedSubcategory.parentId) {
        cat.updateFields();
      }
    }
    _updateTotalBudgeted();
  }

  void _updateAllcategories() {
    _allcategories = [];
    // Create a list of all MainCategories and Subcategories in order.
    for (final MainCategory cat in maincategories) {
      _allcategories.add(cat);
      cat.subcategories.forEach((subcat) => _allcategories.add(subcat));
    }
  }

  void _updateTotalBudgeted() {
    totalBudgeted = 0;
    for (final MainCategory cat in maincategories) {
      totalBudgeted += cat.budgeted;
    }
  }

  @override
  String toString() {
    return super.toString() +
        """ {month: $month, year: $year, maincategories: $maincategories, subcategories: $subcategories}\n""";
  }
}
