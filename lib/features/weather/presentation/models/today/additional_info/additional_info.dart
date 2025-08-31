import 'package:equatable/equatable.dart';

import '../../moon/moon.dart';
import '../../precipitation/precipitation.dart';
import '../../sun/sun.dart';
import '../../wind/wind.dart';
import 'other_info/other_info.dart';

class AdditionalInfoModelUI extends Equatable {
  final WindModelUI wind;
  final SunModelUI sun;
  final MoonModelUI moon;
  final OtherWeatherInfoModelUI otherWeatherInfo;
  final PrecipitationModelUI precipitation;

  const AdditionalInfoModelUI({
    required this.wind,
    required this.sun,
    required this.moon,
    required this.otherWeatherInfo,
    required this.precipitation,
  });

  @override
  List<Object?> get props => [wind, sun, moon, precipitation];
}
