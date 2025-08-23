import 'package:equatable/equatable.dart';

import '../../../condition/condition.dart';
import '../../../precipitation/precipitation.dart';
import '../../../temperature/temperature.dart';
import '../../../visibility/visibility.dart';
import '../../../wind/wind_speed/wind_speed.dart';

class DayModelDomain extends Equatable {
  final TemperatureModelDomain maxTemp;
  final TemperatureModelDomain minTemp;
  final TemperatureModelDomain avgTemp;
  final WindSpeedModelDomain maxWind;
  final VisibilityModelDomain avgVisability;
  final int avgHumidity;
  final PrecipitationModelDomain precipitation;
  final ConditionModelDomain condition;
  final double uv;

  const DayModelDomain({
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.maxWind,
    required this.avgVisability,
    required this.avgHumidity,
    required this.precipitation,
    required this.condition,
    required this.uv,
  });

  @override
  List<Object?> get props => [
    maxTemp,
    minTemp,
    avgTemp,
    maxWind,
    avgVisability,
    avgHumidity,
    precipitation,
    condition,
    uv,
  ];
}
