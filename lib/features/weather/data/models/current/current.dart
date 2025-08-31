import 'package:json_annotation/json_annotation.dart';

import '../air_quality/air_quality.dart';
import '../condition/condition.dart';

part 'current.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentModelData {
  @JsonKey(name: 'last_updated')
  final String lastUpdated;
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  final ConditionModelData condition;
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @JsonKey(name: 'wind_kph')
  final double windKph;
  @JsonKey(name: 'wind_dir')
  final String windDir;
  @JsonKey(name: 'pressure_mb')
  final double pressureMb;
  @JsonKey(name: 'pressure_in')
  final double pressureIn;
  final int humidity;
  @JsonKey(name: 'feelslike_c')
  final double feelslikeC;
  @JsonKey(name: 'feelslike_f')
  final double feelslikeF;
  @JsonKey(name: 'vis_km')
  final double visKm;
  @JsonKey(name: 'vis_miles')
  final double visMiles;
  final double uv;
  @JsonKey(name: 'air_quality')
  final AirQualityModelData airQuality;

  const CurrentModelData({
    required this.lastUpdated,
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windMph,
    required this.windKph,
    required this.windDir,
    required this.pressureMb,
    required this.pressureIn,
    required this.humidity,
    required this.feelslikeC,
    required this.feelslikeF,
    required this.visKm,
    required this.visMiles,
    required this.uv,
    required this.airQuality,
  });

  factory CurrentModelData.fromJson(Map<String, dynamic> json) =>
      _$CurrentModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentModelDataToJson(this);

  @override
  String toString() {
    return 'CurrentModelData(lastUpdated: $lastUpdated, tempC: $tempC, tempF: $tempF, condition: $condition, windMph: $windMph, windKph: $windKph, windDir: $windDir, pressureMb: $pressureMb, pressureIn: $pressureIn, humidity: $humidity, feelslikeC: $feelslikeC, feelslikeF: $feelslikeF, visKm: $visKm, visMiles: $visMiles, uv: $uv, airQuality: $airQuality)';
  }
}
