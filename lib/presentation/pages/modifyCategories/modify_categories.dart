// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Package imports:
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:your_budget/application/budget/budget_bloc/budget_bloc.dart';
import 'package:your_budget/application/budget/category_creator_bloc/category_creator_bloc.dart';

// Project imports:
import 'package:your_budget/components/add_dialog.dart';
import 'package:your_budget/domain/budget/budget.dart';
import 'package:your_budget/presentation/pages/deleteCategories/delete_categories.dart';
import 'package:your_budget/presentation/pages/modifyCategories/components/add_category_dialog.dart';
import 'package:your_budget/presentation/pages/modifyCategories/components/modify_main_category_row.dart';
import 'package:your_budget/presentation/pages/modifyCategories/components/modify_subcategory_row.dart';

class ModifyCategories extends StatelessWidget {
  const ModifyCategories();

  Future<void> handleAddCategory(BuildContext context) async {
    const String hintText = "Add new category";
    final bloc = context.read<CategoryCreatorBloc>();

    final String? categoryName = await addCategoryDialog(
      superContext: context,
    );

    if (categoryName != null) {
      bloc.add(CategoryCreatorEvent.nameChanged(categoryName));
      bloc.add(const CategoryCreatorEvent.saved());
    }
  }

  void handleDeleteCategory(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const DeleteCategories()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Modify categories"),
        actions: <Widget>[
          IconButton(
            icon: const Icon(FontAwesomeIcons.trash),
            onPressed: () => handleDeleteCategory(context),
          ),
          IconButton(
            icon: const Icon(FontAwesomeIcons.plus),
            onPressed: () => handleAddCategory(context),
          ),
        ],
      ),
      body: BlocBuilder<BudgetBloc, BudgetState>(
        builder: (context, state) {
          if (state.status == BudgetOverviewStatus.loading ||
              state.status == BudgetOverviewStatus.initial) {
            return const CircularProgressIndicator();
          } else if (state.status == BudgetOverviewStatus.failure) {
            return const CircularProgressIndicator();
          } else if (state.status == BudgetOverviewStatus.success) {
            final List<Widget> items = createListFromBudgetGroups(state.budget!.groups);
            return Center(
              child: Scrollbar(
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) => items[index],
                  itemCount: items.length,
                  separatorBuilder: (BuildContext context, int index) =>
                      const Divider(height: 1, color: Colors.purple),
                ),
              ),
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }

  List<Widget> createListFromBudgetGroups(List<BudgetEntryGroups> groups) {
    return groups.fold(
      [],
      (items, group) => [
        ...items,
        ModifyMainCategoryRow(
          name: group.category.name,
          id: group.category.id,
        ),
        ...group.entries.map(
          (e) => ModifySubcategoryRow(name: e.name, id: e.subcategoryId),
        ),
      ],
    );
  }
}

String? validateCategoryName(String name) {
  if (name.isEmpty) return "Name can't be empty.";
  return null;
}
