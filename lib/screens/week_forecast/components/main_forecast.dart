import 'package:flutter/material.dart';

import '../../../shared/ui/daily_temperature_range/index.dart';
import '../../../shared/ui/main_temperature/index.dart';
import '../../../shared/ui/weather_condition/index.dart';
import '../../../shared/domain/models/weather.dart';
import '../../../shared/layout/card_tile/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';

class MainForecastWidgetData {
  MainForecastWidgetData({
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  final int temperature;
  final WeatherConditionM condition;
  final int maxTemp;
  final int minTemp;
}

class MainForecast extends StatelessWidget {
  const MainForecast({
    super.key,
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
    required this.uv,
  });

  final int temperature;
  final WeatherConditionM condition;
  final int maxTemp;
  final int minTemp;
  final int uv;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(2);

    return CardTile(
      child: Column(
        spacing: spacing,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainTemperature(temperature: temperature),
          WeatherCondition(
            text: condition.text,
            iconPath: condition.iconPath,
            sizeRatio: 1.1,
          ),
          DailyTemperatureRange(maxTemp: maxTemp, minTemp: minTemp),
        ],
      ),
    );
  }
}
