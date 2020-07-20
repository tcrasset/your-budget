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
    for (final MainCategory cat in maincategories) {
      MainCategory newCat = cat.copy();
      List<SubCategory> correspondingSubcats =
          subcategories.where((subcat) => subcat.parentId == cat.id).toList();
      newCat.addMultipleSubcategories(correspondingSubcats);
      newCat.updateFields();
      this.maincategories.add(newCat);
    }
    this.subcategories = subcategories;
    this.month = month;
    this.year = year;
    _updateTotalBudgeted();
    _updateAllcategories();
  }

  void addSubcategory(SubCategory newSubcat) {
    this.subcategories.add(newSubcat.copy());
    MainCategory cat = maincategories.singleWhere((cat) => cat.id == newSubcat.parentId);
    cat.addSubcategory(newSubcat);
    _updateTotalBudgeted();
  }

  void makeCategoryChange(SubCategory modifiedSubcategory) {
    _updateSubCategory(modifiedSubcategory);
    _updateMainCategory(modifiedSubcategory);
  }

  ///Must be called before [_updateMainCategory()] because the former
  ///modifies the subcategories in each [MainCategory], and the latter
  ///updates the maincategories based on the subcategories' values.
  void _updateSubCategory(SubCategory modifiedSubcategory) {
    print(modifiedSubcategory);
    print(subcategories);
    SubCategory oldSubcat =
        subcategories.singleWhere((subcat) => modifiedSubcategory.id == subcat.id);
    oldSubcat.name = modifiedSubcategory.name;
    oldSubcat.budgeted = modifiedSubcategory.budgeted;
    oldSubcat.available = modifiedSubcategory.available;
  }

  void _updateMainCategory(SubCategory modifiedSubcategory) {
    MainCategory cat = maincategories.singleWhere((cat) => modifiedSubcategory.parentId == cat.id);
    cat.updateFields();
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