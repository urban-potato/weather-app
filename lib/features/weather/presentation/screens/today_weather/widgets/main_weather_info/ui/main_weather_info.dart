import 'package:flutter/material.dart';

import '../../../../../widgets/daily_temperature_range/index.dart';
import '../../../../../widgets/main_temperature/index.dart';
import '../../../../../widgets/uv_info/index.dart';
import '../../../../../widgets/weather_condition/index.dart';
import '../../../../../../../../shared/utils/size_helpers/index.dart';
import 'components/aqi_info/ui/aqi_info.dart';

class MainWeatherWidgetData {
  MainWeatherWidgetData({
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  final int temperature;
  final WeatherConditionData condition;
  final int maxTemp;
  final int minTemp;
}

class WeatherConditionData {
  WeatherConditionData({required this.text, required this.icon});

  final String text;
  final String icon;
}

class MainWeatherInfoWidget extends StatelessWidget {
  const MainWeatherInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = MainWeatherWidgetData(
      condition: WeatherConditionData(
        text: 'Patchy rain nearby',
        icon: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
      ),
      maxTemp: 23,
      minTemp: 14,
      temperature: 16,
    );

    const int aqi = 15;
    const int uv = 2;

    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(2);

    return Column(
      spacing: spacing,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        MainTemperatureWidget(
          temperature: data.temperature.toString(),
          sizeRatio: 2,
        ),
        WeatherConditionWidget(
          text: data.condition.text,
          iconPath: data.condition.icon,
          sizeRatio: 1.3,
        ),
        DailyTemperatureRangeWidget(
          maxTemp: data.maxTemp,
          minTemp: data.minTemp,
        ),
        const _UVAndAQIInfoRow(aqi: aqi, uv: uv),
      ],
    );
  }
}

class _UVAndAQIInfoRow extends StatelessWidget {
  const _UVAndAQIInfoRow({required this.aqi, required this.uv});

  final int aqi;
  final int uv;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(1);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: spacing,
      runSpacing: spacing,
      children: [
        UvInfoWidget(uv: uv),
        AqiInfoWidget(aqi: aqi),
      ],
    );
  }
}
