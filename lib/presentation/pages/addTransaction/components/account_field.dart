// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addAccount/account_watcher_bloc/account_watcher_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import '../../../../components/row_container.dart';
import 'search_field.dart';

class AccountField extends StatelessWidget {
  const AccountField({
    Key key,
    @required this.defaultChildTextStyle,
    @required this.selectedChildTextStyle,
  }) : super(key: key);

  final TextStyle defaultChildTextStyle;
  final TextStyle selectedChildTextStyle;

  void handleOnTap(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountListScaffold()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        // Accounts gesture detectory leading to 'Accounts' SelectValuePage
        onTap: () => handleOnTap(context),
        child:
            RowContainer(name: "Account", childWidget: Text("Test", style: defaultChildTextStyle)));
  }
}

class AccountListScaffold extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final searchController = useTextEditingController();
    return MultiBlocProvider(
      providers: [
        BlocProvider<AccountWatcherBloc>(
          create: (context) =>
              AccountWatcherBloc(accountRepository: GetIt.instance<IAccountRepository>())
                ..add(const AccountWatcherEvent.watchAccountsStarted()),
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Choose an account"),
        ),
        body: BlocBuilder<AccountWatcherBloc, AccountWatcherState>(
          builder: (context, state) {
            return state.maybeMap(
                loadSuccess: (newState) => Column(
                      children: [
                        SearchField(searchController: searchController),
                        Expanded(child: AccountList(searchController: searchController)),
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

class AccountList extends StatelessWidget {
  final TextEditingController searchController;
  const AccountList({@required this.searchController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AccountWatcherBloc, AccountWatcherState>(
      builder: (context, state) {
        return state.maybeMap(
          loadSuccess: (newState) => ListView.separated(
            shrinkWrap: true,
            itemCount: newState.accounts.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(height: 1, color: Colors.black12),
            itemBuilder: (BuildContext context, int index) {
              final account = newState.accounts[index];
              final name = account.name.getOrCrash();
              final bool noFilter = searchController.text == null || searchController.text == "";

              if (noFilter == true) {
                return ListTile(title: Text(name), onTap: () => handlePopContext(account));
              } else {
                // The filter is not empty, we filter by name
                if (name.toLowerCase().contains(searchController.text.toLowerCase()) == true) {
                  return ListTile(title: Text(name), onTap: () => handlePopContext(account));
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

handlePopContext(Account item) {}
