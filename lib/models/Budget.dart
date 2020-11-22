import 'package:jiffy/jiffy.dart';
import 'package:your_budget/models/categories.dart';

/// Class representing budget that is held monthly, specified by [month] and [year].
/// It holds a list of all [maincategories] and [subcategories], which are put in a specific
/// order in [_allcategories]. The total budgeted value is held in [totalBudgeted].
class Budget {
  List<MainCategory> maincategories = [];
  List<SubCategory> subcategories = [];
  List<Category> _allcategories;
  int month;
  int year;
  double totalBudgeted = 0;

  /// Default constructor for [Budget]. It is declared for a month given by [month] and [year], and
  /// will hold a list of MainCategories in [maincategories], and a list of their respective
  /// children in [subcategories].
  ///
  /// [subcategories] will get linked to their corresponding MainCategory from [maincategories].
  ///
  /// The contents of MainCategory.subcategories of each MainCategory passed in [maincategories] is not taken
  /// into account and replaced with the corresponding [subcategories] .
  Budget(List<MainCategory> maincategories, List<SubCategory> subcategories, int month, int year) {
    for (final MainCategory cat in maincategories) {
      MainCategory newCat = cat.copy();
      List<SubCategory> correspondingSubcats =
          subcategories.where((subcat) => subcat.parentId == cat.id).toList();
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
  List<Category> get allcategories {
    _updateAllcategories();
    return _allcategories;
  }

  /// The month of the budget in human readable form, for example 'January' for month 1
  /// TODO: Replace with utils.monthAsString
  String get monthAsString {
    return Jiffy(DateTime(year, month)).format("MMMM");
  }

  /// Add the SubCategory [newSubcat] to this.
  void addSubcategory(SubCategory newSubcat) {
    SubCategory subcat = newSubcat.copy();
    this.subcategories.add(subcat);
    MainCategory cat = maincategories.singleWhere((cat) => cat.id == newSubcat.parentId);
    cat.addSubcategory(subcat);
    _updateTotalBudgeted();
  }

  /// Replace the subcategory specified by [modifiedSubcategory.id] in the budget by
  /// the values of [modifiedSubcategory].
  void makeCategoryChange(SubCategory modifiedSubcategory) {
    _updateSubCategory(modifiedSubcategory);
    //TODO: Replace outer method with inner method
  }

  /// Modify the values of the SubCategory specified by [modifiedSubcategory.id]
  ///
  ///Must be called before [_updateMainCategory()] because the former
  ///modifies the subcategories in each [MainCategory], and the latter
  ///updates the maincategories based on the subcategories' values.
  void _updateSubCategory(SubCategory modifiedSubcategory) {
    // Modify subcategory in this.subcategories
    SubCategory oldSubcat =
        subcategories.singleWhere((subcat) => modifiedSubcategory.id == subcat.id);
    oldSubcat.update(modifiedSubcategory);

    // Update the values inside the corresponding subcategory
    MainCategory cat = maincategories.singleWhere((cat) => modifiedSubcategory.parentId == cat.id);

    cat.updateFields();
    _updateTotalBudgeted();
  }

  /// Replace the attribute [field] of the SubCategory specified by [subcatId] with [value].
  /// The parent of the SubCategory has to be specified with [categoryId] to be able to
  /// update it's values too.
  void makeSubcategoryChangeBySubcatId(int subcatId, int categoryId, String field, String value) {
    SubCategory oldSubcat = subcategories.singleWhere((subcat) => subcat.id == subcatId);

    switch (field) {
      case "budgeted":
        oldSubcat.budgeted = double.parse(value);
        break;
      case "available":
        oldSubcat.available = double.parse(value);
        break;
      case "name":
        oldSubcat.name = value;
        break;
      default:
        //TODO: Raise error
        print("Pass in an actual field");
    }

    MainCategory cat = maincategories.singleWhere((cat) => cat.id == categoryId);
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
    for (final MainCategory cat in maincategories) {
      _allcategories.add(cat);
      cat.subcategories.forEach((subcat) => _allcategories.add(subcat));
    }
  }

  /// Updates the [totalBudgeted] value for the month.
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

  /// Deletes the [deletedSubcategory] from the current Budget.
  void removeSubcategory(SubCategory deletedSubcategory) {
    subcategories.removeWhere((subcat) => subcat.id == deletedSubcategory.id);
    MainCategory cat = maincategories.singleWhere((cat) => cat.id == deletedSubcategory.parentId);
    cat.removeSubcategory(deletedSubcategory.id);
    _updateTotalBudgeted();
  }
}
