// Project imports:
import 'package:your_budget/models/goal.dart';

class GoalModel {
  final GoalType goalType;
  final int correspondingSubcategoryId;
  final double amount;
  int? month;
  int? year;

  GoalModel({
    required this.correspondingSubcategoryId,
    required this.goalType,
    required this.amount,
    this.month,
    this.year,
  });
}
