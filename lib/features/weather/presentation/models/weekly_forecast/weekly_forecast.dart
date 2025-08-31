import 'package:equatable/equatable.dart';

import 'weekly_forecast_day/weekly_forecast_day.dart';

class WeeklyForecastModelUI extends Equatable {
  final List<WeeklyForecastDayModelUI> forecastDayList;

  const WeeklyForecastModelUI({required this.forecastDayList});

  @override
  List<Object?> get props => [forecastDayList];
}
