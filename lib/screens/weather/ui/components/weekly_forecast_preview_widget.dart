import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/ui/main_weather/index.dart';
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
  final WeatherCondition condition;
  final int maxTemp;
  final int minTemp;
}

class WeekForecastPreviewWidget extends StatelessWidget {
  const WeekForecastPreviewWidget({super.key, required this.data});

  final List<WeeklyForecastPreviewItem> data;

  @override
  Widget build(BuildContext context) {
    final reducedData = data.take(3).toList();
    ScreenBasedSize.instance.init;
    final fontSize = ScreenBasedSize.instance.scaleByUnit(3.5);

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
                  style: TextStyle(fontSize: fontSize, color: Colors.grey[700]),
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
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 4.1);
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
                    child: Image.network(item.condition.icon),
                  ),
                  Flexible(
                    child: Text(
                      item.date,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
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
                        style: TextStyle(fontSize: fontSize),
                      ),
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: temperatureRowMaxWidth,
                    ),
                    child: _MaxMinTempWidget(item: item, fontSize: fontSize),
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

class _MaxMinTempWidget extends StatelessWidget {
  const _MaxMinTempWidget({required this.item, required this.fontSize});

  final WeeklyForecastPreviewItem item;
  final double fontSize;

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
            Flexible(
              child: _TemperatureValueText(
                temperature: item.maxTemp.toString(),
                fontSize: fontSize,
              ),
            ),
            Text('/', style: TextStyle(fontSize: fontSize)),
            Flexible(
              child: _TemperatureValueText(
                temperature: item.minTemp.toString(),
                fontSize: fontSize,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _TemperatureValueText extends StatelessWidget {
  const _TemperatureValueText({
    required this.temperature,
    required this.fontSize,
  });

  final String temperature;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      '$temperature°',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        height: 1.0,
        overflow: TextOverflow.clip,
        fontSize: fontSize,
      ),
      textAlign: TextAlign.center,
    );
  }
}
