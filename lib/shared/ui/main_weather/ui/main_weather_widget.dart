import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

import '../../../../shared/layout/scaled_child_box/index.dart';
import '../../../layout/card_tile/index.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({
    super.key,
    this.shouldShowAQI = false,
    this.currentTemperatureSize = 1,
  });

  final bool shouldShowAQI;
  final double currentTemperatureSize;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(2);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _CurrentTemperatureWidget(size: currentTemperatureSize),

        Column(
          spacing: spacing,
          children: [
            const _CurrentConditionWidget(),

            if (shouldShowAQI) _MinMaxTemperatureWithAQI(spacing: spacing),
            if (!shouldShowAQI) const _DailyTemperatureRangeWidget(),
          ],
        ),
      ],
    );
  }
}

class _MinMaxTemperatureWithAQI extends StatelessWidget {
  const _MinMaxTemperatureWithAQI({required this.spacing});

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: spacing,
      children: const [
        Flexible(child: _TileWrapper(child: _DailyTemperatureRangeWidget())),
        Flexible(child: _TileWrapper(child: _AQIInfoWidget())),
      ],
    );
  }
}

class _TileWrapper extends StatelessWidget {
  const _TileWrapper({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.scaleByUnit(2.5);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(1.9);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      child: child,
    );
  }
}

class _AQIInfoWidget extends StatelessWidget {
  const _AQIInfoWidget();

  @override
  Widget build(BuildContext context) {
    return const ScaledChildBox(
      height: 6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(Icons.local_florist),
          Row(
            spacing: 6,
            mainAxisSize: MainAxisSize.min,
            children: [Text('AQI'), Text('49')],
          ),
        ],
      ),
    );
  }
}

class _DailyTemperatureRangeWidget extends StatelessWidget {
  const _DailyTemperatureRangeWidget();

  @override
  Widget build(BuildContext context) {
    return const ScaledChildBox(
      height: 6,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(child: _TemperatureValueText(temperature: '32')),
          Text('/'),
          Flexible(child: _TemperatureValueText(temperature: '16')),
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
  const _CurrentConditionWidget();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 11);
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 3);

        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                'Clear',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.0,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),
            Icon(Icons.sunny, size: iconSize, color: theme.primaryColorDark),
          ],
        );
      },
    );
  }
}

class _CurrentTemperatureWidget extends StatelessWidget {
  const _CurrentTemperatureWidget({required this.size});

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
              const TextSpan(
                text: '35',
                style: TextStyle(
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
