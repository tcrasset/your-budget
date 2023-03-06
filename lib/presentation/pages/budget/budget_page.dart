// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
import 'package:your_budget/application/budget/category_creator_bloc/category_creator_bloc.dart';
import 'package:your_budget/application/budget/subcategory_creator_bloc/subcategory_creator_bloc.dart';
import 'package:your_budget/domain/budget/budget_repository.dart';
import 'package:your_budget/domain/budget/subcategory_repository.dart';
// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/about/about_screen.dart';
import 'package:your_budget/presentation/pages/budget/components/budget_view.dart';
import 'package:your_budget/presentation/pages/budget/components/date_button.dart';
import 'package:your_budget/presentation/pages/budget/components/to_be_budgeted.dart';
import 'package:your_budget/presentation/pages/modifyCategories/modify_categories.dart';

class BudgetPage extends StatelessWidget {
  final String title;

  const BudgetPage({super.key, required this.title});

  //TODO: Settings
  void handleSettings() {}

  Future<void> handlePopUpMenuButtonSelected(BuildContext context, String selectedItem) async {
    if (selectedItem == "About") {
      await Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
    }
  }

  void handleModifyCategories(BuildContext superContext) {
    Navigator.push(
      superContext,
      MaterialPageRoute(
        builder: (_) => MultiRepositoryProvider(
          providers: [
            RepositoryProvider.value(
              value: RepositoryProvider.of<SubcategoryRepository>(superContext),
            ),
          ],
          child: MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: BlocProvider.of<BudgetBloc>(superContext),
              ),
              BlocProvider.value(
                value: BlocProvider.of<CategoryCreatorBloc>(superContext),
              ),
            ],
            child: const ModifyCategories(),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Constants.PRIMARY_COLOR,
        leading: const Icon(Constants.BUDGET_ICON),
        actions: <Widget>[
          SizedBox(
            width: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: const Icon(FontAwesomeIcons.squareCheck),
                  onPressed: () => handleModifyCategories(context),
                ),
                PopupMenuButton(
                  onSelected: (selected) =>
                      handlePopUpMenuButtonSelected(context, selected.toString()),
                  itemBuilder: (context) => [
                    const PopupMenuItem<String>(
                      value: "About",
                      child: Text("About"),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: <Widget>[
          DateButtons(), //
          ToBeBudgeted(),
          const Expanded(child: BudgetEntries()),
          // if (buttonDial != null) buttonDial
        ],
      ),
    );
  }
}
