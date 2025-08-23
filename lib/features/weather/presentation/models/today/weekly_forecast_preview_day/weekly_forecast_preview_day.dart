import '../../condition/condition.dart';
import '../../temperature_range/temperature_range.dart';

class WeeklyForecastPreviewDayModelUI {
  final DateTime dateTime;
  final ConditionModelUI condition;
  final TemperatureRangeModelUI temperatureRange;

  const WeeklyForecastPreviewDayModelUI({
    required this.dateTime,
    required this.condition,
    required this.temperatureRange,
  });
}
