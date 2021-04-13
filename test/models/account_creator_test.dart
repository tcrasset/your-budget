// Package imports:
import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_repository.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/transaction/i_transaction_repository.dart';
import 'package:your_budget/domain/transaction/transaction.dart';
import 'package:your_budget/models/account_creator.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/queries.dart';

class MockQueries extends Mock implements Queries {}

class MockTransactionRepo extends Mock implements ITransactionRepository {}

class MockAccountRepo extends Mock implements IAccountRepository {}

void main() {
  Queries mockQueries;
  ITransactionRepository mockTransactionRepo;
  IAccountRepository mockAccountRepo;
  String tAccountName;
  double tAccountBalance;
  Account tAccount;
  AccountCreator creator;
  setUp(() async {
    mockQueries = MockQueries();
    mockTransactionRepo = MockTransactionRepo();
    mockAccountRepo = MockAccountRepo();
    tAccountName = "Test account";
    tAccountBalance = 100.00;
    tAccount = Account(
      id: UniqueId(),
      balance: Amount(tAccountBalance.toString()),
      name: Name(tAccountName),
    );
    creator = AccountCreator(
      accountRepository: mockAccountRepo,
      transactionRepository: mockTransactionRepo,
    );
  });
  test('when the constructor is called, assign the correct values to instance', () {
    //!Arrange
    //!Act

    //!Assert

    expect(creator.accountRepository, mockAccountRepo);
    expect(creator.transactionRepository, mockTransactionRepo);
  });

  test('when the create() method is called, verify that a call to the database was made', () async {
    //!Arrange
    const int accountId = 1;

    when(mockAccountRepo.create(tAccount)).thenAnswer((_) async => right(accountId));

    //Just return unit for moneyTransaction
    when(mockTransactionRepo.create(any)).thenAnswer((_) async => right(unit));
    //!Act
    final Either<ValueFailure, Unit> failureOrUnit = await creator.create(tAccount);

    //!Assert
    expect(failureOrUnit.getOrElse(null), unit);
    verify(mockAccountRepo.create(tAccount));
    verify(mockTransactionRepo.create(any));
  });
}
