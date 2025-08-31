String getLastUpdatedInfo(DateTime? lastUpdated) {
  if (lastUpdated == null) {
    return '';
  }

  DateTime now = DateTime.now();

  if (now.year == lastUpdated.year &&
      now.month == lastUpdated.month &&
      now.day == lastUpdated.day &&
      now.hour == lastUpdated.hour) {
    final minutesDifference = now.minute - lastUpdated.minute;

    if (minutesDifference >= 45) {
      return 'Updated about 45 minutes ago';
    } else if (minutesDifference >= 30) {
      return 'Updated about 30 minutes ago';
    } else if (minutesDifference >= 15) {
      return 'Updated about 15 minutes ago';
    } else {
      return 'Updated a moment ago';
    }
  } else if (now.year == lastUpdated.year &&
      now.month == lastUpdated.month &&
      now.day == lastUpdated.day) {
    if ((now.hour - lastUpdated.hour) >= 2) {
      return 'Updated more than a few hours ago';
    } else if (now.hour > lastUpdated.hour) {
      return 'Updated over an hour ago';
    }
  } else if (now.year == lastUpdated.year &&
      now.month == lastUpdated.month &&
      now.day > lastUpdated.day) {
    return 'Updated over a day ago';
  }
  return 'Updated long ago';
}
