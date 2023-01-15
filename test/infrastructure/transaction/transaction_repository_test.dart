// Dart imports:
import 'dart:convert';

// Package imports:
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/infrastructure/transaction/transaction_dto.dart';
import 'package:your_budget/infrastructure/transaction/transaction_provider.dart';
import 'package:your_budget/models/constants.dart';
import 'transaction_repository_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<Database>(as: #MockDatabase),
  ],
)
void main() {
  late MockDatabase mockDatabase;
  late SQFliteTransactionProvider repository;
  late int tPayeeId;
  late int tMoneyTransactionId;
  late int tAccountId;
  late int tSubcatId;
  late double tAmount;
  late DateTime tDate;
  late String tMemo;
  late MoneyTransaction transaction;
  late MoneyTransactionDTO transactionDTO;
  setUp(() async {
    mockDatabase = MockDatabase();
    repository = SQFliteTransactionProvider(database: mockDatabase);

    tPayeeId = 99;
    tAccountId = 88;
    tSubcatId = 77;
    tAmount = 666.66;
    tDate = DateTime.now();
    tMemo = "Test memo";
    tMoneyTransactionId = 1;
    transaction = MoneyTransaction(
      id: UniqueId.fromUniqueInt(1),
      subcatID: UniqueId.fromUniqueInt(tSubcatId),
      payeeID: UniqueId.fromUniqueInt(tPayeeId),
      accountID: UniqueId.fromUniqueInt(tAccountId),
      accountName: Name("Test account"),
      payeeName: Name("Test payee"),
      subcatName: Name("Test subcategory"),
      payee: Payee(id: UniqueId.fromUniqueInt(tPayeeId), name: Name("Test payee")),
      amount: Amount(tAmount.toString()),
      memo: Name(tMemo),
      date: tDate,
    );

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
    when(mockDatabase.insert(any, any)).thenAnswer((_) async => tMoneyTransactionId);
    //!Act
    await repository.create(transaction);
    //!Assert
    verify(mockDatabase.insert(DatabaseConstants.moneyTransactionTable, transactionDTO.toJson()));
  });

  test('verify that db.update is called when updating MoneyTransaction', () async {
    //!Arrange
    when(
      mockDatabase.update(
        DatabaseConstants.moneyTransactionTable,
        transactionDTO.toJson(),
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [transactionDTO.id],
      ),
    ).thenAnswer((_) async => 1);

    //!Act
    await repository.update(transaction);
    //!Assert
    verify(
      mockDatabase.update(
        DatabaseConstants.moneyTransactionTable,
        transactionDTO.toJson(),
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [transactionDTO.id],
      ),
    );
  });

  test('verify that db.delete is called when deleting MoneyTransaction', () async {
    //!Arrange
    when(
      mockDatabase.delete(
        DatabaseConstants.moneyTransactionTable,
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [transactionDTO.id],
      ),
    ).thenAnswer((_) async => 1);
    //!Act
    await repository.delete(transaction);
    //!Assert
    verify(
      mockDatabase.delete(
        DatabaseConstants.moneyTransactionTable,
        where: '${DatabaseConstants.MONEYTRANSACTION_ID} = ?',
        whereArgs: [transactionDTO.id],
      ),
    );
  });

  test('verify that getAccountTransactions creates the correct raw query', () async {
    //!Arrange
    const int id = 1;
    final sql = """
        SELECT
          ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.MONEYTRANSACTION_ID},
          ${DatabaseConstants.PAYEE_ID_OUTSIDE},
          ${DatabaseConstants.ACCOUNT_ID_OUTSIDE},
          ${DatabaseConstants.SUBCAT_ID_OUTSIDE},
          ${DatabaseConstants.MONEYTRANSACTION_AMOUNT},
          ${DatabaseConstants.MONEYTRANSACTION_MEMO},
          ${DatabaseConstants.MONEYTRANSACTION_DATE},
          ${DatabaseConstants.accountTable}.${DatabaseConstants.ACCOUNT_NAME} as accountName,
          ${DatabaseConstants.payeeTable}.${DatabaseConstants.PAYEE_NAME} as payeeName,
          ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_NAME} as subcatName

        FROM ${DatabaseConstants.moneyTransactionTable}
        JOIN ${DatabaseConstants.accountTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.ACCOUNT_ID_OUTSIDE} = ${DatabaseConstants.accountTable}.${DatabaseConstants.ACCOUNT_ID}
        JOIN ${DatabaseConstants.payeeTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.PAYEE_ID_OUTSIDE} = ${DatabaseConstants.payeeTable}.${DatabaseConstants.PAYEE_ID}
        JOIN ${DatabaseConstants.subcategoryTable} ON ${DatabaseConstants.moneyTransactionTable}.${DatabaseConstants.SUBCAT_ID_OUTSIDE} = ${DatabaseConstants.subcategoryTable}.${DatabaseConstants.SUBCAT_ID}
        WHERE ${DatabaseConstants.ACCOUNT_ID_OUTSIDE} == ?
        ORDER BY ${DatabaseConstants.MONEYTRANSACTION_DATE} DESC;
        """;

    when(mockDatabase.rawQuery(sql, [id])).thenAnswer(
      (_) async => [
        transactionDTO.toJson()..addAll({"id": 1})
      ],
    );

    await repository.getAccountTransactions(id);

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
