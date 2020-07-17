import 'categories.dart';

class Budget {
  List<MainCategory> maincategories = [];
  List<SubCategory> subcategories;
  double totalBudgeted;

  int year;
  int month;

  List<Category> get allcategories {
    final List<Category> allcategories = [];
    for (final MainCategory cat in maincategories) {
      allcategories.add(cat);
      allcategories.addAll(cat.subcategories);
    }
    return allcategories;
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
    _computeTotalBudgeted();
  }

  void addSubcategory(SubCategory subcategory) {
    MainCategory cat = maincategories.singleWhere((cat) => subcategory.parentId == cat.id);
    cat.addSubcategory(subcategory);
    _computeTotalBudgeted();
  }

  void makeCategoryChange(SubCategory modifiedSubcategory) {
    MainCategory cat = maincategories.singleWhere((cat) => modifiedSubcategory.parentId == cat.id);
    SubCategory oldSubcat =
        cat.subcategories.singleWhere((subcat) => modifiedSubcategory.id == subcat.id);
    oldSubcat.available = modifiedSubcategory.available;
    oldSubcat.budgeted = modifiedSubcategory.budgeted;
    oldSubcat.name = modifiedSubcategory.name;
    cat.updateFields();
    _computeTotalBudgeted();
  }

  _computeTotalBudgeted() {
    totalBudgeted = 0;
    for (final MainCategory cat in maincategories) {
      totalBudgeted += cat.budgeted;
    }
  }
}
