import 'package:equatable/equatable.dart';

import '../current/current.dart';
import '../forecast/forecast.dart';
import '../location/location.dart';

class WeatherModelDomain extends Equatable {
  final LocationModelDomain location;
  final CurrentModelDomain current;
  final ForecastModelDomain forecast;

  const WeatherModelDomain({
    required this.location,
    required this.current,
    required this.forecast,
  });

  @override
  List<Object?> get props => [location, current, forecast];
}
