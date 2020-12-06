import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/models/categories.dart';

class DeleteCategoriesState extends ChangeNotifier {
  Map<int, bool> _isSelectedMapMainCategory = HashMap();
  Map<int, bool> _isSelectedMapSubCategory = HashMap();
  int nbSelectedMainCategory = 0;
  int nbSelectedSubCategory = 0;

  bool isSelected(int id, Type type) {
    if (type == MainCategory)
      return this._isSelectedMapMainCategory[id];
    else
      return this._isSelectedMapSubCategory[id];
  }

  void updateIsSelected(int id, Type type) async {
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
    if (type == MainCategory)
      this._isSelectedMapMainCategory[id] = false;
    else
      this._isSelectedMapSubCategory[id] = false;
  }

  bool deleteCategories(BuildContext context) {
    bool triedToDeleteEssentials = _unallowDeletionOfEssentialMainCategory(context);
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
      List<SubCategory> toUnselect =
          appState.subcategories.where((subcat) => subcat.parentId == categoryId).toList();

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

//TODO: Documentation for DeleteCategoriesState
