import 'package:flutter/material.dart';

import '../../../layout/scaled_child_box/index.dart';

class DailyTemperatureRange extends StatelessWidget {
  const DailyTemperatureRange({
    super.key,
    required this.maxTemp,
    required this.minTemp,
    this.sizeRatio = 1,
  });

  final int maxTemp;
  final int minTemp;
  final double sizeRatio;

  @override
  Widget build(BuildContext context) {
    return ScaledChildBox(
      height: 6 * sizeRatio,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
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
        fontWeight: FontWeight.bold,
        height: 1.0,
        overflow: TextOverflow.clip,
      ),
      textAlign: TextAlign.center,
    );
  }
}
