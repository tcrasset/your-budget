import 'package:mybudget/models/categories.dart';

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

  void addSubcategory(SubCategory newSubcat) {
    this.subcategories.add(newSubcat);
    MainCategory cat = maincategories.singleWhere((cat) => cat.id == newSubcat.parentId);
    cat.addSubcategory(newSubcat);
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
