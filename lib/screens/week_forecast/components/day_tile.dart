import 'package:flutter/material.dart';

import '../../../shared/layout/card_tile/index.dart';
import '../../../shared/ui/responsive_info_list/index.dart';
import '../../../shared/ui/sun_info/index.dart';
import '../../../shared/ui/uv_info/index.dart';
import '../../../shared/ui/widget_title/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import 'main_forecast.dart';

class WeatherForecastDayData {
  WeatherForecastDayData({
    required this.date,
    required this.mainForecastWidgetData,
    required this.sunData,
    required this.extraWeatherData,
  });

  final String date;
  final MainForecastWidgetData mainForecastWidgetData;
  final SunData sunData;
  final ExtraWeatherData extraWeatherData;
}

class ExtraWeatherData {
  ExtraWeatherData({
    required this.humidity,
    required this.chanceOfRain,
    required this.chanceOfSnow,
    required this.windSpeed,
    required this.visibility,
    required this.uv,
  });

  final int humidity;
  final int chanceOfRain;
  final int chanceOfSnow;
  final double windSpeed;
  final int visibility;
  final int uv;
}

class DayTile extends StatelessWidget {
  const DayTile({super.key, required this.data});

  final WeatherForecastDayData data;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: contentMaxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitle(title: data.date),
          _InfoWidgetsRow(
            mainForecastWidgetData: data.mainForecastWidgetData,
            sunData: data.sunData,
            extraWeatherData: data.extraWeatherData,
          ),
        ],
      ),
    );
  }
}

class _InfoWidgetsRow extends StatelessWidget {
  const _InfoWidgetsRow({
    required this.mainForecastWidgetData,
    required this.sunData,
    required this.extraWeatherData,
  });

  final MainForecastWidgetData mainForecastWidgetData;
  final SunData sunData;
  final ExtraWeatherData extraWeatherData;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final spacing = contentMaxWidth / 2 / 17;

    final extraWeatherDataMap = <String, String>{
      'Humidity': '${extraWeatherData.humidity}%',
      'Wind': '${extraWeatherData.windSpeed} km/h',
      'Visibility': '${extraWeatherData.visibility} km',
    };

    final precipitationDataMap = <String, String>{
      'Chance of rain': '${extraWeatherData.chanceOfRain}%',
      'Chance of snow': '${extraWeatherData.chanceOfSnow}%',
    };

    return Row(
      spacing: spacing,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: spacing,
            children: [
              MainForecast(
                maxTemp: mainForecastWidgetData.maxTemp,
                minTemp: mainForecastWidgetData.minTemp,
                temperature: mainForecastWidgetData.temperature,
                condition: mainForecastWidgetData.condition,
                uv: extraWeatherData.uv,
              ),
              UvInfo(uv: extraWeatherData.uv),
              CardTile(child: SunInfo(data: sunData)),
            ],
          ),
        ),

        Flexible(
          child: Column(
            spacing: spacing,
            children: [
              CardTile(child: ResponsiveInfoList(data: extraWeatherDataMap)),
              CardTile(child: ResponsiveInfoList(data: precipitationDataMap)),
            ],
          ),
        ),
      ],
    );
  }
}
