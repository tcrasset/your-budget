// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/models/categories.dart';

void main() {
  group('SubCategory', () {
    test('SubCategory.blank() returns SubCategory instance copy with zero money budgeted', () {
      final SubCategory subcatTest =
          SubCategory(id: 3, parentId: "1", name: "Test", budgeted: 66.52, available: 78.8);
      expect(subcatTest.blank().budgeted, 0);
    });

    test('SubCategory.copy() returns copy of SubCategory instance', () {
      final SubCategory subcatTest =
          SubCategory(id: 3, parentId: "1", name: "Test", budgeted: 66.52, available: 78.8);
      // Check that the returned SubCategory is not the same instance.
      final SubCategory subcatCopy = subcatTest.copy();
      expect(identical(subcatCopy, subcatTest), false);
      expect(subcatCopy.id, subcatCopy.id);
      expect(subcatCopy.parentId, subcatCopy.parentId);
      expect(subcatCopy.name, subcatCopy.name);
      expect(subcatCopy.budgeted, subcatCopy.budgeted);
      expect(subcatCopy.available, subcatCopy.available);
    });

    test(
        'SubCategory.hasSameValues() returns true for a subcategory and its copy and false otherwise',
        () {
      final SubCategory newSub =
          SubCategory(id: 3, parentId: "1", name: "Same", budgeted: 66.52, available: 78.8);
      final SubCategory newSubCopy =
          SubCategory(id: 3, parentId: "1", name: "Same", budgeted: 66.52, available: 78.8);
      final SubCategory otherSub =
          SubCategory(id: 3, parentId: "1", name: "NotTheSame", budgeted: 66.52, available: 78.8);
      // Check that the copy and the subcategory are the same
      expect(newSub.hasSameValues(newSubCopy), true);
      // Check that newSub and otherSub are different
      expect(newSub.hasSameValues(otherSub), false);
    });

    test('SubCategory.update() returns an updated version of SubCategory instance', () {
      final SubCategory subcatTest =
          SubCategory(id: 3, parentId: "1", name: "Test", budgeted: 66.52, available: 78.8);
      final SubCategory changedSubcat =
          SubCategory(id: 3, parentId: "1", name: "Passed", budgeted: 70.52, available: 68.8);

      //Update the subcategory with new values
      subcatTest.update(changedSubcat);

      //Check that the values got updated
      expect(subcatTest.name, changedSubcat.name);
      expect(subcatTest.budgeted, changedSubcat.budgeted);
      expect(subcatTest.available, changedSubcat.available);
    });
  });

  group('MainCategory', () {
    test('SubCategory.blank() returns SubCategory instance copy with zero money budgeted', () {
      final SubCategory subcatTest =
          SubCategory(id: 3, parentId: "1", name: "Test", budgeted: 66.52, available: 78.8);
      expect(subcatTest.blank().budgeted, 0);
    });

    test('MainCategory.copy() returns copy of MainCategory instance', () {
      final MainCategory catTest = MainCategory(id: 1, name: "Test");
      // Check that the returned MainCategory is not the same instance.
      final MainCategory catCopy = catTest.copy();
      expect(identical(catCopy, catTest), false);
      expect(catCopy.id, catCopy.id);
      expect(catCopy.name, catCopy.name);
    });

    test(
        'MainCategory.hasSameValues() returns true for a maincategory and its copy and false otherwise',
        () {
      final MainCategory cat = MainCategory(id: 1, name: "Same");
      final MainCategory catCopy = MainCategory(id: 1, name: "Same");
      final MainCategory otherCat = MainCategory(id: 1, name: "NotTheSame");

      final SubCategory subcat =
          SubCategory(id: 3, parentId: "1", name: "Same", budgeted: 66.52, available: 78.8);
      cat.addSubcategory(subcat);
      catCopy.addSubcategory(subcat);
      otherCat.addSubcategory(subcat);

      // Check that the copy and the subcategory are the same
      expect(cat.hasSameValues(catCopy), true);
      // Check that newSub and otherSub are different
      expect(cat.hasSameValues(otherCat), false);
    });
    test('MainCategory.updateFields() sums up values from subcategories', () {
      final MainCategory catTest = MainCategory(id: 1, name: "Test");
      final SubCategory newSub =
          SubCategory(id: 3, parentId: "1", name: "Test", budgeted: 66.52, available: 78.8);
      catTest.subcategories = [newSub];

      // Verify it is 0 before updating fields.
      expect(catTest.budgeted, 0);
      expect(catTest.available, 0);

      catTest.updateFields();

      // Verify it is the sum of subcategories after updating fields.
      expect(catTest.budgeted, 66.52);
      expect(catTest.available, 78.8);
    });

    test('MainCategory.addSubcategory() adds a subcategory and updates values', () {
      final MainCategory catTest = MainCategory(id: 1, name: "Test");
      final SubCategory newSub =
          SubCategory(id: 3, parentId: "1", name: "Test", budgeted: 66.52, available: 78.8);
      catTest.addSubcategory(newSub);
      expect(catTest.subcategories, [newSub]);
      expect(catTest.budgeted, 66.52);
      expect(catTest.available, 78.8);
    });

    test('MainCategory.addMultipleSubcategories() adds multiple subcategories and updates values',
        () {
      final MainCategory catTest = MainCategory(id: 1, name: "Test");
      final SubCategory newSub1 =
          SubCategory(id: 1, parentId: "1", name: "Test", budgeted: 60, available: 70);
      final SubCategory newSub2 =
          SubCategory(id: 2, parentId: "1", name: "Test", budgeted: 50, available: 70);

      catTest.addMultipleSubcategories([newSub1, newSub2]);
      expect(catTest.subcategories, [newSub1, newSub2]);
      expect(catTest.budgeted, 110);
      expect(catTest.available, 140);
    });

    test('MainCategory.removeSubcategory() removes a subcategory and updates values', () {
      final MainCategory catTest = MainCategory(id: 1, name: "Test");
      final SubCategory newSub =
          SubCategory(id: 3, parentId: "1", name: "Test", budgeted: 66.52, available: 78.8);

      // Add a subcategory
      catTest.addSubcategory(newSub);
      // Verify that we added the subcategory
      expect(catTest.subcategories, [newSub]);
      expect(catTest.budgeted, 66.52);
      expect(catTest.available, 78.8);

      // Remove the newly added subcategory
      catTest.removeSubcategory(newSub.id);

      //Verify that we removed it
      expect(catTest.subcategories, []);
      expect(catTest.budgeted, 0);
      expect(catTest.available, 0);
    });
  });
}
