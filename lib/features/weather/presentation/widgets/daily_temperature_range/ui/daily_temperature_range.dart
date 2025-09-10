import 'package:flutter/material.dart';

import '../../../../../../shared/ui/themed_text/index.dart';

class DailyTemperatureRangeWidget extends StatelessWidget {
  const DailyTemperatureRangeWidget({
    super.key,
    required this.maxTemp,
    required this.minTemp,
    this.spacing = 0.0,
  });

  final String maxTemp;
  final String minTemp;
  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: spacing,
      children: [
        Flexible(child: _TemperatureValueText(temperature: maxTemp)),
        const ThemedText(text: '/', styleType: AppTextStyle.bodyMedium),
        Flexible(child: _TemperatureValueText(temperature: minTemp)),
      ],
    );
  }
}

class _TemperatureValueText extends StatelessWidget {
  const _TemperatureValueText({required this.temperature});

  final String temperature;

  @override
  Widget build(BuildContext context) {
    return ThemedText(
      text: '$temperature°',
      styleType: AppTextStyle.bodyMedium,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
    );
  }
}
