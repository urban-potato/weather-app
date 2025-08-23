import 'package:json_annotation/json_annotation.dart';

part 'astro.g.dart';

@JsonSerializable()
class AstroModelData {
  final String sunrise;
  final String sunset;
  final String moonrise;
  final String moonset;
  @JsonKey(name: 'moon_phase')
  final String moonPhase;
  @JsonKey(name: 'moon_illumination')
  final double moonIllumination;

  const AstroModelData({
    required this.sunrise,
    required this.sunset,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  factory AstroModelData.fromJson(Map<String, dynamic> json) =>
      _$AstroModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$AstroModelDataToJson(this);
}
