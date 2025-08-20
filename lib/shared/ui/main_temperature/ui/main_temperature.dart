import 'package:flutter/material.dart';

import '../../../layout/scaled_child_box/index.dart';

class MainTemperature extends StatelessWidget {
  const MainTemperature({
    super.key,
    this.sizeRatio = 1,
    required this.temperature,
  });

  final String temperature;
  final double sizeRatio;

  @override
  Widget build(BuildContext context) {
    return ScaledChildBox(
      height: 9 * sizeRatio,
      child: RichText(
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
                child: Text(
                  '°C',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontSize: 12,
                    height: 0.1,
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
