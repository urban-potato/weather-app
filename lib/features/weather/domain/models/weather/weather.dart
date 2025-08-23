import '../current/current.dart';
import '../forecast/forecast.dart';
import '../location/location.dart';

class WeatherModelDomain {
  final LocationModelDomain location;
  final CurrentModelDomain current;
  final ForecastModelDomain forecast;

  const WeatherModelDomain({
    required this.location,
    required this.current,
    required this.forecast,
  });
}
