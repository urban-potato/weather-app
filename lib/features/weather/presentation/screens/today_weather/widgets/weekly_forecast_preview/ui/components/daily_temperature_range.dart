import 'package:flutter/material.dart';

import '../../../../../../../../../shared/utils/size_helpers/index.dart';

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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.2);

        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          children: [
            Flexible(child: _TemperatureValueText(temperature: maxTemp)),
            Text('/', style: Theme.of(context).textTheme.bodyMedium),
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
    return Text(
      '$temperature°',
      style: Theme.of(
        context,
      ).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
      overflow: TextOverflow.clip,
      textAlign: TextAlign.center,
    );
  }
}
