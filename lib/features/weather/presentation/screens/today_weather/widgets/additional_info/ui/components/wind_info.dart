import 'package:flutter/material.dart';

import '../../../../../../../../../shared/utils/size_helpers/index.dart';

class WindInfoWidget extends StatelessWidget {
  const WindInfoWidget({
    super.key,
    required this.windDirection,
    required this.windSpeed,
  });

  final String windDirection;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

        return Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    windDirection,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                  Text(
                    '$windSpeed km/h',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ],
              ),
            ),

            Flexible(flex: 1, child: Icon(Icons.air, size: iconSize)),
          ],
        );
      },
    );
  }
}
