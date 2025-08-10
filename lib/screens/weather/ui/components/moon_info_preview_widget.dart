import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../../app/router/router.gr.dart';
import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/ui/widget_title/index.dart';
import '../../../../shared/utils/adjustable_size/index.dart';

class MoonInfoItem {
  MoonInfoItem({
    required this.date,
    required this.phaseImagePath,
    required this.phase,
  });

  final String date;
  final String phaseImagePath;
  final String phase;
}

class MoonInfoPreviewWidget extends StatelessWidget {
  const MoonInfoPreviewWidget({super.key, required this.data});

  final List<MoonInfoItem> data;

  @override
  Widget build(BuildContext context) {
    final reducedData = data.take(3).toList();
    ScreenBasedSize.instance.init;
    final fontSize = ScreenBasedSize.instance.scaleByUnit(3.5);

    return GestureDetector(
      onTap: () => context.router.push(const MoonInfoRoute()),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WidgetTitle(title: 'Moon Info'),

          CardTile(
            child: Column(
              children: [
                ...reducedData.map((e) => _InfoRow(item: e)),
                Text(
                  'More info...',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: fontSize, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({required this.item});

  final MoonInfoItem item;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 4.1);
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 10);

        final imageSpacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 2);

        final temperatureRowMaxWidth = constraintsMaxWidth * 0.5;
        final firstRowMaxWidth = constraintsMaxWidth - temperatureRowMaxWidth;

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: firstRowMaxWidth),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: imageSpacing,
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(maxWidth: iconSize),
                    child: Image.asset(item.phaseImagePath),
                  ),
                  Flexible(
                    child: Text(
                      item.date,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: fontSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(maxWidth: temperatureRowMaxWidth),
              child: Text(
                item.phase,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: 1.0,
                  overflow: TextOverflow.clip,
                  fontSize: fontSize,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
      },
    );
  }
}
