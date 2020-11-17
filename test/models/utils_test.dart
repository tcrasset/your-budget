import 'package:test/test.dart';
import 'package:your_budget/models/utils.dart';

void main() {
  test('getDateString() returns correct datetime string', () {
    int year = 1996;
    int month = 6;
    int day = 3;
    DateTime datetime = DateTime(year, month, day);
    String expected = "$day/$month/$year";
    expect(getDateString(datetime), expected);
  });

  test('getDatePhrase() returns correct datetime phrase', () {
    int year = 1996;
    int month = 6;
    String monthString = "June";
    int day = 3;
    DateTime datetime = DateTime(year, month, day);
    String expected = "$day $monthString $year";
    expect(getDatePhrase(datetime), expected);
  });

  test('getDateYMD() returns datetime with only day, month and year', () {
    int year = 1996;
    int month = 6;
    int day = 3;
    DateTime testDatetime = DateTime(year, month, day, 18, 55);
    DateTime expectedDatetime = DateTime(year, month, day);
    expect(getDateYMD(testDatetime), expectedDatetime);
  });

  test('getDateFromMonthStart() returns datetime with starting on first of month', () {
    int year = 1996;
    int month = 6;
    int day = 3;
    DateTime testDatetime = DateTime(year, month, day);
    DateTime expectedDatetime = DateTime(year, month, 1);
    expect(getDateFromMonthStart(testDatetime), expectedDatetime);
  });

  test('getMonthDifference() returns difference in months between datetimes', () {
    DateTime date_1 = DateTime(1996, 6, 3);
    DateTime date_2 = DateTime(1998, 3, 13);
    expect(getMonthDifference(date_1, date_2), -21);
  });

  test('monthStringFromDate() returns the month in english from datetime', () {
    DateTime date_1 = DateTime(1996, 6, 3);
    expect(monthStringFromDate(date_1), "June");
  });

  test('isNumeric() returns true when string is a number', () {
    String testString = "3.14";
    expect(isNumeric(testString), true);
  });

  test('isNumeric() returns false when string is null', () {
    expect(isNumeric(null), false);
  });

  test('isNumeric() returns false when string is not a number', () {
    String testString = "pi=3.14";
    expect(isNumeric(testString), false);
  });
}
