import '../../temperature/temperature.dart';
import '../../wind/wind_speed/wind_speed.dart';

class HourModelUI {
  final DateTime dateTime;
  final TemperatureModelUI temperature;
  final String conditionIconPath;
  final WindSpeedModelUI windSpeed;

  const HourModelUI({
    required this.dateTime,
    required this.temperature,
    required this.conditionIconPath,
    required this.windSpeed,
  });
}
