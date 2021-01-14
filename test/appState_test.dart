import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_budget/appState.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/queries.dart';
import 'fake_database.dart';
class MockQueries extends Mock implements Queries {}

main() {
  MockQueries mockQueries;
  AppState appState;
  FakeDatabase fakeDatabase;

  setUp(() async {
    mockQueries = MockQueries();
    fakeDatabase = FakeDatabase(mockQueries:mockQueries);
    await fakeDatabase.setup();
    appState = AppState(queryContext: mockQueries);
    await appState.loadStateFromDatabase();

  });

  test('addAccount() adds an account to the state, the database and adds', () async{

    //!Arrange
    String accountName = "Savings";
    double balance = 999.99;
    int accountId = 1;
    int moneyTransactionId = 1;
    Account tAccount = Account(accountId, accountName, balance);
    MoneyTransaction tMoneyTransaction = MoneyTransaction(
        id: moneyTransactionId,
        accountID: accountId,
        amount: balance,
        date: DateTime.now(),
        memo: "",
        payeeID: Constants.UNASSIGNED_PAYEE_ID,
        subcatID: Constants.UNASSIGNED_SUBCAT_ID);


    when(mockQueries.getFirstTransactionOfAccount(accountId))
        .thenAnswer((_) async => tMoneyTransaction);
    when(mockQueries.addAccount(any)).thenAnswer((_) async => accountId);
    when(mockQueries.addMoneyTransaction(any))
        .thenAnswer((_) async => moneyTransactionId);

    //!Act
    await appState.addAccount(accountName: accountName, balance: balance);

    //!Assert
    verify(mockQueries.addAccount(argThat(isA<AccountModel>())));
    verify(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())));

    // Verify that we call computeToBeBudgeted() once (we only added a single account)
    verify(mockQueries.getFirstTransactionOfAccount(argThat(isA<int>()))).called(1);

    // Compare accounts
    bool accountResult = tAccount.hasSameValues(appState.accounts[0]);
    expect(accountResult, true);

    // Compare transactions (without data comparison)
    expect(appState.transactions[0].id, tMoneyTransaction.id);
    expect(appState.transactions[0].subcatID, tMoneyTransaction.subcatID);
    expect(appState.transactions[0].payeeID, tMoneyTransaction.payeeID);
    expect(appState.transactions[0].accountID, tMoneyTransaction.accountID);
    expect(appState.transactions[0].amount, tMoneyTransaction.amount);
  });
}
