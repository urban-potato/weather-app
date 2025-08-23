// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'air_quality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AirQualityModelData _$AirQualityModelDataFromJson(Map<String, dynamic> json) =>
    AirQualityModelData(
      co: (json['co'] as num).toDouble(),
      no2: (json['no2'] as num).toDouble(),
      o3: (json['o3'] as num).toDouble(),
      so2: (json['so2'] as num).toDouble(),
      pm25: (json['pm2_5'] as num).toDouble(),
      pm10: (json['pm10'] as num).toDouble(),
      gbDefraIndex: (json['gb-defra-index'] as num).toInt(),
    );

Map<String, dynamic> _$AirQualityModelDataToJson(
  AirQualityModelData instance,
) => <String, dynamic>{
  'co': instance.co,
  'no2': instance.no2,
  'o3': instance.o3,
  'so2': instance.so2,
  'pm2_5': instance.pm25,
  'pm10': instance.pm10,
  'gb-defra-index': instance.gbDefraIndex,
};
