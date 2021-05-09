// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';
import '../../../../components/row_container.dart';
import 'search_field.dart';

class SubcategoryField extends HookWidget {
  const SubcategoryField({
    Key key,
  }) : super(key: key);

  static const String _DEFAULT_SUBCATEGORY = "Select subcategory";

  Future<void> handleOnTap(BuildContext context) async {
    final Subcategory subcategory = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubcategoryListScaffold()),
    );

    if (subcategory != null) {
      context
          .read<TransactionCreatorBloc>()
          .add(TransactionCreatorEvent.subcategoryChanged(subcategory));
    }
  }

  String getSubcategoryName(BuildContext context) {
    return context
        .watch<TransactionCreatorBloc>()
        .state
        .moneyTransaction
        .subcatName
        .value
        .fold((_) => "Select subcategory", (v) => v);
  }

  String validateSubcategory(BuildContext context) =>
      context.read<TransactionCreatorBloc>().state.moneyTransaction.subcatName.value.fold(
            (f) => f.maybeMap(orElse: () => null),
            (_) => null,
          );

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    controller.text = getSubcategoryName(context);
    return GestureDetector(
      // Payees gesture detectory leading to 'Payees' SelectValuePage
      onTap: () => handleOnTap(context),
      child: RowContainer(
        name: "Payee",
        childWidget: TextFormField(
          decoration: const InputDecoration.collapsed(hintText: ""),
          style: controller.text == _DEFAULT_SUBCATEGORY
              ? AddTransactionStyles.unselected
              : AddTransactionStyles.selected,
          enabled: false,
          readOnly: true,
          validator: (_) => validateSubcategory(context),
          controller: controller,
        ),
      ),
    );
  }
}

class SubcategoryListScaffold extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider<SubcategoryWatcherBloc>(
          create: (context) => SubcategoryWatcherBloc(
              subcategoryRepository: GetIt.instance<ISubcategoryRepository>())
            ..add(const SubcategoryWatcherEvent.watchSubcategoriesStarted()),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Choose a subcategory"),
        ),
        body: BlocBuilder<SubcategoryWatcherBloc, SubcategoryWatcherState>(
          builder: (context, state) {
            return state.maybeMap(
                loadSuccess: (newState) => Column(
                      children: [
                        SearchField(searchController: searchController),
                        Expanded(child: SubcategoryList(searchController: searchController)),
                      ],
                    ),
                loadFailure: (_) => const Center(child: Text("Failure.")),
                loading: (_) => const Center(child: CircularProgressIndicator()),
                orElse: () => Container());
          },
        ),
      ),
    );
  }
}

class SubcategoryList extends StatelessWidget {
  final TextEditingController searchController;
  const SubcategoryList({@required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubcategoryWatcherBloc, SubcategoryWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) => ListView.separated(
            shrinkWrap: true,
            itemCount: newState.subcategories.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1, color: Colors.black12),
            itemBuilder: (BuildContext context, int index) {
              final subcategory = newState.subcategories[index];
              final name = subcategory.name.getOrCrash();
              final bool noFilter = searchController.text == null || searchController.text == "";

              if (noFilter == true) {
                return ListTile(
                    title: Text(name), onTap: () => handlePopContext(context, subcategory));
              } else {
                // The filter is not empty, we filter by name
                if (name.toLowerCase().contains(searchController.text.toLowerCase()) == true) {
                  return ListTile(
                      title: Text(name), onTap: () => handlePopContext(context, subcategory));
                }
              }
              return Container();
              // There               });
            },
          ),
          orElse: () => Container(),
        );
      },
    );
  }
}

void handlePopContext(BuildContext context, Subcategory subcategory) {
  Navigator.of(context).pop(subcategory);
}
