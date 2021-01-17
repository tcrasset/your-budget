import 'package:jiffy/jiffy.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';
import 'package:your_budget/models/Budget.dart';
import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/constants.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/goal.dart';
import 'package:your_budget/models/queries.dart';
import 'package:your_budget/models/utils.dart';

class FakeDatabase {
  static const TEST_ACCOUNT_ID_1 = 77;
  static const TEST_ACCOUNT_ID_2 = 770;
  static const TEST_PAYEE_ID = 88;
  static const TEST_MONEYTRANSACTION_ID = 99;
  static const TEST_SUBCATEGORY_ID = 5;
  static const TEST_CATEGORY_ID = 1;

  final Queries mockQueries;
  final startingBudgetDate = DateTime.now();

  List<SubCategory> subCategories;
  List<MainCategory> maincategories;
  List<Payee> payees;
  List<Account> accounts;
  List<MoneyTransaction> moneyTransactions;
  List<BudgetValue> budgetValues;
  List<Goal> goals;

  FakeDatabase({@required this.mockQueries}) {
    subCategories = _buildSubcategories();
    maincategories = _buildMaincategories();
    payees = _buildPayees();
    accounts = _buildAccounts();
    moneyTransactions = _buildMoneyTransactions();
    budgetValues = _buildBudgetValues();
    goals = _buildGoals();
  }

  final List<String> subcategoryNames = [
    "Rent",
    "Electricity",
    "Water",
    "Food",
    "Internet",
    "Phone"
  ];

  Future<void> setup() async {
    //! Starting Budget Date
    when(mockQueries.getStartingBudgetDateConstant())
        .thenAnswer((_) async => startingBudgetDate);

    //! MainCategories
    when(mockQueries.getCategories()).thenAnswer((_) async => maincategories);

    //! MoneyTransactions
    when(mockQueries.getMoneyTransactions())
        .thenAnswer((_) async => moneyTransactions);

    //! Payees
    when(mockQueries.getPayees()).thenAnswer((_) async => payees);

    //! Accounts
    when(mockQueries.getAccounts()).thenAnswer((_) async => accounts);

    //! BudgetValues
    when(mockQueries.getBudgetValues()).thenAnswer((_) async => budgetValues);

    //! Goals
    when(mockQueries.getGoals()).thenAnswer((_) async => goals);

    //! Most recent account used
    when(mockQueries.getMostRecentAccountUsed())
        .thenAnswer((_) async => accounts.isNotEmpty ? accounts[0].id : null);

    //! Max Budget Date Constant
    when(mockQueries.getMaxBudgetDateConstant())
        .thenAnswer((_) async => getMaxBudgetDate());

    //! Subcategories joined with BudgetValues
    when(mockQueries.getSubCategoriesJoined(
            argThat(isA<int>()), argThat(isA<int>())))
        .thenAnswer((invocation) async {
      int year = invocation.positionalArguments[0];
      int month = invocation.positionalArguments[1];

      List<BudgetValue> budgetValuesOfMonth = budgetValues
          .where((bv) => bv.year == year && bv.month == month)
          .toList();
      List<SubCategory> joinedSubcategories = [];

      for (final SubCategory subcat in subCategories) {
        BudgetValue budgetValue = budgetValuesOfMonth
            .singleWhere((bv) => bv.subcategoryId == subcat.id);
        SubCategory subcatJoined = subcat.copy();
        subcatJoined.budgeted = budgetValue.budgeted;
        subcatJoined.available = budgetValue.available;
        joinedSubcategories.add(subcatJoined);
      }
      return joinedSubcategories;
    });

    //! First transaction of account
    when(mockQueries.getFirstTransactionOfAccount(any))
        .thenAnswer((_) async => moneyTransactions[0]);

    // //! Add account
    // AccountModel aModel;
    // when(mockQueries.addAccount(argThat(new isInstanceOf<AccountModel>())))
    //     .thenAnswer((invocation) async {
    //   aModel = invocation.positionalArguments[0];
    //   int accountId = accounts.length + 1;
    //   accounts.add(Account(accountId, aModel.name, aModel.balance));
    //   return accountId;
    // });

    // //! Add money transaction
    // MoneyTransactionModel mtModel;
    // when(mockQueries.addMoneyTransaction(
    //         argThat(new isInstanceOf<MoneyTransactionModel>())))
    //     .thenAnswer((invocation) async {
    //   mtModel = invocation.positionalArguments[0];
    //   int mtId = moneyTransactions.length + 1;
    //   MoneyTransaction moneyTransaction = MoneyTransaction(
    //     id: mtId,
    //     subcatID: mtModel.subcatID,
    //     payeeID: mtModel.payeeID,
    //     accountID: mtModel.accountID,
    //     amount: mtModel.amount,
    //     memo: mtModel.memo,
    //     date: mtModel.date,
    //   );
    //   moneyTransactions.add(moneyTransaction);
    //   return mtId;
    // });
  }

  List<MainCategory> _buildMaincategories() {
    return [MainCategory(id: TEST_CATEGORY_ID, name: "Essentials")];
  }

  List<SubCategory> _buildSubcategories() {
    List<SubCategory> subcategories = [];

    for (int i = 0; i < subcategoryNames.length; i++) {
      SubCategory subcat = SubCategory(
          id: i + 1,
          parentId: 1,
          name: subcategoryNames[i],
          budgeted: 0.0,
          available: 0.0);
      subcategories.add(subcat);
    }
    return subcategories;
  }

  List<Budget> _buildBudgets() {
    //TODO: Implement getSubcategoriesJoined()
    throw UnimplementedError();
  }

  List<MoneyTransaction> _buildMoneyTransactions() {
    MoneyTransaction mt = MoneyTransaction(
        accountID: TEST_ACCOUNT_ID_1,
        amount: 999.99,
        date: startingBudgetDate,
        id: TEST_MONEYTRANSACTION_ID,
        payeeID: TEST_PAYEE_ID,
        subcatID: TEST_SUBCATEGORY_ID,
        memo: "");
    return [mt];
  }

  List<Payee> _buildPayees() {
    return [];
  }

  List<Account> _buildAccounts() {
    return [
      Account(id: TEST_ACCOUNT_ID_1, balance: 1000.00, name: "Savings"),
      Account(id: TEST_ACCOUNT_ID_2, balance: 500.00, name: "Cash")
    ];
  }

  List<Goal> _buildGoals() {
    return [];
  }

  List<BudgetValue> _buildBudgetValues() {
    /// Insert [BudgetValues] corresponding to the subcategories into the data base
    /// for every month of the budget, from the current Date to [MAX_NB_MONTHS_AHEAD]
    /// months in the future.

    List<BudgetValue> budgetValues = [];
    final DateTime startingDate = getDateFromMonthStart(startingBudgetDate);
    int id = 1;
    for (int monthDifference = 0;
        monthDifference <= Constants.MAX_NB_MONTHS_AHEAD;
        monthDifference++) {
      DateTime newDate = Jiffy(startingDate).add(months: monthDifference);
      for (int subcatId = 1; subcatId <= subcategoryNames.length; subcatId++) {
        BudgetValue budgetValue = BudgetValue(
          id: id,
          subcategoryId: subcatId,
          budgeted: 0.00,
          available: 0.00,
          year: newDate.year,
          month: newDate.month,
        );
        budgetValues.add(budgetValue);
        id += 1;
      }
    }
    return budgetValues;
  }
}
