import 'package:flutter/material.dart';

import '../../../../../../shared/ui/scaled_child_box/index.dart';
import 'daily_temperature_range.dart';

class ScaledDailyTemperatureRangeWidget extends StatelessWidget {
  const ScaledDailyTemperatureRangeWidget({
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
      child: DailyTemperatureRangeWidget(
        maxTemp: maxTemp,
        minTemp: minTemp,
        spacing: 8,
      ),
    );
  }
}
