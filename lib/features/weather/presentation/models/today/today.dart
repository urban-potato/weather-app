import 'package:equatable/equatable.dart';

import 'additional_info/additional_info.dart';
import 'hourly_forecast/hourly_forecast.dart';
import 'main_weather/main_weather.dart';
import 'weekly_forecast_preview/weekly_forecast_preview.dart';

class TodayModelUI extends Equatable {
  final MainWeatherModelUI mainWeather;
  final WeeklyForecastPreviewModelUI weeklyForecastPreview;
  final HourlyForecastModelUI hourlyForecast;
  final AdditionalInfoModelUI additionalInfo;

  const TodayModelUI({
    required this.mainWeather,
    required this.weeklyForecastPreview,
    required this.hourlyForecast,
    required this.additionalInfo,
  });

  @override
  List<Object?> get props => [
    mainWeather,
    weeklyForecastPreview,
    hourlyForecast,
    additionalInfo,
  ];
}
