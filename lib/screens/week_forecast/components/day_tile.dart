import 'package:flutter/material.dart';

import '../../../shared/layout/card_tile/index.dart';
import '../../../shared/ui/responsive_info_list/index.dart';
import '../../../shared/ui/main_weather/index.dart';
import '../../../shared/ui/sun_info/index.dart';
import '../../../shared/ui/widget_title/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';

class WeatherForecastData {
  WeatherForecastData({
    required this.date,
    required this.mainWeatherWidgetData,
    required this.sunData,
    required this.extraWeatherInfoData,
  });

  final String date;
  final MainWeatherWidgetData mainWeatherWidgetData;
  final SunData sunData;
  final ExtraWeatherInfoData extraWeatherInfoData;
}

class ExtraWeatherInfoData {
  ExtraWeatherInfoData({
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

  final WeatherForecastData data;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();

    final MainWeatherWidgetData mainWeatherWidgetData =
        data.mainWeatherWidgetData;
    final SunData sunData = data.sunData;
    final ExtraWeatherInfoData extraWeatherInfoData = data.extraWeatherInfoData;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: contentMaxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitle(title: data.date),
          _InfoWidgetsRow(
            mainWeatherWidgetData: mainWeatherWidgetData,
            sunData: sunData,
            extraWeatherInfoData: extraWeatherInfoData,
          ),
        ],
      ),
    );
  }
}

class _InfoWidgetsRow extends StatelessWidget {
  const _InfoWidgetsRow({
    required this.mainWeatherWidgetData,
    required this.sunData,
    required this.extraWeatherInfoData,
  });

  final MainWeatherWidgetData mainWeatherWidgetData;
  final SunData sunData;
  final ExtraWeatherInfoData extraWeatherInfoData;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final spacing = contentMaxWidth / 2 / 17;

    final extraWeatherData = <String, String>{
      'Humidity': '${extraWeatherInfoData.humidity}%',
      'Wind': '${extraWeatherInfoData.windSpeed} km/h',
      'Visibility': '${extraWeatherInfoData.visibility} km',
      'Chance of rain': '${extraWeatherInfoData.chanceOfRain}%',
      'Chance of snow': '${extraWeatherInfoData.chanceOfSnow}%',
      // 'UV': extraWeatherInfoData.uv.toString(),
    };

    return Row(
      spacing: spacing,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            spacing: spacing,
            children: [
              CardTile(
                child: MainWeatherWidget(
                  data: mainWeatherWidgetData,
                  currentTemperatureSize: 0.7,
                ),
              ),
              CardTile(child: SunInfoWidget(data: sunData)),
            ],
          ),
        ),

        Flexible(
          child: Column(
            spacing: spacing,
            children: [
              CardTile(child: ResponsiveInfoList(data: extraWeatherData)),
              _UVInfoTile(uv: extraWeatherInfoData.uv),
            ],
          ),
        ),
      ],
    );
  }
}

class _UVInfoTile extends StatelessWidget {
  const _UVInfoTile({required this.uv});

  final int uv;

  @override
  Widget build(BuildContext context) {
    final uvData = <String, String>{'UV': uv.toString()};

    final tileCOlor = uv < 3
        ? Colors.green
        : uv < 5
        ? Colors.amber
        : uv < 7
        ? Colors.orange
        : uv < 10
        ? Colors.red
        : Colors.black;

    return CardTile(
      color: tileCOlor,
      child: ResponsiveInfoList(
        data: uvData,
        withDivider: false,
        textColor: Colors.white,
        labelFontWeight: FontWeight.bold,
        valueFontWeight: FontWeight.bold,
      ),
    );
  }
}
