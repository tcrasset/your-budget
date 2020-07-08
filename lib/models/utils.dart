import 'package:jiffy/jiffy.dart';

String getDateString(DateTime datetime) {
  return "${datetime.day}/${datetime.month}/${datetime.year}";
}

DateTime getDateYMD(DateTime datetime) {
  return DateTime(datetime.year, datetime.month, datetime.day);
}

///Adapted from https://stackoverflow.com/a/25136172/9462676
int getMonthDifference(DateTime date1, DateTime date2) {
  // bool negativeDifference = date1.difference(date2).isNegative;
  // DateTime earlyDate = negativeDifference ? date1 : date2;
  // DateTime lateDate = negativeDifference ? date2 : date1;

  // // Start with 1 month's difference and keep incrementing
  // // until we overshoot the late date
  // int monthsDiff = 1;
  // int earlyDateMonth = earlyDate.month;
  // var jiffyEarly = Jiffy(earlyDate);
  // while (Jiffy(earlyDate).add(months: 1) <= lateDate) {
  //   monthsDiff++;
  // }

  // return monthsDiff - 1;

  return Jiffy(date1).diff(Jiffy(date2), Units.MONTH);
}

String monthStringFromDate(DateTime date) {
  return Jiffy(date).format("MMMM");
  // assert(1 <= month);
  // assert(month <= 12);

  // switch (month) {
  //   case 1:
  //     return "January";
  //     break;
  //   case 2:
  //     return "February";
  //     break;
  //   case 3:
  //     return "March";
  //     break;
  //   case 4:
  //     return "April";
  //     break;
  //   case 5:
  //     return "May";
  //     break;
  //   case 6:
  //     return "June";
  //     break;
  //   case 7:
  //     return "July";
  //     break;
  //   case 8:
  //     return "August";
  //     break;
  //   case 9:
  //     return "September";
  //     break;
  //   case 10:
  //     return "October";
  //     break;
  //   case 11:
  //     return "November";
  //     break;
  //   case 12:
  //     return "December";
  //     break;
  //   default:
  //     return null;
  //     break;
  // }
}
