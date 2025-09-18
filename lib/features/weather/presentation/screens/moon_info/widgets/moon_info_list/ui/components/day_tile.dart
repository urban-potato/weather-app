import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../../../../shared/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../../shared/ui/card_tile/index.dart';
import '../../../../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../../../../shared/ui/widget_title/index.dart';
import '../../../../../../../shared/utils/assets_path_helper/index.dart';

class MoonData {
  MoonData({
    required this.date,
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  final String date;
  final String moonrise;
  final String moonset;
  final String moonPhase;
  final int moonIllumination;
}

class DayTileWidget extends StatelessWidget {
  const DayTileWidget({super.key, required this.data});

  final MoonData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(title: data.date),
        CardTile(child: _InfoWidgetsRow(data: data)),
      ],
    );
  }
}

class _InfoWidgetsRow extends ConsumerWidget {
  const _InfoWidgetsRow({required this.data});

  final MoonData data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moonPhaseAssetPath = getMoonPhaseAssetPath(data.moonPhase);
    final sizeService = ref.read(responsiveSizeServiceProvider);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final textAreaMaxWidth = constraintsMaxWidth * 0.5;
        final spacing = sizeService.percentageOf(constraintsMaxWidth, 3.2);

        if (kDebugMode) print('LayoutBuilder DayTileWidget 1');

        return Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(spacing),
                child: Center(
                  child: LayoutBuilder(
                    builder:
                        (BuildContext context, BoxConstraints constraints) {
                          final constraintsMaxWidth = constraints.maxWidth;

                          if (kDebugMode)
                            print('LayoutBuilder DayTileWidget 2');

                          return ConstrainedBox(
                            constraints: BoxConstraints(
                              maxWidth: constraintsMaxWidth,
                              maxHeight: constraintsMaxWidth,
                            ),
                            child: moonPhaseAssetPath != null
                                ? SvgPicture.asset(
                                    moonPhaseAssetPath,
                                    excludeFromSemantics: true,
                                  )
                                : const Icon(CupertinoIcons.moon),
                          );
                        },
                  ),
                ),
              ),
            ),

            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: textAreaMaxWidth),
              child: ResponsiveInfoList(
                data: {
                  'Moon phase': data.moonPhase,
                  'Moonrise': data.moonrise,
                  'Moonset': data.moonset,
                  'Illumination': data.moonIllumination.toString(),
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
