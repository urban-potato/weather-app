import 'package:equatable/equatable.dart';

import '../location/location.dart';
import '../today/today.dart';
import '../weekly_forecast/weekly_forecast.dart';
import '../weekly_moon/weekly_moon.dart';

class WeatherModelUI extends Equatable {
  final LocationModelUI location;
  final TodayModelUI today;
  final WeeklyForecastModelUI weeklyForecast;
  final WeeklyMoonModelUI weeklyMoon;
  final DateTime lastUpdated;

  const WeatherModelUI({
    required this.location,
    required this.today,
    required this.weeklyForecast,
    required this.weeklyMoon,
    required this.lastUpdated,
  });

  @override
  List<Object?> get props => [
    location,
    today,
    weeklyForecast,
    weeklyMoon,
    lastUpdated,
  ];
}
