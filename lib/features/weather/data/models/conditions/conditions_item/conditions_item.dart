import 'package:json_annotation/json_annotation.dart';

import 'languages_item/languages_item.dart';

part 'conditions_item.g.dart';

@JsonSerializable(explicitToJson: true)
class ConditionsItemModelData {
  final int code;
  final String day;
  final String night;
  final int icon;
  final List<LanguagesItemModelData> languages;

  const ConditionsItemModelData({
    required this.code,
    required this.day,
    required this.night,
    required this.icon,
    required this.languages,
  });

  factory ConditionsItemModelData.fromJson(Map<String, dynamic> json) =>
      _$ConditionsItemModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionsItemModelDataToJson(this);

  @override
  String toString() {
    return 'ConditionsItemModelData(code: $code, day: $day, night: $night, icon: $icon, languages: $languages)';
  }
}
