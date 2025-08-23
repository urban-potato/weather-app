import 'package:json_annotation/json_annotation.dart';

import '../current/current.dart';
import '../forecast/forecast.dart';
import '../location/location.dart';

part 'weather.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherModelData {
  final LocationModelData location;
  final CurrentModelData current;
  final ForecastModelData forecast;

  const WeatherModelData({
    required this.location,
    required this.current,
    required this.forecast,
  });

  factory WeatherModelData.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherModelDataToJson(this);
}
