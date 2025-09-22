import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../../shared/presentation/ui/themed_text/index.dart';

class WindInfoWidget extends ConsumerWidget {
  const WindInfoWidget({
    super.key,
    required this.windDirection,
    required this.windSpeed,
  });

  final String windDirection;
  final String windSpeed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) print('WindInfoWidget build');
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final iconSize = sizeService.percentageOf(constraintsMaxWidth, 20);
        final spacing = sizeService.percentageOf(constraintsMaxWidth, 1.9);

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
