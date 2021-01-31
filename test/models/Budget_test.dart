import 'package:test/test.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/categories.dart';

void main() {
  test('Modifying subcategory outisde Budget changes it inside too', () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(id: 1, name: "Test");
    final SubCategory subcatTest = SubCategory(
        id: 3, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);
    final Budget myBudget = Budget([catTest], [subcatTest], 6, 1996);

    double newValue = 9.99;
    subcatTest.available = newValue;
    expect(myBudget.subcategories[0].available, newValue);
  });
  test('Budget.addSubcategory() adds a SubCategory to the Budget', () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(id: 1, name: "Test");
    final SubCategory subcatTest = SubCategory(
        id: 3, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);

    // Construct the myBudget without subcategory
    final Budget myBudget = Budget([catTest], [], 6, 1996);

    // Now add subcategory
    myBudget.addSubcategory(subcatTest);

    // Verify that the subcategory is added
    expect(myBudget.subcategories.length, 1);

    // Verify that it is added as subcategory to the respective MainCategory
    expect(myBudget.maincategories[0].subcategories.length, 1);
  });

  test('when addMaincategory is called, add a MainCategory to the budget', () {
    //!Arrange
    final MainCategory catTest = MainCategory(id: 1, name: "Test");
    // No maincategories in constructor because it gets copied in it
    final Budget myBudget = Budget([], [], 6, 1996);

    //!Act
    myBudget.addMaincategory(catTest);

    //!Assert
    expect(myBudget.maincategories, [catTest]);
  });

  test(
      'Budget.updateSubCategory() modifies the subcategory in the Budget correctly',
      () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(id: 1, name: "Test");
    final SubCategory subcatTest = SubCategory(
        id: 3, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);

    // Construct the Budget
    final Budget myBudget = Budget([catTest], [subcatTest], 6, 1996);

    //Modify subcategory
    subcatTest.available = 11.11;

    //Make the modification in [myBudget]
    myBudget.updateSubCategory(subcatTest);

    // Check that the modification were made in the subcategory
    SubCategory myBudgetSubcat = myBudget.subcategories[0];
    expect(myBudgetSubcat.hasSameValues(subcatTest), true);

    //Check that the modifications were made in the MainCategory
    MainCategory myBudgetCat = myBudget.maincategories[0];
    expect(myBudgetCat.available, subcatTest.available);
  });

  test('Budget.updateMaincategory() modifies the maincategory name (only)', () {
    final MainCategory catTest = MainCategory(id: 1, name: "Test");
    final MainCategory newCat = MainCategory(id: 1, name: "Name changed");

    //TODO: Enforce name only change
    // Construct the Budget
    final Budget myBudget = Budget([catTest], [], 6, 1996);

    //Make the modification in [myBudget]
    myBudget.updateMaincategory(newCat);

    // Check that the modification were made in the maincategory
    MainCategory budgetCat = myBudget.maincategories[0];
    expect(budgetCat.hasSameValues(newCat), true);
  });

  test(
      'Budget.makeSubcategoryChangeBySubcatId() modifies the subcategory correctly',
      () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest = MainCategory(id: 1, name: "Test");
    final SubCategory subcatTest = SubCategory(
        id: 3, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);

    // Construct the Budget
    final Budget myBudget = Budget([catTest], [subcatTest], 6, 1996);

    //Modify the name
    myBudget.makeSubcategoryChangeBySubcatId(
        subcatTest.id, subcatTest.parentId, "name", "Changed");
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
    final MainCategory catTest1 = MainCategory(id: 1, name: "Test2");
    final MainCategory catTest2 = MainCategory(id: 2, name: "Test2");
    final SubCategory subcatTest_1_1 = SubCategory(
        id: 1, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);
    final SubCategory subcatTest_1_2 = SubCategory(
        id: 2, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);
    final SubCategory subcatTest_2_1 = SubCategory(
        id: 3, parentId: 2, name: "Test", budgeted: 66.52, available: 78.8);

    // Add the subcategories to their corresponding maincategory
    catTest1.addMultipleSubcategories([subcatTest_1_1, subcatTest_1_2]);
    catTest2.addSubcategory(subcatTest_2_1);

    // Construct Budget
    final Budget myBudget = Budget([catTest1, catTest2],
        [subcatTest_1_1, subcatTest_1_2, subcatTest_2_1], 6, 1996);

    // Construct true version of allcategories
    final List<dynamic> allcategoriesTest = [];
    allcategoriesTest.addAll(
        [catTest1, subcatTest_1_1, subcatTest_1_2, catTest2, subcatTest_2_1]);

    List<dynamic> allcategories = myBudget.allcategories;
    for (int i = 0; i < allcategories.length; i++) {
      expect(allcategories[i].hasSameValues(allcategoriesTest[i]), true);
    }
  });

  test('Budget.totalBudgeted sums the budgeted value from every maincategory',
      () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest1 = MainCategory(id: 1, name: "Test2");
    final MainCategory catTest2 = MainCategory(id: 2, name: "Test2");
    final SubCategory subcatTest_1_1 = SubCategory(
        id: 1, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);
    final SubCategory subcatTest_1_2 = SubCategory(
        id: 2, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);
    final SubCategory subcatTest_2_1 = SubCategory(
        id: 3, parentId: 2, name: "Test", budgeted: 66.52, available: 78.8);

    // Add the subcategories to their corresponding maincategory
    catTest1.addMultipleSubcategories([subcatTest_1_1, subcatTest_1_2]);
    catTest2.addSubcategory(subcatTest_2_1);

    // Construct Budget
    final Budget myBudget = Budget([catTest1, catTest2],
        [subcatTest_1_1, subcatTest_1_2, subcatTest_2_1], 6, 1996);

    double totalBudgetedTest = catTest1.budgeted + catTest2.budgeted;

    expect(myBudget.totalBudgeted, totalBudgetedTest);
  });

  test('Budget.removeSubcategory() removes the subcategory and updates values',
      () {
    // Create a category and a subcategory that should be linked to it
    final MainCategory catTest1 = MainCategory(id: 1, name: "Test2");
    final MainCategory catTest2 = MainCategory(id: 2, name: "Test2");
    final SubCategory subcatTest_1_1 = SubCategory(
        id: 1, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);
    final SubCategory subcatTest_1_2 = SubCategory(
        id: 2, parentId: 1, name: "Test", budgeted: 66.52, available: 78.8);
    final SubCategory subcatTest_2_1 = SubCategory(
        id: 3, parentId: 2, name: "Test", budgeted: 66.52, available: 78.8);

    // Add the subcategories to their corresponding maincategory
    catTest1.addMultipleSubcategories([subcatTest_1_1, subcatTest_1_2]);
    catTest2.addSubcategory(subcatTest_2_1);

    // Construct Budget
    final Budget myBudget = Budget([catTest1, catTest2],
        [subcatTest_1_1, subcatTest_1_2, subcatTest_2_1], 6, 1996);

    // Remove subcategory
    myBudget.removeSubcategory(subcatTest_1_2.id, subcatTest_1_2.parentId);

    //Check that subcategory is not in the list
    expect(myBudget.subcategories.contains(subcatTest_1_2), false);

    //Check maincategory values got updated
    expect(myBudget.maincategories[0].budgeted, 66.52);

    //Check that totalBudgeted got updated
    expect(myBudget.totalBudgeted, 66.52 + 66.52);
  });

  test('verify that updateSubCategoryName updates the names of the subcategory',
      () {
    //!Arrange
    int tSubcatId = 3;
    String tNewName = "Name changed";
    final SubCategory subcatTest = SubCategory(
      id: tSubcatId,
      parentId: 1,
      name: "Test",
      budgeted: 66.52,
      available: 78.8,
    );

    final Budget myBudget = Budget([], [subcatTest], 6, 1996);

    //!Act
    myBudget.updateSubCategoryName(id: tSubcatId, newName: tNewName);

    //!Assert
    SubCategory subcat = myBudget.subcategories.singleWhere((subcat)  => subcat.id == tSubcatId);
    expect(subcat.name, tNewName);
  });
}
