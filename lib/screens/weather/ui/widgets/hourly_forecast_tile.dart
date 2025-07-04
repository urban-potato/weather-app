import 'package:flutter/material.dart';

import '../../../../shared/ui/basic_tile/index.dart';

class HourlyForecastTile extends StatelessWidget {
  const HourlyForecastTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    final scrollableAreaHeight = screenMinSide / 2.8;
    final tilesSeparatorWidth = scrollableAreaHeight / 15;
    final tileHorizontalPadding = scrollableAreaHeight / 7.35;
    final tileVerticalPadding = scrollableAreaHeight / 14.7;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hourly Forecast',
          style: TextStyle(
            fontSize: screenMinSide / 16.5,
            fontWeight: FontWeight.bold,
          ),
        ),

        SizedBox(
          height: scrollableAreaHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) =>
                SizedBox(width: tilesSeparatorWidth),
            itemBuilder: (context, index) => BasicTile(
              padding: EdgeInsets.symmetric(
                vertical: tileVerticalPadding,
                horizontal: tileHorizontalPadding,
              ),
              child: FittedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '15:00',
                      style: _hourlyForecastTextStyle().copyWith(fontSize: 16),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Icon(
                        Icons.cloud,
                        color: theme.primaryColorDark,
                        size: 32,
                      ),
                    ),
                    Text(
                      '25°',
                      style: _hourlyForecastTextStyle().copyWith(fontSize: 18),
                    ),
                    Text('16.7 km/h', style: _hourlyForecastTextStyle()),
                  ],
                ),
              ),
            ),
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  TextStyle _hourlyForecastTextStyle() =>
      const TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
}
