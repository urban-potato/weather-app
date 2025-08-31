import 'package:equatable/equatable.dart';

import '../../../temperature/temperature.dart';
import '../../../wind/wind_speed/wind_speed.dart';

class HourModelUI extends Equatable {
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

  @override
  List<Object?> get props => [
    dateTime,
    temperature,
    conditionIconPath,
    windSpeed,
  ];
}
