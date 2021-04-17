// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/core/subcategory_watcher_bloc/subcategory_watcher_bloc.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_repository.dart';
import 'package:your_budget/models/categories.dart';
import '../../../../components/row_container.dart';
import 'search_field.dart';

class SubcategoryField extends StatelessWidget {
  const SubcategoryField({
    Key key,
    @required this.defaultChildTextStyle,
    @required this.selectedChildTextStyle,
  }) : super(key: key);

  final TextStyle defaultChildTextStyle;
  final TextStyle selectedChildTextStyle;

  void handleOnTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SubcategoryListScaffold()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Subcategorys gesture detectory leading to 'Subcategorys' SelectValuePage
        onTap: () => handleOnTap(context),
        child: RowContainer(
            name: "Subcategory", childWidget: Text("Test", style: defaultChildTextStyle)));
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
              // final name = subcategory.name.getOrCrash();
              final bool noFilter = searchController.text == null || searchController.text == "";

              if (noFilter == true) {
                return ListTile(title: Text("test"), onTap: () => handlePopContext(subcategory));
              } else {
                // // The filter is not empty, we filter by name
                // if (name.toLowerCase().contains(searchController.text.toLowerCase()) == true) {
                //   return ListTile(title: Text("test"), onTap: () => handlePopContext(subcategory));
                // }
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

handlePopContext(SubCategory item) {}
