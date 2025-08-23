// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast_day.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForecastDayModelData _$ForecastDayModelDataFromJson(
  Map<String, dynamic> json,
) => ForecastDayModelData(
  date: json['date'] as String,
  day: DayModelData.fromJson(json['day'] as Map<String, dynamic>),
  astro: AstroModelData.fromJson(json['astro'] as Map<String, dynamic>),
  hour: (json['hour'] as List<dynamic>)
      .map((e) => HourModelData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ForecastDayModelDataToJson(
  ForecastDayModelData instance,
) => <String, dynamic>{
  'date': instance.date,
  'day': instance.day.toJson(),
  'astro': instance.astro.toJson(),
  'hour': instance.hour.map((e) => e.toJson()).toList(),
};
