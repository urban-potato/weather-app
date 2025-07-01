import 'package:flutter/material.dart';

import 'widgets/additional_information_tile.dart';
import 'widgets/hourly_forecast_tile.dart';
import 'widgets/main_weather_widget.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: const Text(
            'Krasnoyarsk',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          // backgroundColor: theme.appBarTheme.foregroundColor,
          backgroundColor: Colors.transparent,
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.menu))],
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 82),
          sliver: SliverToBoxAdapter(child: MainWeatherWidget()),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          sliver: SliverToBoxAdapter(child: HourlyForecastTile()),
        ),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          sliver: SliverToBoxAdapter(child: AdditionalInformationTile()),
        ),
      ],
    );
  }
}
