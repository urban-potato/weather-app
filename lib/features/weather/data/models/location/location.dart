import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class LocationModelData {
  final String name;
  final String country;

  const LocationModelData({required this.name, required this.country});

  factory LocationModelData.fromJson(Map<String, dynamic> json) =>
      _$LocationModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelDataToJson(this);
}
