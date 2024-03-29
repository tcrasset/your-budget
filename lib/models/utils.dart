/// This file will contain utility functions destined to be used throughout the project.

// Package imports:
import 'package:intl/intl.dart';
import 'package:jiffy/jiffy.dart';

// Project imports:
import 'package:your_budget/models/constants.dart';

T? ignore<T>(dynamic _) => null;
String convertToString(int id) => id.toString();

/// Returns the current maximum  budget date based on [Constants.MAX_NB_MONTHS_AHEAD]
/// and the current date.
/// The max budget date is INCLUSIVE!
DateTime getMaxBudgetDate() {
  return Jiffy(getDateFromMonthStart(DateTime.now()))
      .add(months: Constants.MAX_NB_MONTHS_AHEAD)
      .dateTime;
}

List<DateTime> getBudgetDatesUpToMaxBudgetDate({DateTime? startingFrom}) {
  DateTime currentDate = startingFrom == null
      ? getDateFromMonthStart(DateTime.now())
      : getDateFromMonthStart(startingFrom);

  final DateTime maxBudgetDate = getMaxBudgetDate(); // date is already from month start

  final List<DateTime> dates = [];
  while (currentDate.isBefore(maxBudgetDate) || currentDate.isAtSameMomentAs(maxBudgetDate)) {
    dates.add(currentDate);
    currentDate = Jiffy(currentDate).add(months: 1).dateTime;
  }

  return dates;
}

DateTime getLastDayOfMonth(DateTime datetime) {
  return DateTime(datetime.year, datetime.month + 1, 0);
}

/// Gets the string representation of [datetime] in format DD/MM/YYYY
/// Example DateTime(1996, 6, 6) returns "3/6/1996"
String getDateString(DateTime datetime) {
  return "${datetime.day}/${datetime.month}/${datetime.year}";
}

/// Gets the string representation of [datetime] in format DD month YYYY.
/// Example: 03 January 2020
String getDatePhrase(DateTime datetime) {
  return "${datetime.day} ${monthStringFromDate(datetime)} ${datetime.year}";
}

/// Gets the string representation of [datetime] in format DD month YYYY hh:mm.
/// Example: January 3rd, 2020 14:33
String getDateTimePhrase(DateTime datetime) {
  return DateFormat.yMMMMd('en_US').add_Hm().format(datetime);
  // return "${datetime.day} ${monthStringFromDate(datetime)} ${datetime.year} ${datetime.hour}:${datetime.minute}";
}

/// Creates a datetime object using only the year, month, and date from [datetime].
DateTime getDateYMD(DateTime datetime) {
  return DateTime(datetime.year, datetime.month, datetime.day);
}

/// Creates a datetime object starting from the first of the month, with year and month given
/// by [datetime].
DateTime getDateFromMonthStart(DateTime datetime) {
  return DateTime(datetime.year, datetime.month);
}

/// Returns the number of months between [date1] and [date2].
/// If [date1] > [date2], the result will be positive.
int getMonthDifference(DateTime date1, DateTime date2) {
  return Jiffy(date1).diff(Jiffy(date2), Units.MONTH) as int;
}

/// Returns the English noun for the month given by [date].
/// Example: `DateTime(2020, 06)` returns 'June'
String monthStringFromDate(DateTime date) {
  return Jiffy(date).format("MMMM");
}

bool isSameMonth(DateTime date1, DateTime date2) {
  return date1.month == date2.month && date1.year == date2.year;
}

/// Returns whether the month of the [query] datetime is between
/// the month of [lowerBound] and [upperBound], inclusive.
bool isMonthBetweenInclusive({
  required DateTime query,
  required DateTime lowerBound,
  required DateTime upperBound,
}) {
  final lower = getDateFromMonthStart(lowerBound);
  final upper = getDateFromMonthStart(upperBound);
  final formattedQuery = getDateFromMonthStart(query);
  return (formattedQuery.isAtSameMomentAs(lower) || formattedQuery.isAfter(lower)) &&
      (formattedQuery.isAtSameMomentAs(upper) || formattedQuery.isBefore(upper));
}

DateTime addExactEntryTime(DateTime date) {
  final DateTime now = DateTime.now();
  return DateTime(date.year, date.month, date.day, now.hour, now.minute, now.second);
}

/// Returns whether [s] is a string representation of a number or not.
/// If [s] is null, returns false.
bool isNumeric(String? s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
