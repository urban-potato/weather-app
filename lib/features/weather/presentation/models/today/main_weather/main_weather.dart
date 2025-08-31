import 'package:equatable/equatable.dart';

import '../../condition/condition.dart';
import '../../temperature/temperature.dart';
import '../../temperature_range/temperature_range.dart';

class MainWeatherModelUI extends Equatable {
  final String lastUpdated;
  final TemperatureModelUI temperature;
  final ConditionModelUI condition;
  final TemperatureRangeModelUI temperatureRange;
  final int uv;
  final int airQualityGbDefraIndex;

  const MainWeatherModelUI({
    required this.lastUpdated,
    required this.temperature,
    required this.condition,
    required this.temperatureRange,
    required this.uv,
    required this.airQualityGbDefraIndex,
  });

  @override
  List<Object?> get props => [
    lastUpdated,
    temperature,
    condition,
    temperatureRange,
    uv,
    airQualityGbDefraIndex,
  ];
}
