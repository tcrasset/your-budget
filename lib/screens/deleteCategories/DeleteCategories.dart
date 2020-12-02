import 'package:flutter/material.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/components/deleteDialog.dart';
import 'package:your_budget/components/widgetViewClasses.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/screens/deleteCategories/DeleteCategoriesState.dart';
import 'package:your_budget/screens/deleteCategories/components/CategoriesList.dart';
import 'package:your_budget/screens/showTransactions/showTransactionsState.dart';
import 'package:provider/provider.dart';

class DeleteCategories extends StatefulWidget {
  const DeleteCategories({Key key}) : super(key: key);

  @override
  _DeleteCategoriesController createState() => _DeleteCategoriesController();
}

class _DeleteCategoriesController extends State<DeleteCategories> {
  @override
  Widget build(BuildContext context) => _DeleteCategoriesView(this);

  void handleDeleteCategories(BuildContext context) async {
    String result = await showDeleteDialog(context, 'Delete selected categories?');
    if (result == "Delete") {
      ShowTransactionsState showTransactionsState =
          Provider.of<ShowTransactionsState>(context, listen: false);
      showTransactionsState.deleteTransactions(context);
    }
  }
}

class _DeleteCategoriesView extends WidgetView<DeleteCategories, _DeleteCategoriesController> {
  _DeleteCategoriesView(_DeleteCategoriesController state) : super(state);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Modify transactions"),
      ),
      body: Consumer2<AppState, DeleteCategoriesState>(
          builder: (_, appState, deleteCategoriesState, __) {
        return CategoriesList();
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => state.handleDeleteCategories(context),
        backgroundColor: Constants.RED_COLOR,
        child: Icon(Icons.delete_outline),
      ),
    );
  }
}
