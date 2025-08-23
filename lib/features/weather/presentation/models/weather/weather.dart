import '../location/location.dart';
import '../today/today.dart';
import '../weekly_forecast/weekly_forecast.dart';
import '../weekly_moon/weekly_moon.dart';

class WeatherModelUI {
  final LocationModelUI location;
  final TodayModelUI today;
  final WeeklyForecastModelUI weeklyForecast;
  final WeeklyMoonModelUI weeklyMoon;

  const WeatherModelUI({
    required this.location,
    required this.today,
    required this.weeklyForecast,
    required this.weeklyMoon,
  });
}
