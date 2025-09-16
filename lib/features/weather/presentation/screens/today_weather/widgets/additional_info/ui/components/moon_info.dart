import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../../shared/providers/index.dart'
    show navigationServiceProvider;
import '../../../../../../../../../shared/ui/themed_text/index.dart';
import '../../../../../../../../../shared/utils/size_helper/index.dart';
import '../../../../../../../shared/utils/assets_path_helper/index.dart';

class MoonInfoWidget extends ConsumerWidget {
  const MoonInfoWidget({super.key, required this.moonPhase});

  final String moonPhase;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moonPhaseAssetPath = getMoonPhaseAssetPath(moonPhase);
    final navigationService = ref.read(navigationServiceProvider);

    if (kDebugMode) print('MoonInfoWidget build');

    return GestureDetector(
      onTap: () => navigationService.pushMoonInfoRoute(context),

      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final constraintsMaxWidth = constraints.maxWidth;
          final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
          final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

          if (kDebugMode) print('MoonInfoWidget LayoutBuilder');

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                spacing: spacing,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: ThemedText(
                      text: moonPhase,
                      styleType: AppTextStyle.bodyMedium,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.clip,
                    ),
                  ),

                  Flexible(
                    flex: 1,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: iconSize,
                        maxHeight: iconSize,
                      ),
                      child: moonPhaseAssetPath != null
                          ? SvgPicture.asset(
                              moonPhaseAssetPath,
                              excludeFromSemantics: true,
                            )
                          : const Icon(CupertinoIcons.moon),
                    ),
                  ),
                ],
              ),
              const ThemedText(
                text: 'More info...',
                styleType: AppTextStyle.bodySmall,
                textAlign: TextAlign.center,
              ),
            ],
          );
        },
      ),
    );
  }
}
