import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getCutFormattedDate(DateTime dateTime) {
  final now = DateTime.now();

  if (DateUtils.isSameDay(dateTime, now)) {
    return 'Today';
  } else if (now.year == dateTime.year &&
      now.month == dateTime.month &&
      now.day == dateTime.day - 1) {
    return 'Tomorrow';
  }
  return DateFormat.EEEE().format(dateTime).substring(0, 3);
}
