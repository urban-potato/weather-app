import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getFormattedDate(DateTime dateTime) {
  final now = DateTime.now();

  if (DateUtils.isSameDay(dateTime, now)) {
    return 'Today';
  } else if (now.year == dateTime.year &&
      now.month == dateTime.month &&
      now.day == dateTime.day - 1) {
    return 'Tomorrow';
  }
  final dayFormatted = DateFormat.EEEE().format(dateTime);
  final dateFormatted = DateFormat.MMMd().format(dateTime);

  return '$dayFormatted ($dateFormatted)';
}
