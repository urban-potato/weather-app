import 'package:flutter/material.dart';

import '../../../../shared/layout/scaled_child_box/index.dart';
import '../../../layout/card_tile/index.dart';
import '../../../utils/adjustable_size/index.dart';

class MainWeatherWidgetData {
  MainWeatherWidgetData({
    required this.temperature,
    required this.condition,
    required this.maxTemp,
    required this.minTemp,
    this.aqi,
  });

  final int temperature;
  final WeatherCondition condition;
  final int maxTemp;
  final int minTemp;
  final int? aqi;
}

class WeatherCondition {
  WeatherCondition({required this.text, required this.icon});

  final String text;
  final String icon;
}

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({
    super.key,
    this.currentTemperatureSize = 1,
    required this.data,
  });

  final MainWeatherWidgetData data;
  final double currentTemperatureSize;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _CurrentTemperatureWidget(
          size: currentTemperatureSize,
          temperature: data.temperature,
        ),

        Column(
          spacing: spacing,
          children: [
            _CurrentConditionWidget(condition: data.condition),

            if (data.aqi != null)
              _MinMaxTemperatureWithAQI(
                aqi: data.aqi!,
                maxTemp: data.maxTemp,
                minTemp: data.minTemp,
              ),
            if (data.aqi == null)
              _DailyTemperatureRangeWidget(
                maxTemp: data.maxTemp,
                minTemp: data.minTemp,
              ),
          ],
        ),
      ],
    );
  }
}

class _AQIInfoTile extends StatelessWidget {
  const _AQIInfoTile({required this.aqi});

  final int aqi;

  @override
  Widget build(BuildContext context) {
    final tileCOlor = aqi < 101
        ? Colors.green
        : aqi < 161
        ? Colors.amber
        : aqi < 241
        ? Colors.red
        : Colors.black;

    return _TileWrapper(
      color: tileCOlor,
      child: ScaledChildBox(
        height: 6,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            const Icon(Icons.local_florist, color: Colors.white),
            Row(
              spacing: 6,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'AQI',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  aqi.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _MinMaxTemperatureWithAQI extends StatelessWidget {
  const _MinMaxTemperatureWithAQI({
    required this.maxTemp,
    required this.minTemp,
    required this.aqi,
  });

  final int maxTemp;
  final int minTemp;
  final int aqi;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(2);

    return Row(
      spacing: spacing,
      children: [
        Flexible(
          child: _TileWrapper(
            child: _DailyTemperatureRangeWidget(
              maxTemp: maxTemp,
              minTemp: minTemp,
            ),
          ),
        ),
        Flexible(child: _AQIInfoTile(aqi: aqi)),
      ],
    );
  }
}

class _TileWrapper extends StatelessWidget {
  const _TileWrapper({required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.scaleByUnit(2.5);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(1.9);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      color: color,
      child: child,
    );
  }
}

class _DailyTemperatureRangeWidget extends StatelessWidget {
  const _DailyTemperatureRangeWidget({
    required this.maxTemp,
    required this.minTemp,
  });

  final int maxTemp;
  final int minTemp;

  @override
  Widget build(BuildContext context) {
    return ScaledChildBox(
      height: 6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: _TemperatureValueText(temperature: maxTemp.toString()),
          ),
          const Text('/'),
          Flexible(
            child: _TemperatureValueText(temperature: minTemp.toString()),
          ),
        ],
      ),
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
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        height: 1.0,
        overflow: TextOverflow.clip,
      ),
      textAlign: TextAlign.center,
    );
  }
}

class _CurrentConditionWidget extends StatelessWidget {
  const _CurrentConditionWidget({required this.condition});

  final WeatherCondition condition;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 11);
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 25);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 3);

        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                condition.text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.0,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: iconSize),
              child: Image.network(condition.icon),
            ),
          ],
        );
      },
    );
  }
}

class _CurrentTemperatureWidget extends StatelessWidget {
  const _CurrentTemperatureWidget({
    required this.size,
    required this.temperature,
  });

  final int temperature;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ScaledChildBox(
      height: 15 * size,
      child: Transform.translate(
        offset: const Offset(16, 0),
        child: RichText(
          text: TextSpan(
            style: const TextStyle(height: 1.0),
            children: [
              TextSpan(
                text: temperature.toString(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 102,
                  fontWeight: FontWeight.w600,
                ),
              ),
              WidgetSpan(
                child: Transform.translate(
                  offset: const Offset(0, -48),
                  child: const Text(
                    '°C',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
