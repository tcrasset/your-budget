// Package imports:
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/infrastructure/transaction/transaction_dto.dart';
import 'package:your_budget/infrastructure/transaction/transaction_repository.dart';
import 'package:your_budget/models/constants.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  late Database mockDatabase;
  late SQFliteTransactionRepository repository;
  int tPayeeId;
  late int tAccountId;
  int tSubcatId;
  double tAmount;
  DateTime tDate;
  String tMemo;
  late MoneyTransaction transaction;
  late MoneyTransactionDTO transactionDTO;
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
        id: UniqueId.fromUniqueInt(1),
        subcatID: UniqueId.fromUniqueInt(tSubcatId),
        payeeID: UniqueId.fromUniqueInt(tPayeeId),
        accountID: UniqueId.fromUniqueInt(tAccountId),
        amount: Amount(tAmount.toString()),
        memo: Name(tMemo),
        date: tDate);

    transactionDTO = MoneyTransactionDTO.fromDomain(transaction);
  });

  test('verify that the database is assigned', () {
    //!Arrange
    expect(repository.database, mockDatabase);
    //!Act

    //!Assert
  });

  test('verify that db.insert is called when creating MoneyTransaction', () async {
    //!Arrange
    //!Act
    await repository.create(transaction);
    //!Assert
    verify(mockDatabase.insert(DatabaseConstants.moneyTransactionTable, transactionDTO.toJson()));
  });

  test('verify that db.update is called when updating MoneyTransaction', () async {
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

  test('verify that db.delete is called when deleting MoneyTransaction', () async {
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

  test('verify that getAccountTransactions creates the correct raw query', () async {
    //!Arrange
    const int id = 1;
    const sql = """
        SELECT * FROM ${DatabaseConstants.moneyTransactionTable}
        WHERE ${DatabaseConstants.ACCOUNT_ID_OUTSIDE} == ?
        ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;
        """;

    //!Act
    try {
      await repository.getAccountTransactions(id);
    } catch (e) {
      /* We are catching the error because mockDatabase.rawQuery returns nothing */
    }

    //!Assert
    verify(mockDatabase.rawQuery(sql, [id]));
  });

  test('verify that getAccountTransactions returns the correct ones', () async {
    //!Arrange
    final MoneyTransaction tTransaction1 = transaction.copyWith(amount: Amount("55"));
    final MoneyTransaction tTransaction2 = transaction.copyWith(amount: Amount("44"));
    final List<MoneyTransaction> tTransactionList = [tTransaction1, tTransaction2];
    final List<Map<String, dynamic>> tRawTransactions = [
      MoneyTransactionDTO.fromDomain(tTransaction1).toJson(),
      MoneyTransactionDTO.fromDomain(tTransaction2).toJson(),
    ];

    when(mockDatabase.rawQuery(any!, [tAccountId])).thenAnswer((_) async => tRawTransactions);
    //!Act
    final transactions = await repository.getAccountTransactions(tAccountId);
    //!Assert

    transactions.fold(
      (failure) => throw TestFailure(failure.toString()),
      (transactions) {
        expect(transactions[0].amount, tTransactionList[0].amount);
        expect(transactions[1].amount, tTransactionList[1].amount);
      },
    );
  });
}
