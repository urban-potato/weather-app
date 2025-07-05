import 'package:flutter/material.dart';

import '../../../../shared/ui/basic_tile/index.dart';

class MainWeatherWidget extends StatelessWidget {
  const MainWeatherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    final widgetHeight = screenMinSide / 2;

    return SizedBox(
      height: widgetHeight,
      child: const FittedBox(
        child: Column(
          children: [
            _CurrentTemperature(),

            Column(
              spacing: 6,
              children: [
                _CurrentCondition(),
                _MaxMinTemperatureToday(),
                _CurrentAQI(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _CurrentAQI extends StatelessWidget {
  const _CurrentAQI();

  @override
  Widget build(BuildContext context) {
    return const BasicTile(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [
          Icon(Icons.local_florist),
          Row(spacing: 6, children: [Text('AQI'), Text('49')]),
        ],
      ),
    );
  }
}

class _MaxMinTemperatureToday extends StatelessWidget {
  const _MaxMinTemperatureToday();

  @override
  Widget build(BuildContext context) {
    return const Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _MaxMinTemperatureText(label: 'max', temperature: 32),
        Text('/'),
        _MaxMinTemperatureText(label: 'min', temperature: 16),
      ],
    );
  }
}

class _MaxMinTemperatureText extends StatelessWidget {
  const _MaxMinTemperatureText({
    required this.label,
    required this.temperature,
  });

  final String label;
  final int temperature;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return RichText(
      text: TextSpan(
        text: label,
        style: TextStyle(color: theme.hintColor, fontSize: 18, height: 1.0),
        children: [
          TextSpan(
            text: ' $temperature°',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _CurrentCondition extends StatelessWidget {
  const _CurrentCondition();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      spacing: 16,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text('Clear', style: TextStyle(fontSize: 24, height: 1.0)),
        Icon(Icons.sunny, size: 52, color: theme.primaryColorDark),
      ],
    );
  }
}

class _CurrentTemperature extends StatelessWidget {
  const _CurrentTemperature();

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(16, 0),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(height: 1.0),
          children: [
            const TextSpan(
              text: '30',
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
    );
  }
}
