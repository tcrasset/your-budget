// Package imports:
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/infrastructure/transaction/transaction_dto.dart';
import 'package:your_budget/infrastructure/transaction/transaction_repository.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/money_transaction.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  Database mockDatabase;
  SQFliteTransactionRepository repository;
  int tPayeeId;
  int tAccountId;
  int tSubcatId;
  double tAmount;
  DateTime tDate;
  String tMemo;
  MoneyTransaction transaction;
  MoneyTransactionDTO transactionDTO;
  setUp(() async {
    mockDatabase = MockDatabase();
    repository = SQFliteTransactionRepository(database: mockDatabase);

    tPayeeId = 99;
    tAccountId = 88;
    tSubcatId = 77;
    tAmount = 666.66;
    tDate = DateTime.now();
    tMemo = "Test memo";

    transaction = MoneyTransaction(
        id: 1,
        subcatID: tSubcatId,
        payeeID: tPayeeId,
        accountID: tAccountId,
        amount: tAmount,
        memo: tMemo,
        date: tDate);

    transactionDTO = MoneyTransactionDTO.fromDomain(transaction);
  });

  test('verify that the database is assigned', () {
    //!Arrange
    expect(repository.database, mockDatabase);
    //!Act

    //!Assert
  });

  test('verify that db.insert is called when creating MoneyTransaction',
      () async {
    //!Arrange
    //!Act
    await repository.create(transaction);
    //!Assert
    verify(mockDatabase.insert(
        DatabaseConstants.moneyTransactionTable, transactionDTO.toJson()));
  });

  test('verify that db.update is called when updating MoneyTransaction',
      () async {
    //!Arrange
    //!Act
    await repository.update(transaction);
    //!Assert
    verify(mockDatabase.update(
      DatabaseConstants.moneyTransactionTable,
      transactionDTO.toJson(),
      where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
      whereArgs: [transactionDTO.id],
    ));
  });

  test('verify that db.delete is called when deleting MoneyTransaction',
      () async {
    //!Arrange
    //!Act
    await repository.delete(transaction);
    //!Assert
    verify(mockDatabase.delete(
      DatabaseConstants.moneyTransactionTable,
      where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
      whereArgs: [transactionDTO.id],
    ));
  });

  // test('verify that getAllTransactions create the correct raw query', () async {
  //   //!Arrange
  //   const sql = """
  //       SELECT * FROM ${DatabaseConstants.moneyTransactionTable}
  //       ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;
  //       """;

  //   //!Act
  //   await repository.getAllTransactions();

  //   //!Assert
  //   verify(mockDatabase.rawQuery(sql));
  // });

  // test('verify that getAllTransactions returns the correct ones', () async {
  //   //!Arrange
  //   final MoneyTransaction tTransaction1 = transaction.copyWith(amount: 55);
  //   final MoneyTransaction tTransaction2 = transaction.copyWith(amount: 44);
  //   final List<MoneyTransaction> tTransactionList = [tTransaction1, tTransaction2];
  //   final List<Map<String, dynamic>> tRawTransactions = [
  //     MoneyTransactionDTO.fromDomain(tTransaction1).toJson(),
  //     MoneyTransactionDTO.fromDomain(tTransaction2).toJson(),
  //   ];

  //   when(mockDatabase.rawQuery(any)).thenAnswer((_) async => tRawTransactions);
  //   //!Act
  //   final transactions = await repository.getAllTransactions();
  //   //!Assert

  //   transactions.fold(
  //     (failure) => /*throw TestFailure(failure.toString())*/ null,
  //     (transactions) {
  //       expect(transactions[0].amount, tTransactionList[0].amount);
  //       expect(transactions[1].amount, tTransactionList[1].amount);
  //     },
  //   );
  // });
}
