// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourModelData _$HourModelDataFromJson(Map<String, dynamic> json) =>
    HourModelData(
      time: json['time'] as String,
      tempC: (json['temp_c'] as num).toDouble(),
      tempF: (json['temp_f'] as num).toDouble(),
      condition: ConditionModelData.fromJson(
        json['condition'] as Map<String, dynamic>,
      ),
      windMph: (json['wind_mph'] as num).toDouble(),
      windKph: (json['wind_kph'] as num).toDouble(),
    );

Map<String, dynamic> _$HourModelDataToJson(HourModelData instance) =>
    <String, dynamic>{
      'time': instance.time,
      'temp_c': instance.tempC,
      'temp_f': instance.tempF,
      'condition': instance.condition.toJson(),
      'wind_mph': instance.windMph,
      'wind_kph': instance.windKph,
    };
