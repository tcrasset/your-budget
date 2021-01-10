import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/models/categories.dart';

class DeleteCategoriesState extends ChangeNotifier {
  /// HashMap to select or unselect Sub- and MainCategories using their id
  Map<int, bool> _isSelectedMapMainCategory = HashMap();
  Map<int, bool> _isSelectedMapSubCategory = HashMap();
  int nbSelectedMainCategory = 0;
  int nbSelectedSubCategory = 0;

  bool isSelected(int id, Type type) {
    /// Checks if the Category of type [type] (SubCategory or MainCategory)
    /// with the given [id] has been selected by the user.
    if (type == MainCategory)
      return this._isSelectedMapMainCategory[id];
    else
      return this._isSelectedMapSubCategory[id];
  }

  void updateIsSelected(int id, Type type) async {
    /// Toggles the selection status of Category of type [type]
    /// (SubCategory or MainCategory)  with the given [id].
    /// e.g. if it was not selected, this method selects it and
    /// vice versa.
    if (type == MainCategory)
      _updateIsSelectMainCategory(id);
    else
      _updateIsSelectSubCategory(id);
  }

  void _updateIsSelectMainCategory(int id) async {
    if (_isSelectedMapMainCategory[id]) {
      _isSelectedMapMainCategory[id] = false;
      nbSelectedMainCategory--;
    } else {
      _isSelectedMapMainCategory[id] = true;
      nbSelectedMainCategory++;
    }
    print(nbSelectedMainCategory);
  }

  void _updateIsSelectSubCategory(int id) async {
    if (_isSelectedMapSubCategory[id]) {
      _isSelectedMapSubCategory[id] = false;
      nbSelectedSubCategory--;
    } else {
      _isSelectedMapSubCategory[id] = true;
      nbSelectedSubCategory++;
    }
    print(nbSelectedSubCategory);
  }

  void setCategoriesToFalse(int id, Type type) {
    /// Unselects the Category of type [type]
    /// (SubCategory or MainCategory)  with the given [id].
    /// This method is also used to fill up the HashMap
    if (type == MainCategory)
      this._isSelectedMapMainCategory[id] = false;
    else
      this._isSelectedMapSubCategory[id] = false;
  }

  bool deleteCategories(BuildContext context) {
    /// Deletes categories selected by the user and returns whether the deletion
    /// was sucessfull (true) or not (false).
    ///
    /// It verifies that the "Essentials" is not selected for deletion.
    /// If that is the case, the deletion process is aborted.
    bool triedToDeleteEssentials =
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
    AppState appState = Provider.of<AppState>(context, listen: false);
    for (int subcatId in _getSelectedSubcategories()) {
      appState.removeSubcategory(subcatId);
    }
  }

  void _deleteMainCategories(BuildContext context) {
    AppState appState = Provider.of<AppState>(context, listen: false);
    for (int categoryId in _getSelectedCategories()) {
      appState.removeCategory(categoryId);
    }
  }

  List<int> _getSelectedCategories() {
    List<int> selectedCategoryIds = [];

    for (int id in this._isSelectedMapMainCategory.keys) {
      if (this._isSelectedMapMainCategory[id] == true) {
        selectedCategoryIds.add(id);
      }
    }
    return selectedCategoryIds;
  }

  List<int> _getSelectedSubcategories() {
    List<int> selectedSubcCategoryIds = [];

    for (int id in this._isSelectedMapSubCategory.keys) {
      if (this._isSelectedMapSubCategory[id] == true) {
        selectedSubcCategoryIds.add(id);
      }
    }
    return selectedSubcCategoryIds;
  }

  void resetAllSelected() {
    /// Resets all the counters and selected fields of the state
    /// This DOES NOT unselect the checked boxes in the UI.
    List<int> subcatIds = this._isSelectedMapSubCategory.keys.toList();
    List<int> catIds = this._isSelectedMapMainCategory.keys.toList();

    for (int subcatId in subcatIds) {
      this._isSelectedMapSubCategory[subcatId] = false;
    }
    for (int catId in catIds) {
      this._isSelectedMapMainCategory[catId] = false;
    }
    nbSelectedMainCategory = 0;
    nbSelectedSubCategory = 0;
  }

  void _unselectSubcategoriesUnderSelectedMainCategories(context) {
    AppState appState = Provider.of<AppState>(context, listen: false);

    for (int categoryId in _getSelectedCategories()) {
      // Getting subcategories which are children of the MainCategory that
      // we're going to delete.
      List<SubCategory> toUnselect = appState.subcategories
          .where((subcat) => subcat.parentId == categoryId)
          .toList();

      // Unselect categories by setting them to false
      for (var subcat in toUnselect) {
        setCategoriesToFalse(subcat.id, SubCategory);
      }
    }
  }

  bool _unallowDeletionOfEssentialMainCategory(BuildContext context) {
    List<int> catIds = _getSelectedCategories();
    for (var catId in catIds) {
      if (catId == 1) {
        print("You can't delete the Essentials MainCategory");
        return true;
      }
    }
    return false;
  }
}
