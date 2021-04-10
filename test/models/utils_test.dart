// Package imports:
import 'package:test/test.dart';

// Project imports:
import 'package:your_budget/models/utils.dart';

void main() {
  test('getDateString() returns correct datetime string', () {
    const int year = 1996;
    const int month = 6;
    const int day = 3;
    final DateTime datetime = DateTime(year, month, day);
    const String expected = "$day/$month/$year";
    expect(getDateString(datetime), expected);
  });

  test('getDatePhrase() returns correct datetime phrase', () {
    const int year = 1996;
    const int month = 6;
    const String monthString = "June";
    const int day = 3;
    final DateTime datetime = DateTime(year, month, day);
    const String expected = "$day $monthString $year";
    expect(getDatePhrase(datetime), expected);
  });

  test('getDateYMD() returns datetime with only day, month and year', () {
    const int year = 1996;
    const int month = 6;
    const int day = 3;
    final DateTime testDatetime = DateTime(year, month, day, 18, 55);
    final DateTime expectedDatetime = DateTime(year, month, day);
    expect(getDateYMD(testDatetime), expectedDatetime);
  });

  test('getDateFromMonthStart() returns datetime with starting on first of month', () {
    const int year = 1996;
    const int month = 6;
    const int day = 3;
    final DateTime testDatetime = DateTime(year, month, day);
    final DateTime expectedDatetime = DateTime(year, month);
    expect(getDateFromMonthStart(testDatetime), expectedDatetime);
  });

  test('getMonthDifference() returns difference in months between datetimes', () {
    final DateTime date_1 = DateTime(1996, 6, 3);
    final DateTime date_2 = DateTime(1998, 3, 13);
    expect(getMonthDifference(date_1, date_2), -21);
  });

  test('monthStringFromDate() returns the month in english from datetime', () {
    final DateTime date_1 = DateTime(1996, 6, 3);
    expect(monthStringFromDate(date_1), "June");
  });

  test('isNumeric() returns true when string is a number', () {
    const String testString = "3.14";
    expect(isNumeric(testString), true);
  });

  test('isNumeric() returns false when string is null', () {
    expect(isNumeric(null), false);
  });

  test('isNumeric() returns false when string is not a number', () {
    const String testString = "pi=3.14";
    expect(isNumeric(testString), false);
  });
}
