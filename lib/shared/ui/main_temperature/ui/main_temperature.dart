import 'package:flutter/material.dart';

import '../../../layout/scaled_child_box/index.dart';

class MainTemperature extends StatelessWidget {
  const MainTemperature({
    super.key,
    this.sizeRatio = 1,
    required this.temperature,
  });

  final int temperature;
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
              text: temperature.toString(),
              style: const TextStyle(
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
