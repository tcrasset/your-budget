// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

// Project imports:
import 'package:your_budget/application/addAccount/account_creator/account_creator_bloc.dart';
import 'package:your_budget/domain/core/name.dart';

class AccountName extends HookWidget {
  final TextStyle textStyle;
  final InputDecoration boxDecoration;
  const AccountName({
    @required this.textStyle,
    @required this.boxDecoration,
  });

  void onNameChange(BuildContext context, String value) {
    context.read<AccountCreatorBloc>().add(AccountCreatorEvent.nameChanged(
          value,
        ));
  }

  String _failNameClosure(dynamic f) {
    final result = f.maybeMap(
      longName: (_) => "Must be smaller than ${Name.maxLength}",
      emptyName: (_) => "Must not be empty",
      orElse: () => null,
    );

    return result is String ? result : null;
  }

  String validateName(BuildContext context) {
    return context.read<AccountCreatorBloc>().state.account.name.value.fold(
          (f) => _failNameClosure(f),
          (_) => null,
        );
  }

  @override
  Widget build(BuildContext context) {
    final _controller = useTextEditingController();

    return BlocConsumer<AccountCreatorBloc, AccountCreatorState>(
      listenWhen: (p, c) => getName(p) != getName(c),
      listener: (context, state) {
        _controller
          ..text = getName(state)
          ..selection = TextSelection.collapsed(offset: _controller.text.length);
      },
      builder: (context, state) {
        return Column(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Add an account",
                style: TextStyle(fontSize: 20),
              ),
            ),
            // SizedBox(
            //   height: 8,
            // ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              // height: 70,
              child: Center(
                child: TextFormField(
                  key: const Key('accountNameTextField'),
                  decoration: boxDecoration,
                  style: textStyle,
                  textAlign: TextAlign.center,
                  validator: (_) => validateName(context),
                  onChanged: (value) => onNameChange(context, value),
                  textInputAction: TextInputAction.next,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

String getName(AccountCreatorState state) => state.account.name.value.fold(
      (_) => null,
      (v) {
        debugPrint(v);
        return v;
      },
    );
