import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

import '../../../../shared/ui/basic_tile/index.dart';

class AdditionalInformationTile extends StatelessWidget {
  const AdditionalInformationTile({super.key});

  @override
  Widget build(BuildContext context) {
    AdjustableSize.instance.init(context);

    final contentMaxWidth = AdjustableSize.instance.getContentMaxWidth();
    final tilesSpacing = contentMaxWidth / 2 / 17;

    final smallTilesHorizontalPadding = contentMaxWidth / 47.75;
    final smallTilesVerticalPadding = contentMaxWidth / 31.8;

    final bigTileHorizontalPadding = contentMaxWidth / 23.88;
    final bigTileVerticalPadding = contentMaxWidth / 31.8;

    final fontSize = AdjustableSize.instance.scaleByScreen(16.5);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Information',
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
        ),

        Center(
          child: Container(
            constraints: BoxConstraints(maxWidth: contentMaxWidth),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: tilesSpacing,
              children: [
                Flexible(
                  child: Column(
                    spacing: tilesSpacing,
                    children: [
                      BasicTile(
                        padding: EdgeInsets.symmetric(
                          horizontal: smallTilesHorizontalPadding,
                          vertical: smallTilesVerticalPadding,
                        ),
                        child: const _AdditionalInformationWindTile(),
                      ),
                      BasicTile(
                        padding: EdgeInsets.symmetric(
                          horizontal: smallTilesHorizontalPadding,
                          vertical: smallTilesVerticalPadding,
                        ),
                        child: const _AdditionalInformationSunTile(),
                      ),
                    ],
                  ),
                ),

                Flexible(
                  child: BasicTile(
                    padding: EdgeInsets.symmetric(
                      horizontal: bigTileHorizontalPadding,
                      vertical: bigTileVerticalPadding,
                    ),
                    child: const _AdditionalInformationBigTile(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _AdditionalInformationBigTile extends StatelessWidget {
  const _AdditionalInformationBigTile();

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _AdditionalInformationBigTileRow(label: 'Feels like', value: '28°'),
        _AdditionalInformationBigTileRow(label: 'Humidity', value: '40%'),
        _AdditionalInformationBigTileRow(label: 'Chance of rain', value: '27%'),
        _AdditionalInformationBigTileRow(label: 'Pressure', value: '1001 mbar'),
        _AdditionalInformationBigTileRow(label: 'UV', value: '1'),
        _AdditionalInformationBigTileRow(label: 'Visibility', value: '10 km'),
      ],
    );
  }
}

class _AdditionalInformationBigTileRow extends StatelessWidget {
  const _AdditionalInformationBigTileRow({
    required this.label,
    required this.value,
  });

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        final unitContainerWidth = constraints.maxWidth * 0.01;
        final dividerHeight = constraints.maxWidth / 10.23;
        final fontSize = unitContainerWidth * 9.5;

        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(label, style: TextStyle(fontSize: fontSize)),
                Text(
                  value,
                  style: TextStyle(
                    fontSize: fontSize,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            Divider(height: dividerHeight),
          ],
        );
      },
    );
  }
}

class _AdditionalInformationSunTile extends StatelessWidget {
  const _AdditionalInformationSunTile();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        AdjustableSize.instance.init(context);

        final tileMaxWidth = constraints.maxWidth;
        const fontHeight = 1.5;
        final fontSize = AdjustableSize.instance.scaleByUnit(tileMaxWidth, 10);
        final iconSize = AdjustableSize.instance.scaleByUnit(tileMaxWidth, 20);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: '04:02',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      height: fontHeight,
                      fontSize: fontSize,
                    ),
                    children: const [
                      TextSpan(
                        text: ' Sunrize',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: '21:39',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      height: fontHeight,
                      fontSize: fontSize,
                    ),
                    children: const [
                      TextSpan(
                        text: ' Sunset',
                        style: TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Icon(Icons.wb_sunny_outlined, size: iconSize),
          ],
        );
      },
    );
  }
}

class _AdditionalInformationWindTile extends StatelessWidget {
  const _AdditionalInformationWindTile();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        AdjustableSize.instance.init(context);

        final tileMaxWidth = constraints.maxWidth;
        const fontHeight = 1.5;
        final fontSize = AdjustableSize.instance.scaleByUnit(tileMaxWidth, 10);
        final iconSize = AdjustableSize.instance.scaleByUnit(tileMaxWidth, 20);

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Southwest',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: fontHeight,
                    fontSize: fontSize,
                  ),
                ),
                Text(
                  '20.9 km/h',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    height: fontHeight,
                    fontSize: fontSize,
                  ),
                ),
              ],
            ),

            Icon(Icons.air, size: iconSize),
          ],
        );
      },
    );
  }
}
