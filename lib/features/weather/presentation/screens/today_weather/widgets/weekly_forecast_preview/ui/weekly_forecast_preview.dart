import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../app/router/router.gr.dart';
import '../../../../../models/weather.dart';
import '../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../shared/ui/widget_title/index.dart';
import '../../../../../../../../shared/utils/size_helpers/index.dart';
import 'components/daily_temperature_range.dart';

class WeeklyForecastPreviewItem {
  WeeklyForecastPreviewItem({
    required this.date,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  final String date;
  final WeatherConditionModelUI condition;
  final int maxTemp;
  final int minTemp;
}

class WeekForecastPreviewWidget extends StatelessWidget {
  const WeekForecastPreviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      WeeklyForecastPreviewItem(
        date: 'Tomorrow',
        condition: const WeatherConditionModelUI(
          text: 'Patchy rain nearby',
          iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
        ),
        maxTemp: 20,
        minTemp: 14,
      ),
      WeeklyForecastPreviewItem(
        date: 'Mon',
        condition: const WeatherConditionModelUI(
          text: 'Rain',
          iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/353.png',
        ),
        maxTemp: 16,
        minTemp: 12,
      ),
      WeeklyForecastPreviewItem(
        date: 'Tue',
        condition: const WeatherConditionModelUI(
          text: 'Sunny',
          iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
        ),
        maxTemp: 22,
        minTemp: 16,
      ),
    ];

    final reducedData = data.take(3).toList();

    return GestureDetector(
      onTap: () => context.router.push(const WeeklyForecastRoute()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WidgetTitle(title: 'Weekly forecast'),

          CardTile(
            child: Column(
              children: [
                ...reducedData.map((e) => _InfoRow(item: e)),
                Text(
                  'More info...',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.item});

  final WeeklyForecastPreviewItem item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 10);
        final conditionTextHPadding = AdjustableSize.scaleByUnit(
          constraintsMaxWidth,
          1.8,
        );
        final imageSpacing = AdjustableSize.scaleByUnit(
          constraintsMaxWidth,
          1.5,
        );
        final temperatureRowMaxWidth = constraintsMaxWidth * 0.5;
        final firstRowMaxWidth = constraintsMaxWidth - temperatureRowMaxWidth;

        return Row(
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: firstRowMaxWidth),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: imageSpacing,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: iconSize),
                    child: Image.network(item.condition.iconPath),
                  ),
                  Flexible(
                    child: Text(
                      item.date,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),

            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: conditionTextHPadding,
                      ),
                      child: Text(
                        item.condition.text,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: temperatureRowMaxWidth,
                    ),
                    child: DailyTemperatureRangeWidget(
                      maxTemp: item.maxTemp.toString(),
                      minTemp: item.minTemp.toString(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
