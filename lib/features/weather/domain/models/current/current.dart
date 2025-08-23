import 'package:equatable/equatable.dart';

import '../air_quality/air_quality.dart';
import '../condition/condition.dart';
import '../pressure/pressure.dart';
import '../temperature/temperature.dart';
import '../visibility/visibility.dart';
import '../wind/wind.dart';

class CurrentModelDomain extends Equatable {
  final TemperatureModelDomain temperature;
  final ConditionModelDomain condition;
  final WindModelDomain wind;
  final PressureModelDomain pressure;
  final int humidity;
  final TemperatureModelDomain feelsLike;
  final VisibilityModelDomain visibility;
  final double uv;
  final AirQualityModelDomain airQuality;

  const CurrentModelDomain({
    required this.temperature,
    required this.condition,
    required this.wind,
    required this.pressure,
    required this.humidity,
    required this.feelsLike,
    required this.visibility,
    required this.uv,
    required this.airQuality,
  });

  @override
  List<Object?> get props => [
    temperature,
    condition,
    wind,
    pressure,
    humidity,
    feelsLike,
    visibility,
    uv,
    airQuality,
  ];
}
