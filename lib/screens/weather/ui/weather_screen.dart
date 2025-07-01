import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import 'widgets/additional_information_tile.dart';
import 'widgets/hourly_forecast_tile.dart';
import 'widgets/main_weather_widget.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverAppBar(locationName: 'Krasnoyarsk'),
        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 82),
          sliver: SliverToBoxAdapter(child: MainWeatherWidget()),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 14),
          sliver: SliverToBoxAdapter(child: HourlyForecastTile()),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          sliver: SliverToBoxAdapter(child: AdditionalInformationTile()),
        ),
      ],
    );
  }
}
