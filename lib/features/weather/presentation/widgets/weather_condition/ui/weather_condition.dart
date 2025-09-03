import 'package:flutter/material.dart';

import '../../../../../../shared/utils/size_helper/index.dart';
import '../../../models/index.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({
    super.key,
    this.sizeRatio = 1,
    required this.condition,
  });

  final double sizeRatio;
  final ConditionModelUI condition;

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
                condition.text,
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
              child: Image.asset(
                condition.assetIconPath ?? '',
                errorBuilder: (context, error, stackTrace) => Image.network(
                  condition.networkIconPath,
                  errorBuilder: (context, error, stackTrace) =>
                      const SizedBox(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
