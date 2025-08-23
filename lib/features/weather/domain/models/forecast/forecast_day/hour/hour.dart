import 'package:equatable/equatable.dart';

import '../../../condition/condition.dart';
import '../../../temperature/temperature.dart';
import '../../../wind/wind_speed/wind_speed.dart';

class HourModelDomain extends Equatable {
  final DateTime dateTime;
  final TemperatureModelDomain temperature;
  final ConditionModelDomain condition;
  final WindSpeedModelDomain windSpeed;

  const HourModelDomain({
    required this.dateTime,
    required this.temperature,
    required this.condition,
    required this.windSpeed,
  });

  @override
  List<Object?> get props => [dateTime, temperature, condition, windSpeed];
}
