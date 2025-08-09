import 'package:flutter/material.dart';

import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/utils/adjustable_size/index.dart';

class ForecastDay {
  ForecastDay({
    required this.time,
    required this.icon,
    required this.tempetarute,
    required this.windSpeed,
  });

  final String time;
  final String icon;
  final int tempetarute;
  final double windSpeed;
}

class HourlyForecastWidget extends StatelessWidget {
  const HourlyForecastWidget({super.key, required this.data});

  final List<ForecastDay> data;

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
            itemBuilder: (context, index) =>
                _ForecastItemTile(day: data[index]),
            itemCount: data.length,
          ),
        ),
      ],
    );
  }
}

class _ForecastItemTile extends StatelessWidget {
  const _ForecastItemTile({required this.day});

  final ForecastDay day;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.scaleByUnit(4.8);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(2.4);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      child: FittedBox(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ForecastItemText(text: day.time, size: 16),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 32),
                child: Image.network(day.icon),
              ),
            ),
            _ForecastItemText(text: '${day.tempetarute}°', size: 18),
            _ForecastItemText(text: '${day.windSpeed} km/h'),
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
    final theme = Theme.of(context);

    return Text(
      'Hourly Forecast',
      style: theme.textTheme.titleMedium,
      overflow: TextOverflow.clip,
    );
  }
}
