import 'package:your_budget/models/constants.dart';

/// Class representing a budgeting category.
/// A category is represented an unique [id], a [name],
/// the value [budgeted] is the money budgeted for the month and
/// the value [available] is the money left to be spent for the month.
abstract class CategoryLegacy {
  int? id;
  String? name;
  double? budgeted;
  double? available;

  CategoryLegacy({
    required this.id,
    required this.name,
    required this.budgeted,
    required this.available,
  });
}

/// Budgeting [CategoryLegacy] that will be a child of a [MainCategory] instance specified by [parentId]
class SubCategory extends CategoryLegacy {
  final String? parentId;

  /// Default SubCategory constructor
  SubCategory({
    required super.id,
    this.parentId,
    required super.name,
    required super.budgeted,
    required super.available,
  });

  /// Constructor building a SubCategory from a [json] representation taken
  /// from a database
  SubCategory.fromJson(Map<String, dynamic> json)
      : parentId = json[DatabaseConstants.CAT_ID_OUTSIDE] as String?,
        super(
          id: json[DatabaseConstants.SUBCAT_ID] as int?, //
          name: json[DatabaseConstants.SUBCAT_NAME] as String?,
          budgeted: json[DatabaseConstants.BUDGET_VALUE_BUDGETED] as double?,
          available: json[DatabaseConstants.BUDGET_VALUE_AVAILABLE] as double?,
        );

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, parentId: $parentId, name: $name, budgeted: $budgeted, available: $available}\n""";
  }

  /// Creates a copy of this with zero money budgeted.
  SubCategory blank() {
    return SubCategory(id: id, parentId: parentId, name: name, budgeted: 0.0, available: available);
  }

  /// Creates an exact copy of this.
  SubCategory copy() {
    return SubCategory(
      id: id,
      parentId: parentId,
      name: name,
      budgeted: budgeted,
      available: available,
    );
  }

  SubCategory copyWith({
    int? id,
    String? parentId,
    String? name,
    double? budgeted,
    double? available,
  }) {
    return SubCategory(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      name: name ?? this.name,
      budgeted: budgeted ?? this.budgeted,
      available: available ?? this.available,
    );
  }

  /// Updates values of this with those of [subcat].
  void update(SubCategory subcat) {
    assert(subcat.id == id);

    available = subcat.available;
    budgeted = subcat.budgeted;
    name = subcat.name;
  }

  /// Checks whether [subCategory] has the same values as this..
  bool hasSameValues(SubCategory subCategory) {
    return subCategory.id == id &&
        subCategory.parentId == parentId &&
        subCategory.name == name &&
        subCategory.budgeted == budgeted &&
        subCategory.available == available;
  }
}

/// Budgeting [CategoryLegacy] that is a parent of one or multiple [SubCategory]'s
class MainCategory extends CategoryLegacy {
  List<SubCategory?> _subcategories = [];

  /// Default [MainCategory] constructor, which sets the budgeted and available values to 0.00
  MainCategory({required super.id, required super.name}) : super(budgeted: 0.00, available: 0.00);

  /// Constructor building a MainCategory from a [json] representation taken
  /// from a database
  MainCategory.fromJson(Map<String, dynamic> json)
      : super(
          id: json[DatabaseConstants.CATEGORY_ID] as int?, //
          name: json[DatabaseConstants.CATEGORY_NAME] as String?,
          budgeted: 0.00,
          available: 0.00,
        );

  List<SubCategory?> get subcategories {
    return _subcategories;
  }

  set subcategories(List<SubCategory?> subcategories) {
    _subcategories = subcategories;
  }

  //TODO: Use getters and setters to be able to make updateFields private (and even redundant)

  ///Computes the values of [budgeted] and [available] from the sum of the respective values of
  ///their children in [_subcategories].
  void updateFields() {
    double budgeted = 0;
    double available = 0;
    for (final cat in _subcategories) {
      budgeted += cat!.budgeted!;
    }
    for (final cat in _subcategories) {
      available += cat!.available!;
    }

    this.budgeted = budgeted;
    this.available = available;
  }

  /// Creates a new copy of this WITHOUT [subcategories]
  MainCategory copy() {
    return MainCategory(id: id, name: name);
  }

  MainCategory copyWith({int? id, String? name}) {
    return MainCategory(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  /// Checks whether [mainCategory] has the same values as this..
  bool hasSameValues(MainCategory mainCategory) {
    bool subcategoriesAreEqual = true;

    //TODO: Just changed this.subcategories to _subcategories. Check if that introduced some bugs
    for (final SubCategory? thisSubcat in _subcategories) {
      // If the subcategory lists don't have the same order, we would
      // still like the equality to hold.
      // Therefore, we find the corresponding subcategory in [mainCategory].
      int correspondingIndex = 0;
      for (final SubCategory? argSubcat in mainCategory.subcategories) {
        if (thisSubcat!.hasSameValues(argSubcat!)) {
          break;
        }
        correspondingIndex++;
      }

      // If we get to the end of the loop without having found a match,
      // the subcategories don't match
      if (correspondingIndex == _subcategories.length) {
        subcategoriesAreEqual = false;
        break;
      }
    }

    return subcategoriesAreEqual &&
        mainCategory.id == id &&
        mainCategory.name == name &&
        mainCategory.budgeted == budgeted &&
        mainCategory.available == available;
  }

  /// Adds [newSub] as a new subcategory to the list [_subcategories].
  void addSubcategory(SubCategory newSub) {
    _subcategories.add(newSub);
    updateFields();
  }

  /// Adds multiple [subcategories] as a new subcategories to the list [_subcategories].
  void addMultipleSubcategories(List<SubCategory?> subcategories) {
    for (final sub in subcategories) {
      _subcategories.add(sub);
    }
    updateFields();
  }

  /// Removes the subcategory specified by [subcategoryId] from the list [_subcategories].
  void removeSubcategory(int? subcategoryId) {
    subcategories.removeWhere((subcat) => subcat!.id == subcategoryId);
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
class BudgetValueLegacy {
  int? id;
  int? subcategoryId;
  double? budgeted;
  double? available;
  int? month;
  int? year;

  BudgetValueLegacy({
    required this.id,
    required this.subcategoryId,
    required this.budgeted,
    required this.available,
    required this.year,
    required this.month,
  });

  /// Constructor building a BudgetValue from a [json] representation taken
  /// from a database.
  BudgetValueLegacy.fromJson(Map<String, dynamic> json)
      : id = json[DatabaseConstants.BUDGET_VALUE_ID] as int?, //
        subcategoryId = json[DatabaseConstants.SUBCAT_ID_OUTSIDE] as int?,
        budgeted = json[DatabaseConstants.BUDGET_VALUE_BUDGETED] as double?,
        available = json[DatabaseConstants.BUDGET_VALUE_AVAILABLE] as double?,
        year = json[DatabaseConstants.BUDGET_VALUE_YEAR] as int?,
        month = json[DatabaseConstants.BUDGET_VALUE_MONTH] as int?;

  @override
  String toString() {
    return super.toString() +
        """ {id: $id, subcategoryId: $subcategoryId, available: $available, budgeted: $budgeted, year: $year, month:$month}\n""";
  }

  bool hasSameValues(BudgetValueLegacy budgetValue) {
    return id == budgetValue.id &&
        subcategoryId == budgetValue.subcategoryId &&
        budgeted == budgetValue.budgeted &&
        available == budgetValue.available &&
        year == budgetValue.year &&
        month == budgetValue.month;
  }

  BudgetValueLegacy copyWith({
    int? id,
    int? subcategoryId,
    double? budgeted,
    double? available,
    int? month,
    int? year,
  }) {
    return BudgetValueLegacy(
      id: id ?? this.id,
      subcategoryId: subcategoryId ?? this.subcategoryId,
      budgeted: budgeted ?? this.budgeted,
      available: available ?? this.available,
      month: month ?? this.month,
      year: year ?? this.year,
    );
  }
}
