// Project imports:
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/utils.dart';

/// Class representing budget that is held monthly, specified by [month] and [year].
/// It holds a list of all [mainCategories] and [subcategories], which are put in a specific
/// order in [_allCategories]. The total budgeted value is held in [totalBudgeted].
class Budget {
  //TODO: Refactor budget
  List<MainCategory?> mainCategories = [];
  List<SubCategory?> subcategories = [];
  List<CategoryLegacy?>? _allCategories;
  int? month;
  int? year;
  double totalBudgeted = 0;
  double toBeBudgetedInputFromMoneyTransactions = 0;

  DateTime get date => DateTime(year!, month!);

  /// Default constructor for [Budget]. It is declared for a month given by [month] and [year], and
  /// will hold a list of MainCategories in [mainCategories], and a list of their respective
  /// children in [subcategories].
  ///
  /// [subcategories] will get linked to their corresponding MainCategory from [mainCategories].
  ///
  /// The contents of MainCategory.subcategories of each MainCategory passed in [mainCategories] is not taken
  /// into account and replaced with the corresponding [subcategories] .
  Budget(List<MainCategory?> mainCategories, this.subcategories, this.month, this.year) {
    for (final MainCategory? cat in mainCategories) {
      final MainCategory newCat = cat!.copy();
      final List<SubCategory?> correspondingSubcategories =
          subcategories.where((subcat) => subcat!.parentId == cat.id.toString()).toList();
      //TODO: Investigate why We make copies of mainCategories, but not of subcategories.
      newCat.addMultipleSubcategories(correspondingSubcategories);
      this.mainCategories.add(newCat);
    }
    _updateTotalBudgeted();
    _updateAllCategories();
  }

  /// The updated list of [_allCategories].
  List<CategoryLegacy?>? get allCategories {
    _updateAllCategories();
    return _allCategories;
  }

  /// The month of the budget in human readable form, for example 'January' for month 1
  String get monthAsString {
    return monthStringFromDate(DateTime(year!, month!));
  }

  /// Add the SubCategory [newSubcat] to this.
  void addSubcategory(SubCategory newSubcat) {
    final SubCategory subcat = newSubcat.copy();
    subcategories.add(subcat);
    final MainCategory cat =
        mainCategories.singleWhere((cat) => cat!.id.toString() == newSubcat.parentId)!;
    if (!_subcatAlreadyPresentIn(cat, newSubcat)) {
      cat.addSubcategory(subcat);
    }
    _updateTotalBudgeted();
  }

  void addMainCategory(MainCategory? cat) {
    mainCategories.add(cat);
  }

  bool _subcatAlreadyPresentIn(MainCategory cat, SubCategory subcat) {
    final SubCategory? presentSubCat = cat.subcategories
        .singleWhere((thisSubcat) => thisSubcat!.id == subcat.id, orElse: () => null);
    if (presentSubCat == null) return false;
    return true;
  }

  /// Replace the subcategory specified by [modifiedSubcategory.id] in the budget by
  /// the values of [modifiedSubcategory].
  void updateSubCategory(SubCategory modifiedSubcategory) {
    // Modify subcategory in this.subcategories
    final SubCategory oldSubcat =
        subcategories.singleWhere((subcat) => modifiedSubcategory.id == subcat!.id)!;
    oldSubcat.update(modifiedSubcategory);

    // Update the values inside the corresponding mainCategory
    final MainCategory cat =
        mainCategories.singleWhere((cat) => modifiedSubcategory.parentId == cat!.id.toString())!;

    cat.updateFields();
    _updateTotalBudgeted();
  }

  void updateSubCategoryName({required int? id, required String newName}) {
    final SubCategory subcat = subcategories.singleWhere((subcat) => subcat!.id == id)!;
    subcat.name = newName;
  }

  void updateMainCategory(MainCategory modifiedMainCategory) {
    final MainCategory cat =
        mainCategories.singleWhere((cat) => cat!.id == modifiedMainCategory.id)!;
    cat.name = modifiedMainCategory.name;
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
    final SubCategory? oldSubcat = subcategories.singleWhere((subcat) => subcat!.id == subcatId);

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
        throw Exception("Pass in an actual field");
    }

    final MainCategory cat = mainCategories.singleWhere((cat) => cat!.id.toString() == categoryId)!;
    cat.updateFields();
    _updateTotalBudgeted();
  }

  /// Fills the list [_allCategories] with each MainCategory followed by its children.
  /// An example is the following:
  /// "\[
  ///   MainCategory_1
  ///   SubCategory_1_1
  ///   SubCategory_1_2
  ///   SubCategory_1_3
  ///   MainCategory_2
  ///   SubCategory_2_1
  /// ]
  void _updateAllCategories() {
    _allCategories = [];
    // Create a list of all MainCategories and Subcategories in order.
    for (final MainCategory? cat in mainCategories) {
      _allCategories!.add(cat);
      for (final subcat in cat!.subcategories) {
        _allCategories!.add(subcat);
      }
    }
  }

  /// Updates the [totalBudgeted] value for the month.
  void _updateTotalBudgeted() {
    totalBudgeted = 0;
    for (final MainCategory? cat in mainCategories) {
      totalBudgeted += cat!.budgeted!;
    }
  }

  @override
  String toString() {
    return """${super} {month: $month, year: $year, mainCategories: $mainCategories, subcategories: $subcategories}\n""";
  }

  /// Deletes the [deletedSubcategory] from the current Budget.
  void removeSubcategory(int? subcatId, String? catId) {
    subcategories.removeWhere((subcat) => subcat!.id == subcatId);
    final MainCategory? cat =
        mainCategories.singleWhere((cat) => cat!.id.toString() == catId, orElse: () => null);
    cat?.removeSubcategory(subcatId);
    _updateTotalBudgeted();
  }

  void removeCategory(int? catId) {
    //! Must call removeSubcategory separately for linked subcategories
    mainCategories.removeWhere((cat) => cat!.id == catId);
    _updateTotalBudgeted();
  }
}
