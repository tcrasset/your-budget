import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/money_transaction.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/money_transaction_list.dart';

class MockQueries extends Mock implements Queries {}

main() {
  Queries mockQueries;
  MoneyTransaction tMoneyTransaction;
  MoneyTransaction tMoneyTransaction2;
  MoneyTransactionList transactionList;
  int testId_1 = 25;
  int tSubcatId = 10;
  setUp(() async {
    mockQueries = MockQueries();
    tMoneyTransaction = MoneyTransaction(
        id: testId_1,
        subcatID: tSubcatId,
        payeeID: 9,
        accountID: 8,
        amount: 99.99,
        memo: "Test memo 1",
        date: DateTime.now());
    tMoneyTransaction2 = MoneyTransaction(
        id: 101,
        subcatID: 11,
        payeeID: 90,
        accountID: 80,
        amount: 9.99,
        memo: "Test memo 2",
        date: DateTime.now());
    transactionList = MoneyTransactionList(mockQueries, [tMoneyTransaction]);
  });

  test(
      'when creating a MoneyTransactionList, ensure the transactions are passed in',
      () {
    //!Arrange
    //!Act
    //!Assert
    expect(transactionList.transactions, [tMoneyTransaction]);
  });

  test('when add() is called, add a MoneyTransaction', () {
    //!Arrange
    //!Act
    transactionList.add(tMoneyTransaction2);
    //!Assert
    expect(
        transactionList.transactions, [tMoneyTransaction, tMoneyTransaction2]);
  });

  test('when remove() is called, remove a transaction by id', () {
    //!Arrange

    //!Act
    transactionList.remove(testId_1);
    //!Assert
    expect(transactionList.transactions.isEmpty, true);
  });

  test('when getById() is called, return a transaction by id', () {
    //!Arrange

    //!Act
    MoneyTransaction moneyTransaction = transactionList.getById(testId_1);

    //!Assert
    expect(moneyTransaction, tMoneyTransaction);
  });

  test(
      'when getAllBySubcatId() is called, return a list of all the transactions' +
          'with the same subcategory id', () {
    //!Arrange
    transactionList.add(tMoneyTransaction);
    //!Act
    List<MoneyTransaction> moneyTransactions =
        transactionList.getAllBySubcatId(tSubcatId);

    //!Assert
    expect(moneyTransactions, [tMoneyTransaction, tMoneyTransaction]);
  });

  test(
      'when getToBeBudgetedTransactions() is called, return a list of transactions' +
          'that have subcategory id [Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION]',
      () {
    //!Arrange
    MoneyTransaction toBeBudgetedTransaction = tMoneyTransaction.copyWith(
        subcatID: Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION);

    transactionList.add(toBeBudgetedTransaction);
    transactionList.add(toBeBudgetedTransaction);
    transactionList.add(toBeBudgetedTransaction);
    //!Act
    List<MoneyTransaction> transactions =
        transactionList.getToBeBudgetedTransactions();
    //!Assert
    expect(transactions.length, 3);
    expect(transactions[0].subcatID, Constants.TO_BE_BUDGETED_ID_IN_MONEYTRANSACTION);
  });
}
