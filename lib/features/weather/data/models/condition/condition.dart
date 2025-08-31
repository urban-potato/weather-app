import 'package:json_annotation/json_annotation.dart';

part 'condition.g.dart';

@JsonSerializable()
class ConditionModelData {
  final String text;
  final String icon;
  final int code;

  const ConditionModelData({
    required this.text,
    required this.icon,
    required this.code,
  });

  factory ConditionModelData.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$ConditionModelDataToJson(this);

  @override
  String toString() =>
      'ConditionModelData(text: $text, icon: $icon, code: $code)';
}
