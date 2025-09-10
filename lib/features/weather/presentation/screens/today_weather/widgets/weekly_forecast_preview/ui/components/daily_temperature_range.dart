import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '../../../../../../../../../shared/ui/themed_text/index.dart';
import '../../../../../../../../../shared/utils/size_helper/index.dart';

class DailyTemperatureRangeWidget extends StatelessWidget {
  const DailyTemperatureRangeWidget({
    super.key,
    required this.maxTemp,
    required this.minTemp,
  });

  final String maxTemp;
  final String minTemp;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('DailyTemperatureRangeWidget build');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.2);

        if (kDebugMode) print('DailyTemperatureRangeWidget LayoutBuilder');

        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: [
            Flexible(child: _TemperatureValueText(temperature: maxTemp)),
            const ThemedText(text: '/', styleType: AppTextStyle.bodyMedium),
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
    if (kDebugMode) print('DailyTemperatureRangeWidget _TemperatureValueText');

    return ThemedText(
      text: '$temperature°',
      styleType: AppTextStyle.bodyMedium,
      fontWeight: FontWeight.bold,
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
    );
  }
}
