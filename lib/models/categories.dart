import 'package:your_budget/models/constants.dart';

/// Class representing a budgeting category.
/// A category is represented an unique [id], a [name],
/// the value [budgeted] is the money budgeted for the month and
/// the value [available] is the money left to be spent for the month.
abstract class Category {
  int id;
  String name;
  double budgeted;
  double available;

  Category(this.id, this.name, this.budgeted, this.available);
}

/// Budgeting [Category] that will be a child of a [MainCategory] instance specified by [parentId]
class SubCategory extends Category {
  final parentId;

  /// Default SubCategory constructor
  SubCategory(
      int id, int parentId, String name, double budgeted, double available)
      : parentId = parentId,
        super(id, name, budgeted, available);

  /// Constructor building a SubCategory from a [json] representation taken
  /// from a database
  SubCategory.fromJson(Map<String, dynamic> json)
      : parentId = json[DatabaseConstants.CAT_ID_OUTSIDE],
        super(
            json[DatabaseConstants.SUBCAT_ID], //
            json[DatabaseConstants.SUBCAT_NAME],
            json[DatabaseConstants.BUDGET_VALUE_BUDGETED],
            json[DatabaseConstants.BUDGET_VALUE_AVAILABLE]);

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, parentId: $parentId, name: $name, budgeted: $budgeted, available: $available}\n""";
  }

  /// Creates a copy of this with zero money budgeted.
  SubCategory blank() {
    return SubCategory(id, parentId, name, 0.0, available);
  }

  /// Creates an exact copy of this.
  SubCategory copy() {
    return SubCategory(id, parentId, name, budgeted, available);
  }

  /// Updates values of this with those of [subcat].
  void update(SubCategory subcat) {
    assert(subcat.id == this.id);

    this.available = subcat.available;
    this.budgeted = subcat.budgeted;
    this.name = subcat.name;
  }

  /// Checks whether [subCategory] has the same values as this..
  bool hasSameValues(SubCategory subCategory) {
    return subCategory.id == this.id &&
        subCategory.parentId == this.parentId &&
        subCategory.name == this.name &&
        subCategory.budgeted == this.budgeted &&
        subCategory.available == this.available;
  }
}

/// Budgeting [Category] that is a parent of one or multiple [SubCategory]'s
class MainCategory extends Category {
  List<SubCategory> _subcategories = [];

  /// Default [MainCategory] constructor, which sets the budgeted and available values to 0.00
  MainCategory(int id, String name) : super(id, name, 0.00, 0.00);

  /// Constructor building a MainCategory from a [json] representation taken
  /// from a database
  MainCategory.fromJson(Map<String, dynamic> json)
      : super(
            json[DatabaseConstants.CATEGORY_ID], //
            json[DatabaseConstants.CATEGORY_NAME],
            0.00,
            0.00);

  List<SubCategory> get subcategories {
    return _subcategories;
  }

  set subcategories(List<SubCategory> subcategories) {
    _subcategories = subcategories;
  }

  //TODO: Use getters and setters to be able to make updateFields private (and even redundant)

  ///Computes the values of [budgeted] and [available] from the sum of the respective values of
  ///their children in [_subcategories].
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

  /// Creates a new copy of this WITHOUT [subcategories]
  MainCategory copy() {
    return MainCategory(id, name);
  }

  /// Checks whether [mainCategory] has the same values as this..
  bool hasSameValues(MainCategory mainCategory) {
    bool subcategoriesAreEqual = true;

    for (final SubCategory thissubcat in this.subcategories) {
      // If the subcategory lists don't have the same order, we would
      // still like the equality to hold.
      // Therefore, we find the corresponding subcategory in [mainCategory].
      int correspondingIndex = 0;
      for (final SubCategory argsubcat in mainCategory.subcategories) {
        if (thissubcat.hasSameValues(argsubcat)) {
          break;
        }
        correspondingIndex++;
      }

      // If we get to the end of the loop without having found a match,
      // the subcategories don't match
      if (correspondingIndex == this.subcategories.length) {
        subcategoriesAreEqual = false;
        break;
      }
    }

    return subcategoriesAreEqual &&
        mainCategory.id == this.id &&
        mainCategory.name == this.name &&
        mainCategory.budgeted == this.budgeted &&
        mainCategory.available == this.available;
  }

  /// Adds [newSub] as a new subcategory to the list [_subcategories].
  void addSubcategory(SubCategory newSub) {
    this._subcategories.add(newSub);
    updateFields();
  }

  /// Adds multiple [subcategories] as a new subcategories to the list [_subcategories].
  void addMultipleSubcategories(List<SubCategory> subcategories) {
    subcategories.forEach((sub) {
      this._subcategories.add(sub);
    });
    updateFields();
  }

  /// Removes the subcategory specified by [subcategoryId] from the list [_subcategories].
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

/// Class representing the values tied to a SubCategory, represented by [subcategoryId], for a
/// particular month set by [month] and [year].
class BudgetValue {
  double budgeted;
  double available;
  int id;
  int subcategoryId;
  int month;
  int year;

  BudgetValue(this.id, this.subcategoryId, this.budgeted, this.available,
      this.year, this.month);

  /// Constructor building a BudgetValue from a [json] representation taken
  /// from a database.
  BudgetValue.fromJson(Map<String, dynamic> json)
      : id = json[DatabaseConstants.BUDGET_VALUE_ID], //
        subcategoryId = json[DatabaseConstants.SUBCAT_ID_OUTSIDE],
        budgeted = json[DatabaseConstants.BUDGET_VALUE_BUDGETED],
        available = json[DatabaseConstants.BUDGET_VALUE_AVAILABLE],
        year = json[DatabaseConstants.BUDGET_VALUE_YEAR],
        month = json[DatabaseConstants.BUDGET_VALUE_MONTH];

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, subcategoryId: $subcategoryId, available: $available, budgeted: $budgeted, year: $year, month:$month}\n""";
  }
}
