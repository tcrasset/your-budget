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
  });

  group('MainCategory', () {
    test('SubCategory.blank() returns SubCategory instance copy with zero money budgeted', () {
      final SubCategory subcatTest = SubCategory(3, 1, "Test", 66.52, 78.8);
      expect(subcatTest.blank().budgeted, 0);
    });

    test('MainCategory.copy() returns copy of MainCategory instance', () {
      final MainCategory catTest = MainCategory(3, "Test");
      // Check that the returned MainCategory is not the same instance.
      final MainCategory catCopy = catTest.copy();
      expect(identical(catCopy, catTest), false);
      expect(catCopy.id, catCopy.id);
      expect(catCopy.name, catCopy.name);
    });

    test('MainCategory.addSubcategory() adds a subcategory and updates values', () {
      final MainCategory catTest = MainCategory(3, "Test");
      final SubCategory newSub = SubCategory(3, 1, "Test", 66.52, 78.8);
      catTest.addSubcategory(newSub);
      expect(catTest.subcategories, [newSub]);
      expect(catTest.budgeted, 66.52);
      expect(catTest.available, 78.8);
    });

    test('MainCategory.removeSubcategory() removes a subcategory and updates values', () {
      final MainCategory catTest = MainCategory(3, "Test");
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
