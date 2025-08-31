import 'package:equatable/equatable.dart';

import '../../../condition/condition.dart';
import '../../../temperature_range/temperature_range.dart';

class WeeklyForecastPreviewDayModelUI extends Equatable {
  final DateTime dateTime;
  final ConditionModelUI condition;
  final TemperatureRangeModelUI temperatureRange;

  const WeeklyForecastPreviewDayModelUI({
    required this.dateTime,
    required this.condition,
    required this.temperatureRange,
  });

  @override
  List<Object?> get props => [dateTime, condition, temperatureRange];
}
