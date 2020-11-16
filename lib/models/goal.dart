import 'database_creator.dart';

//DO NOT CHANGE THE ORDER OF THE ITEMS IN THE ENUMERATION
enum GoalType { TargetAmount, TargetAmountByDate, MonthlyGoal }
const List<String> goalTypeNames = ["Target amount", "Target amount by date", "Monthly goal"];

/// Class defining a budgeting goal, identified by [id], of type [goalType] and an [amount].
/// The goal applies to a specific subcategory specified by [correspondingSubcategoryId].
/// Depending on the [goalType], the goal end date is specified using [month] and [year].
class Goal {
  /// Unique id of this.
  int id;

  /// Type of goal.
  GoalType goalType;

  /// Month of the goal end date, if the [goalType] needs it.
  int month;

  /// Year of the goal end date, if the [goalType] needs it.
  int year;

  ///Identifier of the [SubCategory] that is targeted by this.
  int correspondingSubcategoryId;

  ///Target amount that is tried to be reached.
  double amount;

  //TODO: Check for correct values depending on [goalType]

  ///Default constructor for the [Goal].
  Goal(this.id, this.correspondingSubcategoryId, this.goalType, this.amount,
      [this.month, this.year]);

  /// Constructor building a [Goal] from a [json] representation taken
  /// from a database.
  Goal.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.GOAL_ID];
    this.correspondingSubcategoryId = json[DatabaseCreator.SUBCAT_ID_OUTSIDE];
    this.goalType = GoalType.values[json[DatabaseCreator.GOAL_TYPE]];
    this.amount = json[DatabaseCreator.GOAL_AMOUNT];
    this.year = json[DatabaseCreator.GOAL_YEAR];
    this.month = json[DatabaseCreator.GOAL_MONTH];
  }

  @override
  String toString() {
    return super.toString() +
        """{id: $id, goalType: $goalType, amount: $amount, year: $year, month $month}""";
  }
}
