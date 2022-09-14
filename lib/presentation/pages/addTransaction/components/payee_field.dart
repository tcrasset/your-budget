// Flutter imports:
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';

// Project imports:
import 'package:your_budget/application/addTransaction/payee_handler/payee_watcher_bloc.dart';
import 'package:your_budget/application/addTransaction/transaction_creator/transaction_creator_bloc.dart';
import 'package:your_budget/domain/payee/i_payee_repository.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/presentation/pages/addTransaction/add_transaction.dart';
import 'package:your_budget/presentation/pages/addTransaction/components/search_field.dart';
import 'add_payee_dialog.dart';
import 'add_transaction_field.dart';

class PayeeField extends StatelessWidget {
  const PayeeField({
    Key? key,
  }) : super(key: key);

  static const String _DEFAULT_PAYEE = "Select payee";

  Future<void> handleOnTap(BuildContext context) async {
    final Payee? payee = await showSearch<Payee?>(
      context: context,
      delegate: PayeeSearchDelegate(
        BlocProvider.of<PayeeWatcherBloc>(context)
          ..add(const PayeeWatcherEvent.watchPayeesStarted()),
      ),
    );

    if (payee != null) {
      context.read<TransactionCreatorBloc>().add(TransactionCreatorEvent.payeeChanged(payee));
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
  final PayeeWatcherBloc bloc;

  PayeeSearchDelegate(this.bloc);

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
    return BlocBuilder<PayeeWatcherBloc, PayeeWatcherState>(
      bloc: bloc,
      builder: (_, state) {
        return _build(state);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocBuilder<PayeeWatcherBloc, PayeeWatcherState>(
      bloc: bloc,
      builder: (_, state) {
        return _build(state);
      },
    );
  }

  Widget _build(PayeeWatcherState state) {
    return state.maybeMap(
      loadSuccess: (newState) {
        final payees = newState.payees
            .where((p) => p.name.toString().toLowerCase().contains(query.toLowerCase()))
            .toList();

        if (payees.isEmpty) return Container();

        return ListView.separated(
          shrinkWrap: true,
          itemCount: payees.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(height: 1, color: Colors.black12),
          itemBuilder: (BuildContext context, int index) {
            final payee = payees[index];
            final String name = payee.name.getOrCrash();
            return ListTile(title: Text(name), onTap: () => close(context, payee));
          },
        );
      },
      loadFailure: (_) => const Center(child: Text("Failure.")),
      loading: (_) => const Center(child: CircularProgressIndicator()),
      orElse: () => const Center(child: Text("Else.")),
    );
  }
}
