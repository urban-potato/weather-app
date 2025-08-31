import 'package:flutter/material.dart';

import '../../../../../../../../models/index.dart';
import '../../../../../../../../widgets/daily_temperature_range/index.dart';
import '../../../../../../../../widgets/main_temperature/index.dart';
import '../../../../../../../../widgets/weather_condition/index.dart';

import '../../../../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../../../../../../shared/utils/size_helper/index.dart';

class MainForecastInfoWidget extends StatelessWidget {
  const MainForecastInfoWidget({
    super.key,
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
    required this.uv,
  });

  final int temperature;
  final ConditionModelUI condition;
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
          MainTemperatureWidget(temperature: temperature.toString()),
          WeatherConditionWidget(
            text: condition.text,
            iconPath: condition.iconPath,
          ),
          DailyTemperatureRangeWidget(
            maxTemp: maxTemp.toString(),
            minTemp: minTemp.toString(),
          ),
        ],
      ),
    );
  }
}
