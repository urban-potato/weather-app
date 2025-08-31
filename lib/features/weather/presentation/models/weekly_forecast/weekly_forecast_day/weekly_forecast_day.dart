import 'package:equatable/equatable.dart';

import '../../condition/condition.dart';
import '../../precipitation/precipitation.dart';
import '../../sun/sun.dart';
import '../../temperature/temperature.dart';
import '../../temperature_range/temperature_range.dart';
import '../../visibility/visibility.dart';
import '../../wind/wind_speed/wind_speed.dart';

class WeeklyForecastDayModelUI extends Equatable {
  final DateTime date;
  final TemperatureModelUI temperature;
  final ConditionModelUI condition;
  final TemperatureRangeModelUI temperatureRange;
  final int uv;
  final SunModelUI sun;
  final int humidity;
  final WindSpeedModelUI windSpeed;
  final VisibilityModelUI visibility;
  final PrecipitationModelUI precipitation;

  const WeeklyForecastDayModelUI({
    required this.date,
    required this.temperature,
    required this.condition,
    required this.temperatureRange,
    required this.uv,
    required this.sun,
    required this.humidity,
    required this.windSpeed,
    required this.visibility,
    required this.precipitation,
  });

  @override
  List<Object?> get props => [
    date,
    temperature,
    condition,
    temperatureRange,
    uv,
    sun,
    humidity,
    windSpeed,
    visibility,
    precipitation,
  ];
}
