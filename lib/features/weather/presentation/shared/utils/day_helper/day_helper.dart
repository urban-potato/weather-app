import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getDay(DateTime date) {
  final now = DateTime.now();

  if (DateUtils.isSameDay(date, now)) {
    return 'Today';
  } else if (now.year == date.year &&
      now.month == date.month &&
      now.day == date.day - 1) {
    return 'Tomorrow';
  }
  return DateFormat.EEEE().format(date).substring(0, 3);
}
