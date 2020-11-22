import 'package:test/test.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/categories.dart';

void main() {
  test('Budget.addSubcategory() adds a SubCategory to the Budget', () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(1, "Test");
    final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);

    // Construct the myBudget without subcategory
    final Budget myBudget = Budget([catTest], [], 6, 1996);

    // Now add subcategory
    myBudget.addSubcategory(subcatTest);

    // Verify that the subcategory is added
    expect(myBudget.subcategories.length, 1);

    // Verify that it is added as subcategory to the respective MainCategory
    expect(myBudget.maincategories[0].subcategories.length, 1);
  });

  test('Budget.makeCategoryChange() modifies the subcategory in the Budget correctly', () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(1, "Test");
    final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);

    // Construct the Budget
    final Budget myBudget = Budget([catTest], [subcatTest], 6, 1996);

    //Modify subcategory
    subcatTest.available = 11.11;

    //Make the modification in [myBudget]
    myBudget.makeCategoryChange(subcatTest);

    // Check that the modification were made in the subcategory
    SubCategory myBudgetSubcat = myBudget.subcategories[0];
    expect(myBudgetSubcat.hasSameValues(subcatTest), true);

    //Check that the modifications were made in the MainCategory
    MainCategory myBudgetCat = myBudget.maincategories[0];
    expect(myBudgetCat.available, subcatTest.available);
  });
}
