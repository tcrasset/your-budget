// Package imports:
import 'package:meta/meta.dart';

// Project imports:
import 'package:your_budget/main.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/utils.dart';

/// Class representing budget that is held monthly, specified by [month] and [year].
/// It holds a list of all [maincategories] and [subcategories], which are put in a specific
/// order in [_allcategories]. The total budgeted value is held in [totalBudgeted].
class Budget {
  //TODO: Refactor budget
  List<MainCategory?> maincategories = [];
  List<SubCategory?> subcategories = [];
  List<CategoryLegacy?>? _allcategories;
  int? month;
  int? year;
  double totalBudgeted = 0;
  double toBeBudgetedInputFromMoneyTransactions = 0;

  DateTime get date => DateTime(year!, month!);

  /// Default constructor for [Budget]. It is declared for a month given by [month] and [year], and
  /// will hold a list of MainCategories in [maincategories], and a list of their respective
  /// children in [subcategories].
  ///
  /// [subcategories] will get linked to their corresponding MainCategory from [maincategories].
  ///
  /// The contents of MainCategory.subcategories of each MainCategory passed in [maincategories] is not taken
  /// into account and replaced with the corresponding [subcategories] .
  Budget(List<MainCategory?> maincategories, List<SubCategory?> subcategories,
      int? month, int? year) {
    for (final MainCategory? cat in maincategories) {
      final MainCategory newCat = cat!.copy();
      final List<SubCategory?> correspondingSubcats = subcategories
          .where((subcat) => subcat!.parentId == cat.id.toString())
          .toList();
      //TODO: Investigate why We make copies of maincategories, but not of subcategories.
      newCat.addMultipleSubcategories(correspondingSubcats);
      this.maincategories.add(newCat);
    }
    this.subcategories = subcategories;
    this.month = month;
    this.year = year;
    _updateTotalBudgeted();
    _updateAllcategories();
  }

  /// The updated list of [_allcategories].
  List<CategoryLegacy?>? get allcategories {
    _updateAllcategories();
    return _allcategories;
  }

  /// The month of the budget in human readable form, for example 'January' for month 1
  String get monthAsString {
    return monthStringFromDate(DateTime(year!, month!));
  }

  /// Add the SubCategory [newSubcat] to this.
  void addSubcategory(SubCategory newSubcat) {
    final SubCategory subcat = newSubcat.copy();
    this.subcategories.add(subcat);
    final MainCategory cat = maincategories
        .singleWhere((cat) => cat!.id.toString() == newSubcat.parentId)!;
    if (!_subcatAlreadyPresentIn(cat, newSubcat)) {
      cat.addSubcategory(subcat);
    }
    _updateTotalBudgeted();
  }

  void addMaincategory(MainCategory? maincat) {
    maincategories.add(maincat);
  }

  bool _subcatAlreadyPresentIn(MainCategory cat, SubCategory subcat) {
    final SubCategory? presentSubCat = cat.subcategories.singleWhere(
        (thissubcat) => thissubcat!.id == subcat.id,
        orElse: () => null);
    if (presentSubCat == null) return false;
    return true;
  }

  /// Replace the subcategory specified by [modifiedSubcategory.id] in the budget by
  /// the values of [modifiedSubcategory].
  void updateSubCategory(SubCategory modifiedSubcategory) {
    // Modify subcategory in this.subcategories
    final SubCategory oldSubcat = subcategories
        .singleWhere((subcat) => modifiedSubcategory.id == subcat!.id)!;
    oldSubcat.update(modifiedSubcategory);

    // Update the values inside the corresponding maincategory
    final MainCategory cat = maincategories.singleWhere(
        (cat) => modifiedSubcategory.parentId == cat!.id.toString())!;

    cat.updateFields();
    _updateTotalBudgeted();
  }

  void updateSubCategoryName({required int? id, required String newName}) {
    final SubCategory subcat =
        subcategories.singleWhere((subcat) => subcat!.id == id)!;
    subcat.name = newName;
  }

  void updateMaincategory(MainCategory modifiedMaincategory) {
    final MainCategory cat = maincategories
        .singleWhere((cat) => cat!.id == modifiedMaincategory.id)!;
    cat.name = modifiedMaincategory.name;
  }

  /// Replace the attribute [field] of the SubCategory specified by [subcatId] with [value].
  /// The parent of the SubCategory has to be specified with [categoryId] to be able to
  /// update it's values too.
  void makeSubcategoryChangeBySubcatId(
    int? subcatId,
    String? categoryId,
    String field,
    String value,
  ) {
    final SubCategory? oldSubcat =
        subcategories.singleWhere((subcat) => subcat!.id == subcatId);

    switch (field) {
      case "budgeted":
        oldSubcat!.budgeted = double.parse(value);
        break;
      case "available":
        oldSubcat!.available = double.parse(value);
        break;
      case "name":
        oldSubcat!.name = value;
        break;
      default:
        //TODO: Raise error
        print("Pass in an actual field");
        throw Exception();
    }

    final MainCategory cat =
        maincategories.singleWhere((cat) => cat!.id.toString() == categoryId)!;
    cat.updateFields();
    _updateTotalBudgeted();
  }

  /// Fills the list [_allcategories] with each MainCategory followed by its children.
  /// An example is the following:
  /// "\[
  ///   MainCategory_1
  ///   SubCategory_1_1
  ///   SubCategory_1_2
  ///   SubCategory_1_3
  ///   MainCategory_2
  ///   SubCategory_2_1
  /// ]
  void _updateAllcategories() {
    _allcategories = [];
    // Create a list of all MainCategories and Subcategories in order.
    for (final MainCategory? cat in maincategories) {
      _allcategories!.add(cat);
      cat!.subcategories.forEach((subcat) => _allcategories!.add(subcat));
    }
  }

  /// Updates the [totalBudgeted] value for the month.
  void _updateTotalBudgeted() {
    totalBudgeted = 0;
    for (final MainCategory? cat in maincategories) {
      totalBudgeted += cat!.budgeted!;
    }
  }

  @override
  String toString() {
    return super.toString() +
        """ {month: $month, year: $year, maincategories: $maincategories, subcategories: $subcategories}\n""";
  }

  /// Deletes the [deletedSubcategory] from the current Budget.
  void removeSubcategory(int? subcatId, String? catId) {
    subcategories.removeWhere((subcat) => subcat!.id == subcatId);
    final MainCategory? cat = maincategories
        .singleWhere((cat) => cat!.id.toString() == catId, orElse: () => null);
    cat?.removeSubcategory(subcatId);
    _updateTotalBudgeted();
  }

  void removeCategory(int? catId) {
    //! Must call removeSubcategory separately for linked subcategories
    maincategories.removeWhere((cat) => cat!.id == catId);
    _updateTotalBudgeted();
  }
}
