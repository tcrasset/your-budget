// Package imports:
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/models/account.dart';
import 'package:your_budget/models/account_creator.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

void main() {
  Queries mockQueries;
  String tAccountName;
  double tAccountBalance;
  AccountCreator creator;
  setUp(() async {
    mockQueries = MockQueries();
    tAccountName = "Test account";
    tAccountBalance = 100.00;
    creator =
        AccountCreator(queryContext: mockQueries, name: tAccountName, balance: tAccountBalance);
  });
  test(
      'when the constructor is called, assign the account name' +
          ' and balance as the query context', () {
    //!Arrange
    //!Act

    //!Assert

    expect(creator.name, tAccountName);
    expect(creator.balance, tAccountBalance);
    expect(creator.queryContext, mockQueries);
  });

  test(
      'when the create() method is called, create and return the account' +
          ' and verify that the call to the database was made', () async {
    //!Arrange
    const int tId = 25;
    when(mockQueries.addAccount(argThat(isA<AccountModel>()))).thenAnswer((_) async => tId);
    //!Act
    final Account account = await creator.create();

    //!Assert
    verify(mockQueries.addAccount(argThat(isA<AccountModel>())));
    expect(account.name, tAccountName);
    expect(account.balance, tAccountBalance);
    expect(account.id, tId);
  });

  test(
      'whe, getStartingMoneyTransaction() is called, verify that it returns' +
          ' a starting balance money transaction', () async {
    //!Arrange
    await creator.create();

    //!Act
    final MoneyTransaction moneyTransaction = await creator.getStartingMoneyTransaction();

    //!Assert
    expect(moneyTransaction.subcatID, Constants.UNASSIGNED_SUBCAT_ID);
    expect(moneyTransaction.payeeID, Constants.UNASSIGNED_PAYEE_ID);
    expect(moneyTransaction.memo, "Starting balance");
  });
}
