import 'package:json_annotation/json_annotation.dart';

import 'astro/astro.dart';
import 'day/day.dart';
import 'hour/hour.dart';

part 'forecast_day.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastDayModelData {
  final String date;
  final DayModelData day;
  final AstroModelData astro;
  final List<HourModelData> hour;

  const ForecastDayModelData({
    required this.date,
    required this.day,
    required this.astro,
    required this.hour,
  });

  factory ForecastDayModelData.fromJson(Map<String, dynamic> json) =>
      _$ForecastDayModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastDayModelDataToJson(this);

  @override
  String toString() {
    return 'ForecastDayModelData(date: $date, day: $day, astro: $astro, hour: $hour)';
  }
}
