// Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'add_transaction_field.dart';
import 'search_field.dart';

class SubcategoryField extends StatelessWidget {
  const SubcategoryField({
    Key? key,
  }) : super(key: key);

  static const String _DEFAULT_SUBCATEGORY = "Select subcategory";

  Future<void> handleOnTap(BuildContext context) async {
    final TransactionCreatorBloc bloc = context.read<TransactionCreatorBloc>();
    final Subcategory? subcategory = await showSearch<Subcategory?>(
      context: context,
      delegate: SubcategorySearchDelegate(superContext: context),
    );

    if (subcategory != null) {
      bloc.add(TransactionCreatorEvent.subcategoryChanged(subcategory));
    }
  }

  String? validateSubcategory(BuildContext context) =>
      optionOf(context.read<TransactionCreatorBloc>().state.moneyTransaction.subcategory).fold(
        () => null,
        (subcategory) => subcategory.name.value.fold(
          (f) => f.maybeMap(emptyName: (_) => "Please select a Subcategory", orElse: () => null),
          (_) => null,
        ),
      );

  String getSubcategoryName(BuildContext context) => optionOf(
        context
            .watch<TransactionCreatorBloc>() // watch is necessary here
            .state
            .moneyTransaction
            .subcategory,
      ).fold(
        () => throw Exception("Expected Subcategory, got none() instead."),
        (subcategory) => subcategory.name.value.fold((_) => _DEFAULT_SUBCATEGORY, (v) => v),
      );

  @override
  Widget build(BuildContext context) => AddTransactionField(
        name: "Subcategory",
        defaultValue: _DEFAULT_SUBCATEGORY,
        nameGetter: getSubcategoryName,
        onTap: handleOnTap,
        validator: validateSubcategory,
      );
}

class SubcategorySearchDelegate extends SearchDelegate<Subcategory?> {
  // Pass the callers context down the tree to get the Bloc
  // as SearchDelegate does not have an ancestor widget per se.
  final BuildContext superContext;
  SubcategorySearchDelegate({required this.superContext});

  @override
  List<Widget>? buildActions(BuildContext context) => null;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const BackButtonIcon(),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) => _build(context);

  @override
  Widget buildResults(BuildContext context) => _build(context);

  Widget _build(BuildContext context) {
    return BlocBuilder<SubcategoryWatcherBloc, SubcategoryWatcherState>(
      bloc: BlocProvider.of<SubcategoryWatcherBloc>(superContext)
        ..add(const SubcategoryWatcherEvent.watchSubcategoriesStarted()),
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) {
            final subcategories = newState.subcategories
                .where((p) => p.name.toString().toLowerCase().contains(query.toLowerCase()))
                .toList();

            if (subcategories.isEmpty) return Container();

            return ListView.separated(
              shrinkWrap: true,
              itemCount: subcategories.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 1, color: Colors.black12),
              itemBuilder: (BuildContext context, int index) {
                final payee = subcategories[index];
                final String name = payee.name.getOrCrash();
                return ListTile(title: Text(name), onTap: () => close(context, payee));
              },
            );
          },
          loadFailure: (_) => const Center(child: Text("Failure.")),
          loading: (_) => const Center(child: CircularProgressIndicator()),
          orElse: () => const Center(child: Text("Else.")),
        );
      },
    );
  }
}
