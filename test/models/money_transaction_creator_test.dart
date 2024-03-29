// Package imports:
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/models/money_transaction_creator.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

void main() {
  late Queries mockQueries;
  late int tPayeeId;
  late int tAccountId;
  late int tSubcatId;
  late double tAmount;
  late DateTime tDate;
  late String tMemo;
  late MoneyTransactionCreator creator;
  setUp(() async {
    mockQueries = MockQueries();
    tPayeeId = 99;
    tAccountId = 88;
    tSubcatId = 77;
    tAmount = 666.66;
    tDate = DateTime.now();
    tMemo = "Test memo";
    creator = MoneyTransactionCreator(
      queryContext: mockQueries,
      subcatId: tSubcatId,
      payeeId: tPayeeId,
      accountId: tAccountId,
      amount: tAmount,
      memo: tMemo,
      date: tDate,
    );
  });

  test('when the constructor is called, verify that the arguments are saved', () {
    //!Arrange

    //!Act

    //!Assert
    expect(creator.payeeId, tPayeeId);
    expect(creator.accountId, tAccountId);
    expect(creator.subcatId, tSubcatId);
    expect(creator.amount, tAmount);
    expect(creator.date, tDate);
    expect(creator.memo, tMemo);
  });

  test(
      'when the create() method is called, create and return the MoneyTransaction' +
          ' and verify that the call to the database was made', () async {
    //!Arrange
    const int tId = 25;
    when(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())!))
        .thenAnswer((_) async => tId);
    //!Act
    final MoneyTransaction moneyTransaction = await creator.create();

    //!Assert
    verify(mockQueries.addMoneyTransaction(argThat(isA<MoneyTransactionModel>())!));
    expect(moneyTransaction.id, tId);
    expect(moneyTransaction.payeeID, tPayeeId);
    expect(moneyTransaction.accountID, tAccountId);
    expect(moneyTransaction.subcatID, tSubcatId);
    expect(moneyTransaction.amount, tAmount);
    expect(moneyTransaction.date, tDate);
    expect(moneyTransaction.memo, tMemo);
  });
}
