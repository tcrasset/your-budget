String getDateString(DateTime datetime) {
  return "${datetime.day}/${datetime.month}/${datetime.year}";
}

DateTime getDateYMD(DateTime datetime) {
  return DateTime(datetime.year, datetime.month, datetime.day);
}
