import 'package:json_annotation/json_annotation.dart';

part 'location.g.dart';

@JsonSerializable()
class LocationModelData {
  final String name;
  final String country;
  final String localtime;

  const LocationModelData({
    required this.name,
    required this.country,
    required this.localtime,
  });

  factory LocationModelData.fromJson(Map<String, dynamic> json) =>
      _$LocationModelDataFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelDataToJson(this);

  @override
  String toString() => 'LocationModelData(name: $name, country: $country)';
}
