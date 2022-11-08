// Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:your_budget/application/budget/category_watcher_bloc/category_watcher_bloc.dart';

// Package imports:
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/domain/category/category.dart';

// Project imports:
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/presentation/pages/budget/components/maincategory_row.dart';
import 'package:your_budget/presentation/pages/budget/components/subcategory_row.dart';

class CategoriesList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = useScrollController();
    return Scrollbar(
      controller: scrollController,
      child: SingleChildScrollView(
        controller: scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Builder(
          builder: (context) {
            final subcategoryBlocState = context.watch<SubcategoryWatcherBloc>().state;
            final categoryBlocState = context.watch<CategoryWatcherBloc>().state;

            final Option<List<Subcategory>> subcategoriesOption = subcategoryBlocState.maybeMap(
              loadSuccess: (state) => some(state.subcategories),
              orElse: () => none(),
            );

            final Option<List<Category>> categoriesOption = categoryBlocState.maybeMap(
              loadSuccess: (state) => some(state.categories),
              orElse: () => none(),
            );

            if (categoriesOption.isNone()) {
              return categoryBlocState.maybeMap(
                  loadFailure: (_) => const Center(child: Text("Failure.")),
                  orElse: () => const CircularProgressIndicator());
            } else if (subcategoriesOption.isNone()) {
              return subcategoryBlocState.maybeMap(
                  loadFailure: (_) => const Center(child: Text("Failure.")),
                  orElse: () => const CircularProgressIndicator());
            } else {
              return Column(
                children: _buildList(
                    categories: categoriesOption.getOrElse(() => throw Exception()),
                    subcategories: subcategoriesOption.getOrElse(() => throw Exception())),
              );
            }
          },
        ),
      ),
    );
  }
}

List<Widget> _buildList(
    {required List<Subcategory> subcategories, required List<Category> categories}) {
  final List<Widget> widgetList = [];

  const Divider divider = Divider(height: 1, color: Colors.red);

  for (final Category category in categories) {
    final correspondingSubcategories =
        subcategories.where((subcat) => subcat.categoryID == category.id);
    final budgeted = correspondingSubcategories.fold<double>(
        0, (total, subcat) => total + subcat.budgeted.getOrCrash());
    final available = correspondingSubcategories.fold<double>(
        0, (total, subcat) => total + subcat.available.getOrCrash());

    widgetList.add(MainCategoryRow(
      name: category.name.getOrCrash(),
      budgeted: budgeted,
      available: available,
    ));

    widgetList.add(divider);

    correspondingSubcategories.forEach((subcat) {
      widgetList.add(divider);
      widgetList.add(SubcategoryRow(subcat: subcat));
      widgetList.add(SubcategoryRow(subcat: subcat));
      widgetList.add(SubcategoryRow(subcat: subcat));
    });
  }

  return widgetList;
}
