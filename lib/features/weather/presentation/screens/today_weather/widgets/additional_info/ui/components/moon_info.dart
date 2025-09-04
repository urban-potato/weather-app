import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../../app/service_locator/service_locator.dart';
import '../../../../../../../../../shared/services/index.dart';
import '../../../../../../../../../shared/utils/size_helper/index.dart';
import '../../../../../../../shared/utils/assets_path_helper/index.dart';

class MoonInfoWidget extends StatelessWidget {
  const MoonInfoWidget({super.key, required this.moonPhase});

  final String moonPhase;

  @override
  Widget build(BuildContext context) {
    final moonPhaseAssetPath = getMoonPhaseAssetPath(moonPhase);

    return GestureDetector(
      onTap: () => sl<NavigationService>().pushMoonInfoRoute(context),

      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final constraintsMaxWidth = constraints.maxWidth;
          final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
          final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                spacing: spacing,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 3,
                    child: Text(
                      moonPhase,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
                      child: SvgPicture.asset(
                        moonPhaseAssetPath,
                        semanticsLabel: moonPhase,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                'More info...',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          );
        },
      ),
    );
  }
}
