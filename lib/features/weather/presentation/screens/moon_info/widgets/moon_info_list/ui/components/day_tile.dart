import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../../shared/presentation/ui/card_tile/index.dart';
import '../../../../../../models/index.dart' show MoonModelUI;
import '../../../../../../shared/ui/responsive_info_list/index.dart';
import '../../../../../../shared/ui/widget_title/index.dart';
import '../../../../../../shared/utils/assets_path_helper/index.dart';
import '../../../../../../shared/utils/date_time_formatting_helper/index.dart';
import '../../utils/moon_time_formatter.dart';

class DayTileWidget extends StatelessWidget {
  const DayTileWidget({super.key, required this.data});

  final MoonModelUI data;

  @override
  Widget build(BuildContext context) {
    final date = getFormattedDate(data.date);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        WidgetTitle(title: date),
        CardTile(child: _InfoWidgetsRow(data: data)),
      ],
    );
  }
}

class _InfoWidgetsRow extends ConsumerWidget {
  const _InfoWidgetsRow({required this.data});

  final MoonModelUI data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = context.read<Talker>();
    talker.info('DayTileWidget _InfoWidgetsRow build');

    final moonPhaseAssetPath = getMoonPhaseAssetPath(data.phase);
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final textAreaMaxWidth = constraintsMaxWidth * 0.57;
        final spacing = sizeService.percentageOf(constraintsMaxWidth, 3.2);

        talker.info('DayTileWidget _InfoWidgetsRow LayoutBuilder 1');

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

                          talker.info(
                            'DayTileWidget _InfoWidgetsRow LayoutBuilder 2',
                          );

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
                  'Phase': data.phase,
                  'Moonrise': getFormattedMoonTime(
                    dateTime: data.moonrise,
                    ifMoonrise: true,
                  ),
                  'Moonset': getFormattedMoonTime(
                    dateTime: data.moonset,
                    ifMoonrise: false,
                  ),
                  'Illumination': '${data.illumination}%',
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
