import 'package:flutter/material.dart';

import '../../../../../../shared/ui/scaled_child_box/index.dart';

class DailyTemperatureRangeWidget extends StatelessWidget {
  const DailyTemperatureRangeWidget({
    super.key,
    required this.maxTemp,
    required this.minTemp,
    this.sizeRatio = 1,
  });

  final String maxTemp;
  final String minTemp;
  final double sizeRatio;

  @override
  Widget build(BuildContext context) {
    return ScaledChildBox(
      height: 6 * sizeRatio,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 8,
        children: [
          Flexible(child: _TemperatureValueText(temperature: maxTemp)),
          Text('/', style: Theme.of(context).textTheme.bodyMedium),
          Flexible(child: _TemperatureValueText(temperature: minTemp)),
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
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
        fontWeight: FontWeight.bold,
        height: 1.0,
      ),
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
    );
  }
}
