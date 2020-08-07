import 'database_creator.dart';

//DO NOT CHANGE THE ORDER OF THE ITEMS IN THE ENUMERATION
enum GoalType { TargetAmount, TargetAmountByDate, MonthlyGoal }

class Goal {
  int id;
  GoalType goalType;
  int month;
  int year;
  double amount;

  Goal(this.id, this.goalType, this.amount, [this.month, this.year]);

  Goal.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.GOAL_ID];
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
