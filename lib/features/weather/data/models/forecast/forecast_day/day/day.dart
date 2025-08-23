import 'package:json_annotation/json_annotation.dart';

import '../../../condition/condition.dart';

part 'day.g.dart';

@JsonSerializable(explicitToJson: true)
class DayModelData {
  @JsonKey(name: 'maxtemp_c')
  final double maxTempC;
  @JsonKey(name: 'maxtemp_f')
  final double maxTempF;
  @JsonKey(name: 'mintemp_c')
  final double minTempC;
  @JsonKey(name: 'mintemp_f')
  final double minTempF;
  @JsonKey(name: 'avgtemp_c')
  final double avgTempC;
  @JsonKey(name: 'avgtemp_f')
  final double avgTempF;
  @JsonKey(name: 'maxwind_mph')
  final double maxWindMph;
  @JsonKey(name: 'maxwind_kph')
  final double maxWindKph;
  @JsonKey(name: 'avgvis_km')
  final double avgVisKm;
  @JsonKey(name: 'avgvis_miles')
  final double avgVisMiles;
  @JsonKey(name: 'avghumidity')
  final int avgHumidity;
  @JsonKey(name: 'daily_chance_of_rain')
  final int dailyChanceOfRain;
  @JsonKey(name: 'daily_chance_of_snow')
  final int dailyChanceOfSnow;
  final ConditionModelData condition;
  final double uv;

  const DayModelData({
    required this.maxTempC,
    required this.maxTempF,
    required this.minTempC,
    required this.minTempF,
    required this.avgTempC,
    required this.avgTempF,
    required this.maxWindMph,
    required this.maxWindKph,
    required this.avgVisKm,
    required this.avgVisMiles,
    required this.avgHumidity,
    required this.dailyChanceOfRain,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  factory DayModelData.fromJson(Map<String, dynamic> json) =>
      _$DayModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$DayModelDataToJson(this);
}
