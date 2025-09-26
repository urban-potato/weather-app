enum RouterPaths {
  root('/'),
  weather('weather'),
  today('today'),
  weeklyForecast('weeklyForecast'),
  moonInfo('moonInfo'),
  locationsManager('locationsManager'),
  settings('settings');

  final String relativePath;
  const RouterPaths(this.relativePath);
}
