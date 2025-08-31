import 'package:equatable/equatable.dart';

import 'hour/hour.dart';

class HourlyForecastModelUI extends Equatable {
  final DateTime localtime;
  final List<HourModelUI> hoursList;

  const HourlyForecastModelUI({
    required this.localtime,
    required this.hoursList,
  });

  @override
  List<Object?> get props => [localtime, hoursList];
}
