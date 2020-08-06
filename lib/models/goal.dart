import 'database_creator.dart';

enum GoalType { TargetAmount, TargetAmountByDate, MonthyGoal }

class Goal {
  int id;
  String name;
  GoalType goalType;
  int month;
  int year;
  double amount;

  Goal(this.id, this.name, this.goalType, this.amount, [this.month, this.year]);

  Goal.fromJson(Map<String, dynamic> json) {
    this.id = json[DatabaseCreator.GOAL_ID];
    this.name = json[DatabaseCreator.GOAL_NAME];
    this.goalType = json[DatabaseCreator.GOAL_TYPE];
    this.amount = json[DatabaseCreator.GOAL_AMOUNT];
    this.year = json[DatabaseCreator.GOAL_YEAR];
    this.month = json[DatabaseCreator.GOAL_MONTH];
  }
}
