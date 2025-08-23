import 'package:json_annotation/json_annotation.dart';

part 'air_quality.g.dart';

@JsonSerializable()
class AirQualityModelData {
  final double co;
  final double no2;
  final double o3;
  final double so2;
  @JsonKey(name: 'pm2_5')
  final double pm25;
  final double pm10;
  @JsonKey(name: 'gb-defra-index')
  final int gbDefraIndex;

  const AirQualityModelData({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.gbDefraIndex,
  });

  factory AirQualityModelData.fromJson(Map<String, dynamic> json) =>
      _$AirQualityModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$AirQualityModelDataToJson(this);
}
