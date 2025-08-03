import 'package:flutter/material.dart';

import '../../../shared/layout/card_tile/index.dart';
import '../../../shared/ui/responsive_info_list/index.dart';
import '../../../shared/ui/main_weather/index.dart';
import '../../../shared/ui/sun_info/index.dart';
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
    final tilesSpacing = ScreenBasedSize.instance.scaleByUnit(2.7);

    final MainWeatherWidgetData mainWeatherWidgetData =
        data.mainWeatherWidgetData;
    final SunData sunData = data.sunData;
    final ExtraWeatherInfoData extraWeatherInfoData = data.extraWeatherInfoData;

    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: contentMaxWidth),
        child: Column(
          spacing: tilesSpacing,
          children: [
            _DateTile(date: data.date),
            _InfoWidgetsRow(
              mainWeatherWidgetData: mainWeatherWidgetData,
              sunData: sunData,
              extraWeatherInfoData: extraWeatherInfoData,
            ),
          ],
        ),
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
    final tilesSpacing = contentMaxWidth / 2 / 17;

    final extraWeatherData = <String, String>{
      'Humidity': '${extraWeatherInfoData.humidity}%',
      'Chance of rain': '${extraWeatherInfoData.chanceOfRain}%',
      'Chance of snow': '${extraWeatherInfoData.chanceOfSnow}%',
      'Wind': '${extraWeatherInfoData.windSpeed} km/h',
      'Visibility': '${extraWeatherInfoData.visibility} km',
      'UV': extraWeatherInfoData.uv.toString(),
    };

    return Row(
      spacing: tilesSpacing,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Column(
            spacing: tilesSpacing,
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
          child: CardTile(child: ResponsiveInfoList(data: extraWeatherData)),
        ),
      ],
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final horizontalPadding = ScreenBasedSize.instance.scaleByUnit(1);
    final verticalPadding = ScreenBasedSize.instance.scaleByUnit(2);
    final fontSize = ScreenBasedSize.instance.scaleByUnit(3.2);

    return CardTile(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        date,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
