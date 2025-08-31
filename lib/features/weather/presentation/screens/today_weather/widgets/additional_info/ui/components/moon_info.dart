import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../../../../../../shared/router/router.gr.dart';
import '../../../../../../../../../shared/utils/size_helper/index.dart';

class MoonInfoWidget extends StatelessWidget {
  const MoonInfoWidget({
    super.key,
    required this.phaseImagePath,
    required this.phase,
  });

  final String phaseImagePath;
  final String phase;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    return GestureDetector(
      onTap: () => context.router.push(const MoonInfoRoute()),

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
                      phase,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.clip,
                    ),
                  ),

                  Flexible(
                    flex: 1,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: iconSize),
                      child: Image.asset(phaseImagePath),
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
