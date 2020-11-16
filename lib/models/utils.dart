/// This file will contain utiliy functions destined to be used throughout the project.
import 'package:jiffy/jiffy.dart';

/// Gets the string representation of [datetime] in format DD/MM/YYYY
String getDateString(DateTime datetime) {
  return "${datetime.day}/${datetime.month}/${datetime.year}";
}

/// Gets the string representation of [datetime] in format DD month YYYY.
/// Example: 03 January 2020
String getDatePhrase(DateTime datetime) {
  return "${datetime.day} ${monthStringFromDate(datetime)} ${datetime.year}";
}

/// Creates a datetime object using only the year, month, and date from [datetime].
DateTime getDateYMD(DateTime datetime) {
  return DateTime(datetime.year, datetime.month, datetime.day);
}

/// Creates a datetime object starting from the first of the month, with year and month given
/// by [datetime].
DateTime getDateFromMonthStart(DateTime datetime) {
  return DateTime(datetime.year, datetime.month, 1);
}

/// Returns the number of months between [date1] and [date2].
/// If [date1] > [date2], the result will be positive.
int getMonthDifference(DateTime date1, DateTime date2) {
  return Jiffy(date1).diff(Jiffy(date2), Units.MONTH);
}

/// Returns the English noun for the month given by [date].
/// Example: `DateTime(2020, 06)` returns 'June'
String monthStringFromDate(DateTime date) {
  return Jiffy(date).format("MMMM");
}

/// Returns whether [s] is a string representation of a number or not.
/// If [s] is null, returns false.
bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
