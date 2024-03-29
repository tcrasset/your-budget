// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:provider/provider.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
import 'package:your_budget/components/delete_dialog.dart';
import 'package:your_budget/components/widget_view_classes.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/deleteCategories/components/categories_list.dart';
import 'package:your_budget/presentation/pages/deleteCategories/delete_categories_state.dart';

class DeleteCategories extends StatefulWidget {
  const DeleteCategories({super.key});

  @override
  _DeleteCategoriesController createState() => _DeleteCategoriesController();
}

class _DeleteCategoriesController extends State<DeleteCategories> {
  @override
  Widget build(BuildContext context) => _DeleteCategoriesView(this);

  @override
  void didChangeDependencies() {
    /// Reset the selected mainCategories and subcategories, so
    /// that when we switch back and forth between the DeleteCategories
    /// screen and the ModifyCategories screen, the selected
    /// categories do not remain selected.
    final DeleteCategoriesState showTransactionsState =
        Provider.of<DeleteCategoriesState>(context, listen: false);
    showTransactionsState.resetAllSelected();
    super.didChangeDependencies();
  }

  Future<void> handleDeleteCategories(BuildContext context) async {
    final String? result = await showDeleteDialog(context, 'Delete selected categories?');
    if (result == "Delete") {
      final DeleteCategoriesState showTransactionsState =
          Provider.of<DeleteCategoriesState>(context, listen: false);
      final bool successfulDeletion = showTransactionsState.deleteCategories(context);
      if (successfulDeletion) {
        if (!mounted) return;
        Navigator.pop(context);
      } else {
        const SnackBar snackbar =
            SnackBar(content: Text("You can't delete the Essentials MainCategory"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
    }
  }
}

class _DeleteCategoriesView extends WidgetView<DeleteCategories, _DeleteCategoriesController> {
  const _DeleteCategoriesView(super.state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modify transactions"),
      ),
      body: Consumer2<AppState, DeleteCategoriesState>(
        builder: (_, appState, deleteCategoriesState, __) {
          return CategoriesList();
        },
      ),
      floatingActionButton: Builder(
        builder: (context) => FloatingActionButton(
          onPressed: () => state.handleDeleteCategories(context),
          backgroundColor: Constants.RED_COLOR,
          child: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}
