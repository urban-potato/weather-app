// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'condition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConditionModelData _$ConditionModelDataFromJson(Map<String, dynamic> json) =>
    ConditionModelData(
      text: json['text'] as String,
      icon: json['icon'] as String,
      code: (json['code'] as num).toInt(),
    );

Map<String, dynamic> _$ConditionModelDataToJson(ConditionModelData instance) =>
    <String, dynamic>{
      'text': instance.text,
      'icon': instance.icon,
      'code': instance.code,
    };
