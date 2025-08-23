import 'package:equatable/equatable.dart';

import 'astro/astro.dart';
import 'day/day.dart';
import 'hour/hour.dart';

class ForecastDayModelDomain extends Equatable {
  final DateTime date;
  final DayModelDomain day;
  final AstroModelDomain astro;
  final List<HourModelDomain> hourlyForecast;

  const ForecastDayModelDomain({
    required this.date,
    required this.day,
    required this.astro,
    required this.hourlyForecast,
  });

  @override
  List<Object?> get props => [date, day, astro, hourlyForecast];
}
