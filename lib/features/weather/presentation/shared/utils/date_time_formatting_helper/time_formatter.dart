import 'package:intl/intl.dart';

String getFormattedTime(DateTime dateTime) {
  return DateFormat.Hm().format(dateTime);
}
