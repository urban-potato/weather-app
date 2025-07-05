import 'package:flutter/material.dart';

import 'package:weather_app/shared/lib/layout/index.dart';
import '../../../../shared/ui/basic_tile/index.dart';

class AdditionalInformationTile extends StatelessWidget {
  const AdditionalInformationTile({super.key});

  @override
  Widget build(BuildContext context) {
    final isDeviceVertical =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height;
    final screenMinSide = isDeviceVertical
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    final screenSidesPadding = calculateScreenSidesPadding(
      screenMinSide: screenMinSide,
    );

    final additionalInformationAreaMaxWidth =
        screenMinSide - (screenSidesPadding * 2);
    final additionalInformationTilesSpacing =
        additionalInformationAreaMaxWidth / 2 / 17;

    final smallTilesHorizontalPadding =
        additionalInformationAreaMaxWidth / 47.75;
    final smallTilesVerticalPadding = additionalInformationAreaMaxWidth / 31.8;

    final bigTileHorizontalPadding = additionalInformationAreaMaxWidth / 23.88;
    final bigTileVerticalPadding = additionalInformationAreaMaxWidth / 31.8;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Information',
          style: TextStyle(
            fontSize: screenMinSide / 16.5,
            fontWeight: FontWeight.bold,
          ),
        ),

        Center(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: additionalInformationAreaMaxWidth,
            ),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: additionalInformationTilesSpacing,
              children: [
                Flexible(
                  child: Column(
                    spacing: additionalInformationTilesSpacing,
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
        final unitContainerWidth = constraints.maxWidth * 0.01;
        final fontSize = unitContainerWidth * 10;
        const fontHeight = 1.5;
        final iconSize = unitContainerWidth * 20;

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
        final unitContainerWidth = constraints.maxWidth * 0.01;
        final fontSize = unitContainerWidth * 10;
        const fontHeight = 1.5;
        final iconSize = unitContainerWidth * 20;

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
