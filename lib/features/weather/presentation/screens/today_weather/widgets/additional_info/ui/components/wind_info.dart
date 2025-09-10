import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '../../../../../../../../../shared/ui/themed_text/index.dart';
import '../../../../../../../../../shared/utils/size_helper/index.dart';

class WindInfoWidget extends StatelessWidget {
  const WindInfoWidget({
    super.key,
    required this.windDirection,
    required this.windSpeed,
  });

  final String windDirection;
  final String windSpeed;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('WindInfoWidget build');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

        if (kDebugMode) print('WindInfoWidget LayoutBuilder');

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
                  ThemedText(
                    text: windDirection,
                    styleType: AppTextStyle.bodyMedium,
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.clip,
                  ),
                  ThemedText(
                    text: windSpeed,
                    styleType: AppTextStyle.bodyMedium,
                    fontWeight: FontWeight.bold,
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
