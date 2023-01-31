// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
import 'package:your_budget/domain/budget/budget_repository.dart';
// Project imports:
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/about/about_screen.dart';
import 'package:your_budget/presentation/pages/budget/components/budget_view.dart';
import 'package:your_budget/presentation/pages/budget/components/date_button.dart';
import 'package:your_budget/presentation/pages/budget/components/to_be_budgeted.dart';
import 'package:your_budget/presentation/pages/modifyCategories/modify_categories.dart';

class BudgetPage extends StatefulWidget {
  final String? title;

  const BudgetPage({Key? key, this.title}) : super(key: key);

  @override
  _BudgetPageState createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  bool showMenu = true;

  //TODO: Settings
  void handleSettings() {}

  Future<void> handlePopUpMenuButtonSelected(String selectedItem) async {
    if (selectedItem == "About") {
      await Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage()));
    }
  }

  void handleModifyCategories() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ModifyCategories()));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BudgetBloc(budgetRepository: context.read<BudgetRepository>())
        ..add(BudgetEvent.NewBudgetRequested(DateTime.now())),
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
          backgroundColor: Constants.PRIMARY_COLOR,
          leading: const Icon(Constants.BUDGET_ICON),
          actions: <Widget>[
            SizedBox(
              width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(FontAwesomeIcons.checkSquare),
                    onPressed: handleModifyCategories,
                  ),
                  PopupMenuButton(
                    onSelected: handlePopUpMenuButtonSelected,
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
      ),
    );
  }
}
