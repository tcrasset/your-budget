// Flutter imports:
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/addTransaction/payee_field/payee_field_bloc.dart';
// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/account_repository.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/payee/payee_repository.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/add_payee_dialog.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/add_transaction_field.dart';

class ReceiverField extends StatelessWidget {
  const ReceiverField({
    super.key,
  });

  static const String _DEFAULT_PAYEE = "Select payee";

  Future<void> handleOnTap(BuildContext context) async {
    final TransactionCreatorBloc bloc = context.read<TransactionCreatorBloc>();

    final Either<Payee, Account>? payeeOrAccount = await showSearch<Either<Payee, Account>?>(
      context: context,
      delegate: PayeeSearchDelegate(
        superContext: context,
      ),
    );

    if (payeeOrAccount != null) {
      bloc.add(TransactionCreatorEvent.receiverChanged(payeeOrAccount));
    }
  }

  String getReceiverName(BuildContext context) =>
      //TODO: Handle errors

      // .watch() is necessary here, else it does not rebuild
      context.watch<TransactionCreatorBloc>().state.moneyTransaction.receiver.fold(
            (l) => l.name.value.fold(
              (_) => _DEFAULT_PAYEE,
              (v) => v,
            ),
            (r) => r.name.value.fold(
              (_) => _DEFAULT_PAYEE,
              (v) => v,
            ),
          );

  String? validateReceiver(BuildContext context) {
    final state = context.read<TransactionCreatorBloc>().state;

    if (state.showErrorMessages == false) {
      // Don't show error messages after a successful save.
      return null;
    }

    return state.moneyTransaction.receiver.fold(
      (l) /* Payee */ => l.name.value.fold(
        (f) => f.maybeMap(
          emptyName: (_) => "Please select a Payee",
          orElse: () => null,
        ),
        (_) => null,
      ),
      (r) /* Account */ => null,
    );
  }

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => PayeeFieldBloc(
              accountRepository: context.read<AccountRepository>(),
              payeeRepository: context.read<PayeeRepository>(),
            )..add(const PayeeFieldEvent.watchPayableRequested()),
          ),
        ],
        child: AddTransactionField(
          name: "Payee",
          defaultValue: _DEFAULT_PAYEE,
          nameGetter: getReceiverName,
          onTap: handleOnTap,
          validator: validateReceiver,
        ),
      );
}

abstract class ListItem {}

class HeaderItem extends ListItem {
  final String title;
  HeaderItem(this.title);
}

class AddPayeeItem extends ListItem {
  final String text;
  final void Function()? onTap;
  AddPayeeItem({required this.text, required this.onTap});
}

class PayeeItem extends ListItem {
  final Payee payee;

  PayeeItem(this.payee);
}

class AccountItem extends ListItem {
  final Account account;

  AccountItem(this.account);
}

class PayeeSearchDelegate extends SearchDelegate<Either<Payee, Account>?> {
  // Pass the callers context down the tree to get the Bloc
  // as SearchDelegate does not have an ancestor widget per se.
  final BuildContext superContext;
  PayeeSearchDelegate({required this.superContext});

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
    final AddPayeeItem createPayeeWidget = AddPayeeItem(
      text: "Add ${query == '' ? "a new payee" : "'$query'"}",
      onTap: () => addPayeeDialog(superContext: superContext, defaultValue: query),
    );
    return BlocBuilder<PayeeFieldBloc, PayeeFieldState>(
      bloc: BlocProvider.of<PayeeFieldBloc>(superContext),
      builder: (context, state) {
        return state.map(
          loadSuccess: (newState) {
            final List<PayeeItem> payees = newState.entries.payees
                .where((p) => p.name.getOrCrash().toLowerCase().contains(query.toLowerCase()))
                .map((e) => PayeeItem(e))
                .toList();

            final List<AccountItem> accounts = newState.entries.accounts
                .where((p) => p.name.getOrCrash().toLowerCase().contains(query.toLowerCase()))
                .map((e) => AccountItem(e))
                .toList();

            final List<ListItem> items = [
              HeaderItem("Payees"),
              createPayeeWidget,
              ...payees,
              HeaderItem("Accounts"),
              ...accounts
            ];

            return ListView.separated(
              shrinkWrap: true,
              itemCount: items.length,
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 1, color: Colors.black12),
              itemBuilder: (BuildContext context, int index) {
                final ListItem item = items[index];

                if (item is AddPayeeItem) {
                  return ListTile(
                    title: Text(
                      item.text,
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                    onTap: item.onTap,
                  );
                } else if (item is PayeeItem) {
                  return ListTile(
                    title: Text("Payee: ${item.payee.name.getOrCrash()}"),
                    onTap: () => close(context, left(item.payee)),
                  );
                } else if (item is AccountItem) {
                  return ListTile(
                    title: Text("Account: ${item.account.name.getOrCrash()}"),
                    onTap: () => close(context, right(item.account)),
                  );
                } else if (item is HeaderItem) {
                  final bool isAccountHeader = item.title.toLowerCase().contains("account");
                  if (isAccountHeader && accounts.isEmpty) {
                    // Hide AccountHeader when there are no accounts matching the query
                    return Container();
                  }
                  return ListTile(
                    title: Text(
                      item.title,
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Constants.SECONDARY_COLOR,
                      ),
                    ),
                  );
                } else {
                  return Container();
                }
              },
            );
          },
          loadFailure: (_) => const Center(child: Text("Failure.")),
          initial: (_) => const Center(child: CircularProgressIndicator()),
          loading: (_) => const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
