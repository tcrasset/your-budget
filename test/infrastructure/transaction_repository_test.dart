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
}
