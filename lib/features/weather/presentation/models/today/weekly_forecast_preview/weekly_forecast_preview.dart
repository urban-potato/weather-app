import 'package:equatable/equatable.dart';

import 'weekly_forecast_preview_day/weekly_forecast_preview_day.dart';

class WeeklyForecastPreviewModelUI extends Equatable {
  final List<WeeklyForecastPreviewDayModelUI> weeklyForecastPreviewDayList;

  const WeeklyForecastPreviewModelUI({
    required this.weeklyForecastPreviewDayList,
  });

  @override
  List<Object?> get props => [weeklyForecastPreviewDayList];
}
