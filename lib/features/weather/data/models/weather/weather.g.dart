// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherModelData _$WeatherModelDataFromJson(Map<String, dynamic> json) =>
    WeatherModelData(
      location: LocationModelData.fromJson(
        json['location'] as Map<String, dynamic>,
      ),
      current: CurrentModelData.fromJson(
        json['current'] as Map<String, dynamic>,
      ),
      forecast: ForecastModelData.fromJson(
        json['forecast'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$WeatherModelDataToJson(WeatherModelData instance) =>
    <String, dynamic>{
      'location': instance.location.toJson(),
      'current': instance.current.toJson(),
      'forecast': instance.forecast.toJson(),
    };
