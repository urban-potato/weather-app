import 'package:json_annotation/json_annotation.dart';

part 'languages_item.g.dart';

@JsonSerializable()
class LanguagesItemModelData {
  @JsonKey(name: 'lang_name')
  final String langName;
  @JsonKey(name: 'lang_iso')
  final String langIso;
  @JsonKey(name: 'day_text')
  final String dayText;
  @JsonKey(name: 'night_text')
  final String nightText;

  const LanguagesItemModelData({
    required this.langName,
    required this.langIso,
    required this.dayText,
    required this.nightText,
  });

  factory LanguagesItemModelData.fromJson(Map<String, dynamic> json) =>
      _$LanguagesItemModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$LanguagesItemModelDataToJson(this);

  @override
  String toString() {
    return 'LanguagesItemModelData(langName: $langName, langIso: $langIso, dayText: $dayText, nightText: $nightText)';
  }
}
