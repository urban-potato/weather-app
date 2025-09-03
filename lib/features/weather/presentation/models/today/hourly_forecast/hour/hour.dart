import 'package:equatable/equatable.dart';

import '../../../condition/condition.dart';
import '../../../temperature/temperature.dart';
import '../../../wind/wind_speed/wind_speed.dart';

class HourModelUI extends Equatable {
  final DateTime dateTime;
  final TemperatureModelUI temperature;
  final WindSpeedModelUI windSpeed;
  final ConditionModelUI condition;

  const HourModelUI({
    required this.dateTime,
    required this.temperature,
    required this.windSpeed,
    required this.condition,
  });

  @override
  List<Object?> get props => [dateTime, temperature, windSpeed, condition];
}
