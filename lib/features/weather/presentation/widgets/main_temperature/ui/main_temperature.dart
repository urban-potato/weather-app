import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '../../../../../../shared/ui/scaled_child_box/index.dart';
import '../../../../../../shared/ui/themed_text/index.dart';

class MainTemperatureWidget extends StatelessWidget {
  const MainTemperatureWidget({
    super.key,
    this.sizeRatio = 1,
    required this.temperature,
  });

  final String temperature;
  final double sizeRatio;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('MainTemperatureWidget build');

    return ScaledChildBox(
      height: 9 * sizeRatio,
      child: _ThemedRichText(temperature: temperature),
    );
  }
}

class _ThemedRichText extends StatelessWidget {
  const _ThemedRichText({required this.temperature});

  final String temperature;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('MainTemperatureWidget _ThemedRichText');

    return RichText(
      textHeightBehavior: const TextHeightBehavior(
        applyHeightToLastDescent: true,
        applyHeightToFirstAscent: false,
        leadingDistribution: TextLeadingDistribution.even,
      ),
      text: TextSpan(
        style: const TextStyle(height: 0.1),
        children: [
          TextSpan(
            text: temperature,
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontSize: 34, height: 0.1),
          ),
          WidgetSpan(
            child: Transform.translate(
              offset: const Offset(0, -24),
              child: const ThemedText(
                text: '°C',
                styleType: AppTextStyle.headlineMedium,
                fontSize: 12,
                height: 0.1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
