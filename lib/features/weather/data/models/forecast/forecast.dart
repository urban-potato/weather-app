import 'package:json_annotation/json_annotation.dart';

import 'forecast_day/forecast_day.dart';

part 'forecast.g.dart';

@JsonSerializable(explicitToJson: true)
class ForecastModelData {
  final List<ForecastDayModelData> forecastday;

  const ForecastModelData({required this.forecastday});

  factory ForecastModelData.fromJson(Map<String, dynamic> json) =>
      _$ForecastModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ForecastModelDataToJson(this);

  @override
  String toString() => 'ForecastModelData(forecastday: $forecastday)';
}
