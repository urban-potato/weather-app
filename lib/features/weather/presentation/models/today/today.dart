import 'additional_info/additional_info.dart';
import 'weekly_forecast_preview_day/weekly_forecast_preview_day.dart';
import 'hour/hour.dart';
import 'main_weather/main_weather.dart';

class TodayModelUI {
  final MainWeatherModelUI mainWeather;
  final List<WeeklyForecastPreviewDayModelUI> weeklyForecastPreview;
  final List<HourModelUI> hourlyForecast;
  final AdditionalInfoModelUI additionalInfo;

  const TodayModelUI({
    required this.mainWeather,
    required this.weeklyForecastPreview,
    required this.hourlyForecast,
    required this.additionalInfo,
  });
}
