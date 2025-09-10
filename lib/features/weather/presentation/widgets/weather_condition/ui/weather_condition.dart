import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '../../../../../../shared/ui/themed_text/index.dart';
import '../../../../../../shared/utils/size_helper/index.dart';
import '../../../../shared/ui/image_asset_with_network_fallback/index.dart';
import '../../../models/index.dart';

class WeatherConditionWidget extends StatelessWidget {
  const WeatherConditionWidget({
    super.key,
    this.sizeRatio,
    required this.condition,
  });

  final double? sizeRatio;
  final ConditionModelUI condition;

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('WeatherConditionWidget build');

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconSize = AdjustableSize.scaleByUnit(
          constraintsMaxWidth,
          22 * (sizeRatio ?? 1),
        );
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 3);

        if (kDebugMode) print('WeatherConditionWidget LayoutBuilder');

        return Row(
          mainAxisSize: MainAxisSize.min,
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: ThemedText(
                text: condition.text,
                styleType: AppTextStyle.labelLarge,
                overflow: TextOverflow.clip,
                fontSizeRatio: sizeRatio,
              ),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: iconSize),
              child: ImageAssetWithNetworkFallback(
                assetPath: condition.assetIconPath,
                networkPath: condition.networkIconPath,
              ),
            ),
          ],
        );
      },
    );
  }
}
