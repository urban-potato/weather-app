// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastModelData _$ForecastModelDataFromJson(Map<String, dynamic> json) =>
    ForecastModelData(
      forecastday: (json['forecastday'] as List<dynamic>)
          .map((e) => ForecastDayModelData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastModelDataToJson(ForecastModelData instance) =>
    <String, dynamic>{
      'forecastday': instance.forecastday.map((e) => e.toJson()).toList(),
    };
