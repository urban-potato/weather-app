import 'package:flutter/material.dart';

import '../../../shared/layout/card_tile/index.dart';
import '../../../shared/ui/responsive_info_list/index.dart';
import '../../../shared/ui/widget_title/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import '../../../shared/utils/get_moon_phase_image_path/index.dart';

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

class DayTile extends StatelessWidget {
  const DayTile({super.key, required this.data});

  final MoonData data;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: contentMaxWidth),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WidgetTitle(title: data.date),
          CardTile(child: _InfoWidgetsRow(data: data)),
        ],
      ),
    );
  }
}

class _InfoWidgetsRow extends StatelessWidget {
  const _InfoWidgetsRow({required this.data});

  final MoonData data;

  @override
  Widget build(BuildContext context) {
    final imagePath = getMoonPhaseImagePath(data.moonPhase);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final textAreaMaxWidth = constraintsMaxWidth * 0.5;
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 3.2);

        return Row(
          spacing: spacing,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Padding(
                padding: EdgeInsets.all(spacing),
                child: Center(child: Image.asset(imagePath)),
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
