// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conditions_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionsItemModelData _$ConditionsItemModelDataFromJson(
  Map<String, dynamic> json,
) => ConditionsItemModelData(
  code: (json['code'] as num).toInt(),
  day: json['day'] as String,
  night: json['night'] as String,
  icon: (json['icon'] as num).toInt(),
  languages: (json['languages'] as List<dynamic>)
      .map((e) => LanguagesItemModelData.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ConditionsItemModelDataToJson(
  ConditionsItemModelData instance,
) => <String, dynamic>{
  'code': instance.code,
  'day': instance.day,
  'night': instance.night,
  'icon': instance.icon,
  'languages': instance.languages.map((e) => e.toJson()).toList(),
};
