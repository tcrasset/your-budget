// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Package imports:
import 'package:provider/provider.dart';
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';

// Project imports:
import 'package:your_budget/appstate.dart';
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
        child: BlocBuilder<SubcategoryWatcherBloc, SubcategoryWatcherState>(
          builder: (context, state) {
            return state.map(
              initial: (_) => const CircularProgressIndicator(),
              loading: (_) => const CircularProgressIndicator(),
              loadFailure: (_) => const Center(child: Text("Failure.")),
              loadSuccess: (newState) => Column(children: _buildList(newState.subcategories)),
            );
          },
        ),
      ),
    );
  }
}

List<Widget> _buildList(List<Subcategory> categories) {
  final List<Widget> widgetList = [];

  const Divider divider = Divider(height: 1, color: Colors.black12);

  for (final Subcategory category in categories) {
    widgetList.add(SubcategoryRow(subcat: category));
    widgetList.add(divider);
  }

  return widgetList;
}
