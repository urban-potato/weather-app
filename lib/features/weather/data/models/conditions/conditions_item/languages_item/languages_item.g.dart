// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'languages_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LanguagesItemModelData _$LanguagesItemModelDataFromJson(
  Map<String, dynamic> json,
) => LanguagesItemModelData(
  langName: json['lang_name'] as String,
  langIso: json['lang_iso'] as String,
  dayText: json['day_text'] as String,
  nightText: json['night_text'] as String,
);

Map<String, dynamic> _$LanguagesItemModelDataToJson(
  LanguagesItemModelData instance,
) => <String, dynamic>{
  'lang_name': instance.langName,
  'lang_iso': instance.langIso,
  'day_text': instance.dayText,
  'night_text': instance.nightText,
};
