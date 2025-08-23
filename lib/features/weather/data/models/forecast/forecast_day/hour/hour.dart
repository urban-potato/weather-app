import 'package:json_annotation/json_annotation.dart';

import '../../../condition/condition.dart';

part 'hour.g.dart';

@JsonSerializable(explicitToJson: true)
class HourModelData {
  final String time;
  @JsonKey(name: 'temp_c')
  final double tempC;
  @JsonKey(name: 'temp_f')
  final double tempF;
  final ConditionModelData condition;
  @JsonKey(name: 'wind_mph')
  final double windMph;
  @JsonKey(name: 'wind_kph')
  final double windKph;

  const HourModelData({
    required this.time,
    required this.tempC,
    required this.tempF,
    required this.condition,
    required this.windMph,
    required this.windKph,
  });

  factory HourModelData.fromJson(Map<String, dynamic> json) =>
      _$HourModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$HourModelDataToJson(this);
}
