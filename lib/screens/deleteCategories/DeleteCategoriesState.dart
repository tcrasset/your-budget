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

  void setCategories(int id, Type type) {
    if (type == MainCategory)
      this._isSelectedMapMainCategory[id] = false;
    else
      this._isSelectedMapSubCategory[id] = false;
  }

  void deleteCategories(BuildContext context) {
    _deleteSubCategories(context);
    _deleteMainCategories(context);
  }

  void _deleteSubCategories(BuildContext context) {
    //TODO: Delete selected subategories
  }

  void _deleteMainCategories(BuildContext context) {
    //TODO: Delete selected mainategories
  }
}
