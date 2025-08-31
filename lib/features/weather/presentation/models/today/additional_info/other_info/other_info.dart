import 'package:equatable/equatable.dart';

import '../../../pressure/pressure.dart';
import '../../../temperature/temperature.dart';
import '../../../visibility/visibility.dart';

class OtherWeatherInfoModelUI extends Equatable {
  final TemperatureModelUI feelsLike;
  final int humidity;
  final PressureModelUI pressure;
  final VisibilityModelUI visibility;

  const OtherWeatherInfoModelUI({
    required this.feelsLike,
    required this.humidity,
    required this.pressure,
    required this.visibility,
  });

  @override
  List<Object?> get props => [feelsLike, humidity, pressure, visibility];
}
