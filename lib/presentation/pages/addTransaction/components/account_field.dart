// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addAccount/account_watcher_bloc/account_watcher_bloc.dart';
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';
import '../../../../components/row_container.dart';
import 'search_field.dart';

class AccountField extends HookWidget {
  const AccountField({
    Key key,
  }) : super(key: key);

  static const String _DEFAULT_ACCOUNT = "Select account";

  Future<void> handleOnTap(BuildContext context) async {
    final Account account = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AccountListScaffold()),
    );
    if (account != null) {
      context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.accountChanged(account));
    }
  }

  String getAccountName(BuildContext context) {
    return context
        .watch<TransactionCreatorBloc>()
        .state
        .moneyTransaction
        .accountName
        .value
        .fold((_) => "Select account", (v) => v);
  }

  String validateAccount(BuildContext context) =>
      context.read<TransactionCreatorBloc>().state.moneyTransaction.accountName.value.fold(
            (f) => f.maybeMap(orElse: () => null),
            (_) => null,
          );

  Widget build(BuildContext context) {
    final TextEditingController controller = useTextEditingController();
    controller.text = getAccountName(context);
    return GestureDetector(
      // Payees gesture detectory leading to 'Payees' SelectValuePage
      onTap: () => handleOnTap(context),
      child: RowContainer(
        name: "Payee",
        childWidget: TextFormField(
          decoration: const InputDecoration.collapsed(hintText: ""),
          style: controller.text == _DEFAULT_ACCOUNT
              ? AddTransactionStyles.unselected
              : AddTransactionStyles.selected,
          enabled: false,
          readOnly: true,
          validator: (_) => validateAccount(context),
          controller: controller,
        ),
      ),
    );
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

  void _handlePopContext(BuildContext context, Account account) =>
      Navigator.of(context).pop(account);

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
                return ListTile(
                  title: Text(name),
                  onTap: () => _handlePopContext(context, account),
                );
              } else {
                // The filter is not empty, we filter by name
                if (name.toLowerCase().contains(searchController.text.toLowerCase()) == true) {
                  return ListTile(
                    title: Text(name),
                    onTap: () => _handlePopContext(context, account),
                  );
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
