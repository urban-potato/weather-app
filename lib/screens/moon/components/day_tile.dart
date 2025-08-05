import 'package:flutter/material.dart';

import '../../../shared/layout/card_tile/index.dart';
import '../../../shared/layout/scaled_child_box/index.dart';
import '../../../shared/ui/responsive_info_list/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import '../utils/get_moon_phase_asset_path.dart';

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
    final tilesSpacing = ScreenBasedSize.instance.scaleByUnit(2.7);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: contentMaxWidth),

        child: Column(
          spacing: tilesSpacing,
          children: [
            _DateTile(date: data.date),
            _InfoWidgetsRow(data: data),
          ],
        ),
      ),
    );
  }
}

class _InfoWidgetsRow extends StatelessWidget {
  const _InfoWidgetsRow({required this.data});

  final MoonData data;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final tilesSpacing = contentMaxWidth / 2 / 17;
    final columnSpacing = ScreenBasedSize.instance.scaleByUnit(2);

    return Row(
      spacing: tilesSpacing,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(child: _MoonPhaseWidget(moonPhase: data.moonPhase)),
        Flexible(
          child: Column(
            spacing: columnSpacing,
            children: [
              ScaledChildBox(
                height: 6,
                child: Text(
                  data.moonPhase,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w700,
                    overflow: TextOverflow.clip,
                  ),
                ),
              ),
              CardTile(
                child: ResponsiveInfoList(
                  data: {
                    'Moonrise': data.moonrise,
                    'Moonset': data.moonset,
                    'Illumination': data.moonIllumination.toString(),
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MoonPhaseWidget extends StatelessWidget {
  const _MoonPhaseWidget({required this.moonPhase});

  final String moonPhase;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final image = getMoonPhaseAssetPath(moonPhase);
    final imageSize = ScreenBasedSize.instance.scaleByUnit(36);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: imageSize),
        child: Image.asset(image),
      ),
    );
  }
}

class _DateTile extends StatelessWidget {
  const _DateTile({required this.date});

  final String date;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final horizontalPadding = ScreenBasedSize.instance.scaleByUnit(1);
    final verticalPadding = ScreenBasedSize.instance.scaleByUnit(2);
    final fontSize = ScreenBasedSize.instance.scaleByUnit(3.2);

    return CardTile(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        date,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
