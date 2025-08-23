import '../../moon/moon.dart';
import '../../precipitation/precipitation.dart';
import '../../pressure/pressure.dart';
import '../../sun/sun.dart';
import '../../temperature/temperature.dart';
import '../../visibility/visibility.dart';
import '../../wind/wind.dart';

class AdditionalInfoModelUI {
  final WindModelUI wind;
  final SunModelUI sun;
  final MoonModelUI moon;
  final TemperatureModelUI feelsLike;
  final int humidity;
  final PressureModelUI pressure;
  final VisibilityModelUI visibility;
  final PrecipitationModelUI precipitation;

  const AdditionalInfoModelUI({
    required this.wind,
    required this.sun,
    required this.moon,
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.visibility,
    required this.precipitation,
  });
}
