bool isUpdateAllowed(DateTime? lastUpdated) {
  final now = DateTime.now();

  if (lastUpdated == null) {
    return true;
  }

  if (now.year == lastUpdated.year &&
      now.month == lastUpdated.month &&
      now.day == lastUpdated.day) {
    if (now.hour == lastUpdated.hour) {
      if (now.minute >= 15 && now.minute < 30 && lastUpdated.minute < 15) {
        return true;
      } else if (now.minute >= 30 &&
          now.minute < 44 &&
          lastUpdated.minute < 30) {
        return true;
      } else if (now.minute >= 45 &&
          now.minute <= 59 &&
          lastUpdated.minute < 45) {
        return true;
      }
      return false;
    }
    return true;
  }

  return true;
}
