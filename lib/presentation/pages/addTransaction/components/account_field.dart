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
import 'package:your_budget/presentation/pages/addTransaction/components/add_transaction_field.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/search_field.dart';

class AccountField extends StatelessWidget {
  const AccountField({
    Key? key,
  }) : super(key: key);

  static const String _DEFAULT_ACCOUNT = "Select account";

  Future<void> handleOnTap(BuildContext context) async {
    final Account? account = await showSearch<Account?>(
      context: context,
      delegate: AccountSearchDelegate(BlocProvider.of<AccountWatcherBloc>(context)
        ..add(const AccountWatcherEvent.watchAccountsStarted())),
    );

    if (account != null) {
      context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.accountChanged(account));
    }
  }

  String? validateAccount(BuildContext context) =>
      context.read<TransactionCreatorBloc>().state.moneyTransaction.account.name.value.fold(
            (f) => f.maybeMap(emptyName: (_) => "Please select an Account", orElse: () => null),
            (_) => null,
          );

  String getAccountName(BuildContext context) => context
      .watch<TransactionCreatorBloc>()
      .state
      .moneyTransaction
      .account
      .name
      .value
      .fold((_) => _DEFAULT_ACCOUNT, (v) => v);

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<AccountWatcherBloc>(
            create: (context) =>
                AccountWatcherBloc(accountRepository: GetIt.instance<IAccountRepository>()),
          ),
        ],
        child: AddTransactionField(
          name: "Account",
          defaultValue: _DEFAULT_ACCOUNT,
          nameGetter: getAccountName,
          onTap: handleOnTap,
          validator: validateAccount,
        ),
      );
}

class AccountSearchDelegate extends SearchDelegate<Account?> {
  final AccountWatcherBloc bloc;

  AccountSearchDelegate(this.bloc);

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
  Widget buildSuggestions(BuildContext context) {
    return BlocBuilder<AccountWatcherBloc, AccountWatcherState>(
      bloc: bloc,
      builder: (_, state) {
        return _build(state);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<AccountWatcherBloc, AccountWatcherState>(
      bloc: bloc,
      builder: (_, state) {
        return _build(state);
      },
    );
  }

  Widget _build(AccountWatcherState state) {
    return state.maybeMap(
      loadSuccess: (newState) {
        final accounts = newState.accounts
            .where((p) => p.name.toString().toLowerCase().contains(query.toLowerCase()))
            .toList();

        if (accounts.isEmpty) return Container();

        return ListView.separated(
          shrinkWrap: true,
          itemCount: accounts.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 1, color: Colors.black12),
          itemBuilder: (BuildContext context, int index) {
            final account = accounts[index];
            final String name = account.name.getOrCrash();
            return ListTile(title: Text(name), onTap: () => close(context, account));
          },
        );
      },
      loadFailure: (_) => const Center(child: Text("Failure.")),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      orElse: () => const Center(child: Text("Else.")),
    );
  }
}
