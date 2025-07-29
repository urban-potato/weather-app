import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

import '../../../../shared/layout/card_tile/index.dart';

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final scrollableAreaHeight = ScreenBasedSize.instance.scaleByUnit(35.5);
    final separatorWidth = ScreenBasedSize.instance.scaleByUnit(2.4);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _WidgetTitle(),

        SizedBox(
          height: scrollableAreaHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: separatorWidth),
            itemBuilder: (context, index) => const _ForecastItemTile(),
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}

class _ForecastItemTile extends StatelessWidget {
  const _ForecastItemTile();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final theme = Theme.of(context);

    final hPadding = ScreenBasedSize.instance.scaleByUnit(4.8);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(2.4);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      child: FittedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const _ForecastItemText(text: '15:00', size: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Icon(Icons.cloud, color: theme.primaryColorDark, size: 32),
            ),
            const _ForecastItemText(text: '25°', size: 18),
            const _ForecastItemText(text: '16.7 km/h'),
          ],
        ),
      ),
    );
  }
}

class _ForecastItemText extends StatelessWidget {
  const _ForecastItemText({required this.text, this.size = 14});

  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        overflow: TextOverflow.clip,
        fontSize: size,
      ),
    );
  }
}

class _WidgetTitle extends StatelessWidget {
  const _WidgetTitle();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final fontSize = ScreenBasedSize.instance.scaleByUnit(6);

    return Text(
      'Hourly Forecast',
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      overflow: TextOverflow.clip,
    );
  }
}
