import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_budget/application/showTransactions/selected_account_cubit/selected_account_cubit.dart';
import 'package:your_budget/domain/account/account.dart';

class AccountButtons extends StatelessWidget {
  const AccountButtons({super.key});

  Future<void> handleButtonOnPressed({
    required BuildContext context,
    required bool increment,
  }) async {
    final cubit = context.read<SelectedAccountCubit>();
    if (increment) {
      await cubit.selectNext();
    } else {
      await cubit.selectPrevious();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => handleButtonOnPressed(context: context, increment: false),
          ),
          BlocBuilder<SelectedAccountCubit, Account?>(
            // Rebuild and refetch the transactions if the selected account changes
            builder: (context, state) {
              final String accountName = state?.name.getOrCrash() ?? "No accounts";

              return Text(
                accountName,
                style: const TextStyle(fontSize: 20),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward),
            onPressed: () => handleButtonOnPressed(context: context, increment: true),
          )
        ],
      ),
    );
  }
}
