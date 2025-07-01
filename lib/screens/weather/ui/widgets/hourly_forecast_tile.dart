import 'package:flutter/material.dart';

import '../../../../shared/ui/basic_tile/index.dart';

class HourlyForecastTile extends StatelessWidget {
  const HourlyForecastTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hourly Forecast',
          style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 150,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(width: 10),
            itemBuilder: (context, index) => BasicTile(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Column(
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
            itemCount: 10,
          ),
        ),
      ],
    );
  }

  TextStyle _hourlyForecastTextStyle() =>
      TextStyle(fontWeight: FontWeight.w600, fontSize: 14);
}
