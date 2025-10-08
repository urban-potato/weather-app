import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../models/index.dart';
import '../../../../../../../../widgets/daily_temperature_range/index.dart'
    show ScaledDailyTemperatureRangeWidget;
import '../../../../../../../../widgets/main_temperature/index.dart';
import '../../../../../../../../widgets/weather_condition/index.dart';

import '../../../../../../../../../../../shared/presentation/ui/card_tile/index.dart';

class MainForecastInfoWidget extends ConsumerWidget {
  const MainForecastInfoWidget({
    super.key,
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  final int temperature;
  final ConditionModelUI condition;
  final int maxTemp;
  final int minTemp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    final spacing = sizeService.screenPercentage(2);

    return CardTile(
      child: Column(
        spacing: spacing,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MainTemperatureWidget(temperature: temperature.toString()),
          WeatherConditionWidget(condition: condition),
          ScaledDailyTemperatureRangeWidget(
            maxTemp: maxTemp.toString(),
            minTemp: minTemp.toString(),
          ),
        ],
      ),
    );
  }
}
