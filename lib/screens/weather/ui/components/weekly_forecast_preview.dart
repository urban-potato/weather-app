import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../shared/domain/models/weather.dart';
import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/ui/widget_title/index.dart';
import '../../../../shared/utils/adjustable_size/index.dart';

class WeeklyForecastPreviewItem {
  WeeklyForecastPreviewItem({
    required this.date,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
  });

  final String date;
  final WeatherConditionM condition;
  final int maxTemp;
  final int minTemp;
}

class WeekForecastPreview extends StatelessWidget {
  const WeekForecastPreview({super.key});

  @override
  Widget build(BuildContext context) {
    final data = [
      WeeklyForecastPreviewItem(
        date: 'Tomorrow',
        condition: const WeatherConditionM(
          text: 'Patchy rain nearby',
          iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/116.png',
        ),
        maxTemp: 20,
        minTemp: 14,
      ),
      WeeklyForecastPreviewItem(
        date: 'Mon',
        condition: const WeatherConditionM(
          text: 'Rain',
          iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/353.png',
        ),
        maxTemp: 16,
        minTemp: 12,
      ),
      WeeklyForecastPreviewItem(
        date: 'Tue',
        condition: const WeatherConditionM(
          text: 'Sunny',
          iconPath: 'https://cdn.weatherapi.com/weather/64x64/day/113.png',
        ),
        maxTemp: 22,
        minTemp: 16,
      ),
    ];

    final reducedData = data.take(3).toList();

    return GestureDetector(
      onTap: () => context.router.push(const WeekForecastRoute()),
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
                    child: _DailyTemperatureRangeWidget(
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

class _DailyTemperatureRangeWidget extends StatelessWidget {
  const _DailyTemperatureRangeWidget({
    required this.maxTemp,
    required this.minTemp,
  });

  final String maxTemp;
  final String minTemp;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.2);

        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: [
            Flexible(child: _TemperatureValueText(temperature: maxTemp)),
            Text('/', style: Theme.of(context).textTheme.bodyMedium),
            Flexible(child: _TemperatureValueText(temperature: minTemp)),
          ],
        );
      },
    );
  }
}

class _TemperatureValueText extends StatelessWidget {
  const _TemperatureValueText({required this.temperature});

  final String temperature;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$temperature°',
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
    );
  }
}
