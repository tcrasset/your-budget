import 'package:test/test.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/categories.dart';

void main() {
  test('Modifying subcategory outisde Budget changes it inside too', () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(1, "Test");
    final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);
    final Budget myBudget = Budget([catTest], [subcatTest], 6, 1996);

    double newValue = 9.99;
    subcatTest.available = newValue;
    expect(myBudget.subcategories[0].available, newValue);
  });
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

  test('Budget.makeSubcategoryChangeBySubcatId() modifies the subcategory correctly', () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(1, "Test");
    final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);

    // Construct the Budget
    final Budget myBudget = Budget([catTest], [subcatTest], 6, 1996);

    //Modify the name
    myBudget.makeSubcategoryChangeBySubcatId(subcatTest.id, subcatTest.parentId, "name", "Changed");
    expect(myBudget.subcategories[0].name, "Changed");
    expect(myBudget.maincategories[0].subcategories[0].name, "Changed");

    // Modify budgeted
    myBudget.makeSubcategoryChangeBySubcatId(
        subcatTest.id, subcatTest.parentId, "budgeted", "9.99");
    expect(myBudget.subcategories[0].budgeted, 9.99);
    expect(myBudget.maincategories[0].subcategories[0].budgeted, 9.99);

    // Modify available
    myBudget.makeSubcategoryChangeBySubcatId(
        subcatTest.id, subcatTest.parentId, "available", "9.99");
    expect(myBudget.subcategories[0].available, 9.99);
    expect(myBudget.maincategories[0].subcategories[0].available, 9.99);

    // Check that the maincategory fields were updated
    expect(myBudget.maincategories[0].available, 9.99);
    expect(myBudget.maincategories[0].budgeted, 9.99);
  });

  test('Budget.allcategories() returns all categories in order', () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest1 = MainCategory(1, "Test2");
    final MainCategory catTest2 = MainCategory(2, "Test2");
    final SubCategory subcatTest_1_1 = SubCategory(1, 1, "Test", 66.52, 78.8);
    final SubCategory subcatTest_1_2 = SubCategory(2, 1, "Test", 66.52, 78.8);
    final SubCategory subcatTest_2_1 = SubCategory(3, 2, "Test", 66.52, 78.8);

    // Add the subcategories to their corresponding maincategory
    catTest1.addMultipleSubcategories([subcatTest_1_1, subcatTest_1_2]);
    catTest2.addSubcategory(subcatTest_2_1);

    // Construct Budget
    final Budget myBudget =
        Budget([catTest1, catTest2], [subcatTest_1_1, subcatTest_1_2, subcatTest_2_1], 6, 1996);

    // Construct true version of allcategories
    final List<dynamic> allcategoriesTest = [];
    allcategoriesTest.addAll([catTest1, subcatTest_1_1, subcatTest_1_2, catTest2, subcatTest_2_1]);

    List<dynamic> allcategories = myBudget.allcategories;
    for (int i = 0; i < allcategories.length; i++) {
      expect(allcategories[i].hasSameValues(allcategoriesTest[i]), true);
    }
  });
}
