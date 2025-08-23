// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayModelData _$DayModelDataFromJson(Map<String, dynamic> json) => DayModelData(
  maxTempC: (json['maxtemp_c'] as num).toDouble(),
  maxTempF: (json['maxtemp_f'] as num).toDouble(),
  minTempC: (json['mintemp_c'] as num).toDouble(),
  minTempF: (json['mintemp_f'] as num).toDouble(),
  avgTempC: (json['avgtemp_c'] as num).toDouble(),
  avgTempF: (json['avgtemp_f'] as num).toDouble(),
  maxWindMph: (json['maxwind_mph'] as num).toDouble(),
  maxWindKph: (json['maxwind_kph'] as num).toDouble(),
  avgVisKm: (json['avgvis_km'] as num).toDouble(),
  avgVisMiles: (json['avgvis_miles'] as num).toDouble(),
  avgHumidity: (json['avghumidity'] as num).toInt(),
  dailyChanceOfRain: (json['daily_chance_of_rain'] as num).toInt(),
  dailyChanceOfSnow: (json['daily_chance_of_snow'] as num).toInt(),
  condition: ConditionModelData.fromJson(
    json['condition'] as Map<String, dynamic>,
  ),
  uv: (json['uv'] as num).toDouble(),
);

Map<String, dynamic> _$DayModelDataToJson(DayModelData instance) =>
    <String, dynamic>{
      'maxtemp_c': instance.maxTempC,
      'maxtemp_f': instance.maxTempF,
      'mintemp_c': instance.minTempC,
      'mintemp_f': instance.minTempF,
      'avgtemp_c': instance.avgTempC,
      'avgtemp_f': instance.avgTempF,
      'maxwind_mph': instance.maxWindMph,
      'maxwind_kph': instance.maxWindKph,
      'avgvis_km': instance.avgVisKm,
      'avgvis_miles': instance.avgVisMiles,
      'avghumidity': instance.avgHumidity,
      'daily_chance_of_rain': instance.dailyChanceOfRain,
      'daily_chance_of_snow': instance.dailyChanceOfSnow,
      'condition': instance.condition.toJson(),
      'uv': instance.uv,
    };
