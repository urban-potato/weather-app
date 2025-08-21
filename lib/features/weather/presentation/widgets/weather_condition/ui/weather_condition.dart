import 'package:flutter/material.dart';

import '../../../../../../shared/utils/size_helpers/index.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({
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
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  fontSize:
                      ((Theme.of(context).textTheme.labelLarge?.fontSize ?? 1) *
                              sizeRatio)
                          .round()
                          .toDouble(),
                ),
                overflow: TextOverflow.clip,
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
