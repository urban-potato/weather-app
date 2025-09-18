import 'package:flutter/material.dart';

import '../../../../../../../../../../shared/services/index.dart'
    show ResponsiveSizeService;
import '../../../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../../../../models/index.dart';
import '../../../../../../../widgets/sun_info/index.dart';
import '../../../../../../../widgets/uv_info/index.dart';
import '../../../../../../../../shared/ui/widget_title/index.dart';
import 'components/main_forecast_info.dart';

class MainForecastWidgetData {
  MainForecastWidgetData({
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  final int temperature;
  final ConditionModelUI condition;
  final int maxTemp;
  final int minTemp;
}

class WeatherForecastDayData {
  WeatherForecastDayData({
    required this.date,
    required this.mainForecastWidgetData,
    required this.extraWeatherData,
    required this.sunriseTime,
    required this.sunsetTime,
  });

  final String date;
  final MainForecastWidgetData mainForecastWidgetData;
  final ExtraWeatherData extraWeatherData;
  final String sunriseTime;
  final String sunsetTime;
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

class DayTileWidget extends StatelessWidget {
  const DayTileWidget({
    super.key,
    required this.data,
    required this.sizeService,
  });

  final WeatherForecastDayData data;
  final ResponsiveSizeService sizeService;

  @override
  Widget build(BuildContext context) {
    final contentMaxWidth = sizeService.contentMaxWidth;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: contentMaxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitle(title: data.date),
          _InfoWidgetsRow(
            mainForecastWidgetData: data.mainForecastWidgetData,
            extraWeatherData: data.extraWeatherData,
            sunriseTime: data.sunriseTime,
            sunsetTime: data.sunsetTime,
            sizeService: sizeService,
          ),
        ],
      ),
    );
  }
}

class _InfoWidgetsRow extends StatelessWidget {
  const _InfoWidgetsRow({
    required this.mainForecastWidgetData,
    required this.extraWeatherData,
    required this.sunriseTime,
    required this.sunsetTime,
    required this.sizeService,
  });

  final MainForecastWidgetData mainForecastWidgetData;
  final ExtraWeatherData extraWeatherData;
  final String sunriseTime;
  final String sunsetTime;
  final ResponsiveSizeService sizeService;

  @override
  Widget build(BuildContext context) {
    final contentMaxWidth = sizeService.contentMaxWidth;
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
              MainForecastInfoWidget(
                maxTemp: mainForecastWidgetData.maxTemp,
                minTemp: mainForecastWidgetData.minTemp,
                temperature: mainForecastWidgetData.temperature,
                condition: mainForecastWidgetData.condition,
                uv: extraWeatherData.uv,
              ),
              UvInfoWidget(uv: extraWeatherData.uv),
              CardTile(
                child: SunInfoWidget(
                  sunriseTime: sunriseTime,
                  sunsetTime: sunsetTime,
                ),
              ),
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
