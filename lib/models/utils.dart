import 'package:jiffy/jiffy.dart';

String getDateString(DateTime datetime) {
  return "${datetime.day}/${datetime.month}/${datetime.year}";
}

String getDatePhrase(DateTime datetime) {
  return "${datetime.day} ${monthStringFromDate(datetime)} ${datetime.year}";
}

DateTime getDateYMD(DateTime datetime) {
  return DateTime(datetime.year, datetime.month, datetime.day);
}

int getMonthDifference(DateTime date1, DateTime date2) {
  return Jiffy(date1).diff(Jiffy(date2), Units.MONTH);
}

String monthStringFromDate(DateTime date) {
  return Jiffy(date).format("MMMM");
}

bool isNumeric(String s) {
  if (s == null) {
    return false;
  }
  return double.tryParse(s) != null;
}
