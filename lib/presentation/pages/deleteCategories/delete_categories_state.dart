// Dart imports:
import 'dart:collection';

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/models/categories.dart';

class DeleteCategoriesState extends ChangeNotifier {
  /// HashMap to select or unselect Sub- and MainCategories using their id
  final Map<int?, bool> _isSelectedMapMainCategory = HashMap();
  final Map<int?, bool> _isSelectedMapSubCategory = HashMap();
  int nbSelectedMainCategory = 0;
  int nbSelectedSubCategory = 0;

  bool? isSelected(int id, Type type) {
    /// Checks if the Category of type [type] (SubCategory or MainCategory)
    /// with the given [id] has been selected by the user.
    if (type == MainCategory) {
      return _isSelectedMapMainCategory[id];
    } else {
      return _isSelectedMapSubCategory[id];
    }
  }

  Future<void> updateIsSelected(int? id, Type type) async {
    /// Toggles the selection status of Category of type [type]
    /// (SubCategory or MainCategory)  with the given [id].
    /// e.g. if it was not selected, this method selects it and
    /// vice versa.
    if (type == MainCategory) {
      _updateIsSelectMainCategory(id);
    } else {
      _updateIsSelectSubCategory(id);
    }
  }

  Future<void> _updateIsSelectMainCategory(int? id) async {
    if (_isSelectedMapMainCategory[id]!) {
      _isSelectedMapMainCategory[id] = false;
      nbSelectedMainCategory--;
    } else {
      _isSelectedMapMainCategory[id] = true;
      nbSelectedMainCategory++;
    }
  }

  Future<void> _updateIsSelectSubCategory(int? id) async {
    if (_isSelectedMapSubCategory[id]!) {
      _isSelectedMapSubCategory[id] = false;
      nbSelectedSubCategory--;
    } else {
      _isSelectedMapSubCategory[id] = true;
      nbSelectedSubCategory++;
    }
  }

  void setCategoriesToFalse(int? id, Type type) {
    /// Unselects the Category of type [type]
    /// (SubCategory or MainCategory)  with the given [id].
    /// This method is also used to fill up the HashMap
    if (type == MainCategory) {
      _isSelectedMapMainCategory[id] = false;
    } else {
      _isSelectedMapSubCategory[id] = false;
    }
  }

  bool deleteCategories(BuildContext context) {
    /// Deletes categories selected by the user and returns whether the deletion
    /// was sucessfull (true) or not (false).
    ///
    /// It verifies that the "Essentials" is not selected for deletion.
    /// If that is the case, the deletion process is aborted.
    final bool triedToDeleteEssentials =
        _unallowDeletionOfEssentialMainCategory(context);
    if (triedToDeleteEssentials) {
      return false;
    } else {
      _deleteMainCategories(context);
      _unselectSubcategoriesUnderSelectedMainCategories(context);
      _deleteSubCategories(context);
      resetAllSelected();
      notifyListeners();
      return true;
    }
  }

  void _deleteSubCategories(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    for (final int? subcatId in _getSelectedSubcategories()) {
      appState.removeSubcategory(subcatId);
    }
  }

  void _deleteMainCategories(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context, listen: false);
    for (final int? categoryId in _getSelectedCategories()) {
      appState.removeCategory(categoryId);
    }
  }

  List<int?> _getSelectedCategories() {
    final List<int?> selectedCategoryIds = [];

    for (final int? id in _isSelectedMapMainCategory.keys) {
      if (_isSelectedMapMainCategory[id] == true) {
        selectedCategoryIds.add(id);
      }
    }
    return selectedCategoryIds;
  }

  List<int?> _getSelectedSubcategories() {
    final List<int?> selectedSubcCategoryIds = [];

    for (final int? id in _isSelectedMapSubCategory.keys) {
      if (_isSelectedMapSubCategory[id] == true) {
        selectedSubcCategoryIds.add(id);
      }
    }
    return selectedSubcCategoryIds;
  }

  void resetAllSelected() {
    /// Resets all the counters and selected fields of the state
    /// This DOES NOT unselect the checked boxes in the UI.
    final List<int?> subcatIds = _isSelectedMapSubCategory.keys.toList();
    final List<int?> catIds = _isSelectedMapMainCategory.keys.toList();

    for (final int? subcatId in subcatIds) {
      _isSelectedMapSubCategory[subcatId] = false;
    }
    for (final int? catId in catIds) {
      _isSelectedMapMainCategory[catId] = false;
    }
    nbSelectedMainCategory = 0;
    nbSelectedSubCategory = 0;
  }

  void _unselectSubcategoriesUnderSelectedMainCategories(BuildContext context) {
    final AppState appState = Provider.of<AppState>(context, listen: false);

    for (final int? categoryId in _getSelectedCategories()) {
      // Getting subcategories which are children of the MainCategory that
      // we're going to delete.
      final List<SubCategory?> toUnselect = appState.subcategories
          .where((subcat) => subcat!.parentId == categoryId)
          .toList();

      // Unselect categories by setting them to false
      for (final subcat in toUnselect) {
        setCategoriesToFalse(subcat!.id, SubCategory);
      }
    }
  }

  bool _unallowDeletionOfEssentialMainCategory(BuildContext context) {
    final List<int?> catIds = _getSelectedCategories();
    for (final catId in catIds) {
      if (catId == 1) {
        print("You can't delete the Essentials MainCategory");
        return true;
      }
    }
    return false;
  }
}
