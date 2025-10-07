import '../../../../../shared/utils/date_time_formatting_helper/index.dart'
    show getFormattedTime;

String getFormattedMoonTime({
  required DateTime? dateTime,
  required bool ifMoonrise,
}) {
  if (ifMoonrise) {
    return dateTime != null ? getFormattedTime(dateTime) : 'No moonrise';
  }

  return dateTime != null ? getFormattedTime(dateTime) : 'No moonset';
}
