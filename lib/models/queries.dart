import 'package:your_budget/models/categories.dart';
import 'package:your_budget/models/categories_model.dart';
import 'package:your_budget/models/database_provider.dart';
import 'package:your_budget/models/entries.dart';
import 'package:your_budget/models/entries_model.dart';
import 'package:your_budget/models/goal.dart';
import 'package:your_budget/models/goal_model.dart';

abstract class Queries {
  Future<void> debugDatabase();

  /// Returns the list of all [MainCategory] in the database.
  Future<List<MainCategory>> getCategories();

  /// Returns the list of all [SubCategory] in the database.
  Future<List<SubCategory>> getSubCategories();

  /// Returns the list of all [Account] in the database.
  Future<List<Account>> getAccounts();

  /// Returns the list of all [Payee] in the database.
  Future<List<Payee>> getPayees();

  /// Returns the list of all [MoneyTransaction] in the database.
  Future<List<MoneyTransaction>> getMoneyTransactions();

  /// Returns the list of all [BudgetValue] in the database.
  Future<List<BudgetValue>> getBudgetValues();

  Future<List<Goal>> getGoals();

  Future<List<SubCategory>> getSubCategoriesJoined(int year, int month);

  Future<MoneyTransaction> getFirstTransactionOfAccount(int accountId);

  /// Adds the [category] of type [MainCategory] to the database.
  ///
  /// The [MainCategory] is specified using [category.id] and [category.name]
  Future<int> addCategory(MainCategoryModel categoryModel);

  /// Adds the [subcategory] of type [SubCategory] to the database.
  ///
  /// The [SubCategory] is specified using [subcategory.id],
  /// [subcategory.parent_id], and [subcategory.name]
  Future<int> addSubcategory(SubCategoryModel subcategoryModel);

  /// Adds the [payee] of type [Payee] to the database.
  ///
  /// The [Payee] is specified using [payee.id] and [payee.name]
  Future<int> addPayee(PayeeModel payeeModel);

  /// Adds the [account] of type [Account] to the database.
  ///
  /// The [Account] is specified using [account.id] and [account.name]
  Future<int> addAccount(AccountModel accountModel);

  /// Adds the [budgetvalue] of type [BudgetValue] to the database.
  Future<int> addBudgetValue(BudgetValueModel budgetValueModel);


  /// Adds the [moneyTransaction] of type [MoneyTransaction] to the database.
  ///
  /// The [MoneyTransaction] is specified using
  /// [moneyTransaction.id],
  /// [moneyTransaction.subcatID],
  /// [moneyTransaction.payeeID],
  /// [moneyTransaction.accountID],
  /// [moneyTransaction.amount],
  /// [moneyTransaction.memo] and
  ///[moneyTransaction.date].
  ///
  ///When the money transaction is made between accounts, no subcategory is selected, so
  ///that it doesn't affect the budget. Therefore, subcat.ID is set to Constants.UNASSIGNED_SUBCAT_ID and payee.id
  ///is set to the opposite of account.id.
  ///An example of this is the following :
  ///
  ///Instance of 'MoneyTransaction' {id: 10, subcatID: -1, payeeID: -3, accountID: 2, amount: 100.0, date: 2020-07-07 17:44:14.263746}
  ///
  ///where the transfer of money of 100.0€ was made from account 2 to account with id 3 (- payeeID).
  ///TODO : Clarify (in the UI and code) which account is receiving and which account is getting when making a transfer between accounts
  ///
  ///
  ///

  Future<int> addMoneyTransaction(MoneyTransactionModel moneyTransactionModel);

  /// Adds the [Goal] to the database.
  /// The [GoalType] is specified using it's index in the enumeration
  Future<int> addGoal(GoalModel goalModel);

  /// Deletes the [category] of id [categoryId] from the database.
  Future<void> deleteCategory(int categoryId);

  /// Deletes the [SubCategory] of id [subcategoryID] from the database.
  Future<void> deleteSubcategory(int subcategoryID);

  /// Deletes the [account] of id [account.id] from the database.
  Future<void> deleteAccount(Account account);

  /// Deletes the [payee] of id [payee.id] from the database.
  Future<void> deletePayee(Payee payee);

  /// Deletes the [moneytransaction] of id [moneytransaction.id] from the database.
  Future<void> deleteTransaction(int moneytransactionId);

  /// Deletes the [budgetValue] of id [budgetValue.id] from the database.
  Future<void> deleteBudgetValue(int budgetValueId);

  /// Update category with id [category.id] in the database.
  ///
  /// Fields that can be changed [DatabaseConstants.CATEGORY_NAME]
  Future<void> updateCategory(MainCategory category);

  /// Update subcategory with id [subcategory.id] in the database.
  ///
  /// Fields that can be changed are [subcategory.name],
  /// [subcategory.budgeted] and [subcategory.available].
  Future<void> updateSubcategory(SubCategory subcategory);

  /// Update account with id [account.id] in the database.
  ///
  /// Fields that can be changed are [account.name] and [account.id].
  Future<void> updateAccount(Account account);

  /// Update payee with id [payee.id] in the database.
  ///
  /// Fields that can be updated are [payee.name].
  Future<void> updatePayee(Payee payee);

  //TODO: Transaction update

  /// Update budgetValue with id [budgetValue.id] in the database.
  ///
  /// Fields that can be updated are [budgetValue.budgeted]
  /// and [budgetValue.available]
  Future<void> updateBudgetValue(BudgetValue budgetValue);

  Future<DateTime> getStartingBudgetDateConstant();

  Future<DateTime> getMaxBudgetDateConstant();


  Future<void> setMaxBudgetDateConstant(DateTime newMaxBudgetDate);

  Future<void> updateMostRecentAccountUsed(int accountId);

  Future<int> getMostRecentAccountUsed();

}
