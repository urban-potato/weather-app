import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

import '../../../../shared/layout/card_tile/index.dart';
import '../../../../shared/ui/extra_weather_info/index.dart';
import '../../../../shared/ui/sun_info/index.dart';

class AdditionalInformationTile extends StatelessWidget {
  const AdditionalInformationTile({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final contentMaxWidth = ScreenBasedSize.instance.getContentMaxWidth();
    final tilesSpacing = ScreenBasedSize.instance.scaleByUnit(2.7);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _WidgetTitle(),

        Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: contentMaxWidth),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: tilesSpacing,
              children: [
                Flexible(
                  child: Column(
                    spacing: tilesSpacing,
                    children: const [
                      CardTile(
                        child: _WindInfoWidget(
                          windDirection: 'Southwest',
                          windSpeed: 20.9,
                        ),
                      ),

                      CardTile(child: SunInfoWidget()),
                    ],
                  ),
                ),

                const Flexible(
                  child: CardTile(child: ExtraWeatherInfoWidget()),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _WidgetTitle extends StatelessWidget {
  const _WidgetTitle();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final fontSize = ScreenBasedSize.instance.scaleByUnit(6);

    return Text(
      'Additional Information',
      style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
      overflow: TextOverflow.clip,
    );
  }
}

class _WindInfoWidget extends StatelessWidget {
  const _WindInfoWidget({required this.windDirection, required this.windSpeed});

  final String windDirection;
  final double windSpeed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final constraintsMaxWidth = constraints.maxWidth;
        final fontSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 10.5);
        final iconSize = AdjustableSize.scaleByUnit(constraintsMaxWidth, 20);
        final spacing = AdjustableSize.scaleByUnit(constraintsMaxWidth, 1.9);

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
                  Text(
                    windDirection,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Text(
                    '$windSpeed km/h',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: fontSize,
                      overflow: TextOverflow.clip,
                    ),
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
