import 'package:equatable/equatable.dart';

import 'forecast_day/forecast_day.dart';

class ForecastModelDomain extends Equatable {
  final List<ForecastDayModelDomain> forecastDayList;

  const ForecastModelDomain({required this.forecastDayList});

  @override
  List<Object?> get props => [forecastDayList];
}
