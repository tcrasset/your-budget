import 'database_creator.dart';

//DO NOT CHANGE THE ORDER OF THE ITEMS IN THE ENUMERATION
enum GoalType { TargetAmount, TargetAmountByDate, MonthlyGoal }
const List<String> goalTypeNames = ["Target amount", "Target amount by date", "Monthly goal"];

class Goal {
  int id;
  GoalType goalType;
  int month;
  int year;
  int correspondingSubcategoryId;
  double amount;

  Goal(this.id, this.correspondingSubcategoryId, this.goalType, this.amount,
      [this.month, this.year]);

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
