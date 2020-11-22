import 'package:test/test.dart';
import 'package:your_budget/models/categories.dart';

void main() {
  group('SubCategory', () {
    test('SubCategory.blank() returns SubCategory instance copy with zero money budgeted', () {
      final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);
      expect(subcatTest.blank().budgeted, 0);
    });

    test('SubCategory.copy() returns copy of SubCategory instance', () {
      final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);
      // Check that the returned SubCategory is not the same instance.
      final SubCategory subcatCopy = subcatTest.copy();
      expect(identical(subcatCopy, subcatTest), false);
      expect(subcatCopy.id, subcatCopy.id);
      expect(subcatCopy.parentId, subcatCopy.parentId);
      expect(subcatCopy.name, subcatCopy.name);
      expect(subcatCopy.budgeted, subcatCopy.budgeted);
      expect(subcatCopy.available, subcatCopy.available);
    });

    test('SubCategory.update() returns an updated version of SubCategory instance', () {
      final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);
      final SubCategory changedSubcat = SubCategory(3, 1, "Passed", 70.52, 68.8);

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
      final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);
      expect(subcatTest.blank().budgeted, 0);
    });

    test('MainCategory.copy() returns copy of MainCategory instance', () {
      final MainCategory catTest = MainCategory(1, "Test");
      // Check that the returned MainCategory is not the same instance.
      final MainCategory catCopy = catTest.copy();
      expect(identical(catCopy, catTest), false);
      expect(catCopy.id, catCopy.id);
      expect(catCopy.name, catCopy.name);
    });

    test(
        'MainCategory.hasSameValues() returns true for a subcategory and its copy and false otherwise',
        () {
      final SubCategory newSub = SubCategory(3, 1, "Same", 66.52, 78.8);
      final SubCategory newSubCopy = SubCategory(3, 1, "Same", 66.52, 78.8);
      final SubCategory otherSub = SubCategory(3, 1, "NotTheSame", 66.52, 78.8);
      // Check that the copy and the subcategory are the same
      expect(newSub.hasSameValues(newSubCopy), true);
      // Check that newSub and otherSub are different
      expect(newSub.hasSameValues(otherSub), false);
    });
    test('MainCategory.updateFields() sums up values from subcategories', () {
      final MainCategory catTest = MainCategory(1, "Test");
      final SubCategory newSub = SubCategory(3, 1, "Test", 66.52, 78.8);
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
      final MainCategory catTest = MainCategory(1, "Test");
      final SubCategory newSub = SubCategory(3, 1, "Test", 66.52, 78.8);
      catTest.addSubcategory(newSub);
      expect(catTest.subcategories, [newSub]);
      expect(catTest.budgeted, 66.52);
      expect(catTest.available, 78.8);
    });

    test('MainCategory.addMultipleSubcategories() adds multiple subcategories and updates values',
        () {
      final MainCategory catTest = MainCategory(1, "Test");
      final SubCategory newSub1 = SubCategory(1, 1, "Test", 60, 70);
      final SubCategory newSub2 = SubCategory(2, 1, "Test", 50, 70);

      catTest.addMultipleSubcategories([newSub1, newSub2]);
      expect(catTest.subcategories, [newSub1, newSub2]);
      expect(catTest.budgeted, 110);
      expect(catTest.available, 140);
    });

    test('MainCategory.removeSubcategory() removes a subcategory and updates values', () {
      final MainCategory catTest = MainCategory(1, "Test");
      final SubCategory newSub = SubCategory(3, 1, "Test", 66.52, 78.8);

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
