// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
// Project imports:
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/application/core/payee_watcher/payee_watcher_bloc.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/add_payee_dialog.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/add_transaction_field.dart';

class PayeeField extends StatelessWidget {
  const PayeeField({
    Key? key,
  }) : super(key: key);

  static const String _DEFAULT_PAYEE = "Select payee";

  Future<void> handleOnTap(BuildContext context) async {
    final TransactionCreatorBloc bloc = context.read<TransactionCreatorBloc>();

    final Payee? payee = await showSearch<Payee?>(
      context: context,
      delegate: PayeeSearchDelegate(
        superContext: context,
      ),
    );

    if (payee != null) {
      bloc.add(TransactionCreatorEvent.payeeChanged(payee));
    }
  }

  String getPayeeName(BuildContext context) {
    //TODO: Handle errors
    return context
        .watch<TransactionCreatorBloc>()
        .state
        .moneyTransaction
        .payee
        .name
        .value
        .fold((_) => _DEFAULT_PAYEE, (v) => v);
  }

  String? validatePayee(BuildContext context) =>
      context.read<TransactionCreatorBloc>().state.moneyTransaction.payee.name.value.fold(
            (f) => f.maybeMap(emptyName: (_) => "Please select a Payee.", orElse: () => null),
            (_) => null,
          );

  @override
  Widget build(BuildContext context) => MultiBlocProvider(
        providers: [
          BlocProvider<PayeeWatcherBloc>(
            create: (context) =>
                PayeeWatcherBloc(payeeRepository: GetIt.instance<IPayeeRepository>()),
          ),
        ],
        child: AddTransactionField(
          name: "Payee",
          defaultValue: _DEFAULT_PAYEE,
          nameGetter: getPayeeName,
          onTap: handleOnTap,
          validator: validatePayee,
        ),
      );
}

class PayeeSearchDelegate extends SearchDelegate<Payee?> {
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
    return BlocBuilder<PayeeWatcherBloc, PayeeWatcherState>(
      bloc: BlocProvider.of<PayeeWatcherBloc>(superContext)
        ..add(const PayeeWatcherEvent.watchPayeesStarted()),
      builder: (context, state) {
        final Widget createPayeeWidget = ListTile(
            title: Text(
              "Add ${query == '' ? "a new payee" : "'${query}'"}",
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
            onTap: () {
              addPayeeDialog(superContext: superContext, defaultValue: query);
            });

        return state.maybeMap(
          loadSuccess: (newState) {
            final payees = newState.payees
                .where((p) => p.name.getOrCrash().toLowerCase().contains(query.toLowerCase()))
                .toList();

            if (payees.isEmpty) return createPayeeWidget;

            return ListView.separated(
              shrinkWrap: true,
              itemCount: payees.length + 1, // +1 for createPayee
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(height: 1, color: Colors.black12),
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return createPayeeWidget;
                }

                final payee = payees[index - 1]; // -1 because createPayeeWidget is at 0
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
