// Package imports:
import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/domain/account/account.dart';
import 'package:your_budget/domain/account/i_account_provider.dart';
import 'package:your_budget/domain/core/amount.dart';
import 'package:your_budget/domain/core/name.dart';
import 'package:your_budget/domain/core/unique_id.dart';
import 'package:your_budget/domain/core/value_failure.dart';
import 'package:your_budget/domain/payee/i_payee_provider.dart';
import 'package:your_budget/domain/payee/payee.dart';
import 'package:your_budget/domain/subcategory/i_subcategory_provider.dart';
import 'package:your_budget/domain/subcategory/subcategory.dart';
import 'package:your_budget/domain/transaction/i_transaction_provider.dart';
import 'package:your_budget/models/queries.dart';
import 'account_creator_test.mocks.dart';

@GenerateMocks(
  [],
  customMocks: [
    MockSpec<ITransactionProvider>(as: #MockTransactionRepository),
    MockSpec<IAccountProvider>(as: #MockAccountRepository),
    MockSpec<ISubcategoryProvider>(as: #MockSubcategoryRepository),
    MockSpec<IPayeeProvider>(as: #MockPayeeRepository),
  ],
)
void main() {
  late MockTransactionRepository mockTransactionRepo;
  late MockAccountRepository mockAccountRepo;
  late MockSubcategoryRepository mockSubcategoryRepo;
  late MockPayeeRepository mockPayeeRepo;
  String tAccountName;
  double tAccountBalance;
  late Account tAccount;
  late Subcategory tSubcategory;
  late Payee tPayee;
  late AccountCreator creator;
  setUp(() async {
    mockTransactionRepo = MockTransactionRepository();
    mockAccountRepo = MockAccountRepository();
    mockSubcategoryRepo = MockSubcategoryRepository();
    mockPayeeRepo = MockPayeeRepository();
    tAccountName = "Test account";
    tAccountBalance = 100.00;
    tAccount = Account(
      id: UniqueId(),
      balance: Amount(tAccountBalance.toString()),
      name: Name(tAccountName),
    );
    tPayee = Payee(
      id: UniqueId(),
      name: Name("Test payee"),
    );
    tSubcategory = Subcategory(
      id: UniqueId(),
      categoryID: UniqueId(),
      name: Name("Test subcategory"),
    );

    creator = AccountCreator(
      accountRepository: mockAccountRepo,
      transactionRepository: mockTransactionRepo,
      subcategoryRepository: mockSubcategoryRepo,
      payeeProvider: mockPayeeRepo,
    );
  });
  test('when the constructor is called, assign the correct values to instance', () {
    //!Arrange
    //!Act

    //!Assert

    expect(creator.accountRepository, mockAccountRepo);
    expect(creator.transactionRepository, mockTransactionRepo);
    expect(creator.subcategoryRepository, mockSubcategoryRepo);
    expect(creator.payeeProvider, mockPayeeRepo);
  });

  test('when the create() method is called, verify that a call to the database was made', () async {
    //!Arrange
    const int accountId = 1;

    when(mockAccountRepo.create(tAccount)).thenAnswer((_) async => right(accountId));
    when(mockAccountRepo.get(accountId)).thenAnswer((_) async => right(tAccount));
    when(mockSubcategoryRepo.getToBeBudgetedSubcategory())
        .thenAnswer((_) async => right(tSubcategory));
    when(mockPayeeRepo.getToBeBudgetedPayee()).thenAnswer((_) async => right(tPayee));

    //Just return unit for moneyTransaction
    when(mockTransactionRepo.create(any)).thenAnswer((_) async => right(unit));

    //!Act
    final Either<ValueFailure, Unit> failureOrUnit = await creator.create(tAccount);

    //!Assert
    expect(failureOrUnit.getOrElse(() => throw TestFailure("Unable to get result.")), unit);
    verify(mockAccountRepo.create(tAccount));
    verify(mockTransactionRepo.create(any));
  });
}
