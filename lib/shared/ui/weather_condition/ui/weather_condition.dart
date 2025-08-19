import 'package:flutter/material.dart';

import '../../../utils/adjustable_size/index.dart';

class WeatherCondition extends StatelessWidget {
  const WeatherCondition({
    super.key,
    this.sizeRatio = 1,
    required this.text,
    required this.iconPath,
  });

  final String text;
  final String iconPath;
  final double sizeRatio;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(
          constraintsMaxWidth,
          10 * sizeRatio,
        );
        final iconSize = AdjustableSize.scaleByUnit(
          constraintsMaxWidth,
          22 * sizeRatio,
        );
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 3);

        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: fontSize,
                  height: 1.0,
                  overflow: TextOverflow.clip,
                ),
              ),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: iconSize),
              child: Image.network(iconPath),
            ),
          ],
        );
      },
    );
  }
}
