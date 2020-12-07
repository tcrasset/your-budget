import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/screens/addAccount/addAccount.dart';

void main() {
  testWidgets("Add account", (WidgetTester tester) async {
    final nameField = find.byKey(ValueKey("accountNameTextField"));
    final balanceField = find.byKey(ValueKey("accountBalanceTextField"));
    final addButton = find.byKey(ValueKey("addAccountButton"));

    await tester.pumpWidget(
      MaterialApp(
        home: MultiProvider(
          providers: [
            Provider<AppState>(
              create: (_) => AppState(),
            )
          ],
          child: AddAccountRoute(),
        ),
      ),
    );
    await tester.enterText(nameField, "Savings");
    await tester.enterText(balanceField, "666.66");
    await tester.tap(addButton);

    await tester.pump(); //Rebuild widget

    expect(find.text("Savings"), findsOneWidget);
  });
}
