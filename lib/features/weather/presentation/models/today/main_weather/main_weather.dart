import '../../condition/condition.dart';
import '../../temperature/temperature.dart';
import '../../temperature_range/temperature_range.dart';

class MainWeatherModelUI {
  final TemperatureModelUI temperature;
  final ConditionModelUI condition;
  final TemperatureRangeModelUI temperatureRange;
  final int uv;
  final int airQualityGbDefraIndex;

  const MainWeatherModelUI({
    required this.temperature,
    required this.condition,
    required this.temperatureRange,
    required this.uv,
    required this.airQualityGbDefraIndex,
  });
}
