import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import 'package:weather_app/shared/lib/layout/index.dart';
import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import 'widgets/additional_information_tile.dart';
import 'widgets/hourly_forecast_tile.dart';
import 'widgets/main_weather_widget.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSidesPadding = calculateScreenSidesPadding(context);

    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(locationName: 'Krasnoyarsk'),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSidesPadding,
            vertical: 82,
          ),
          sliver: const SliverToBoxAdapter(child: MainWeatherWidget()),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: screenSidesPadding),
          sliver: const SliverToBoxAdapter(child: HourlyForecastTile()),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: screenSidesPadding,
            vertical: screenSidesPadding,
          ),
          sliver: const SliverToBoxAdapter(child: AdditionalInformationTile()),
        ),
      ],
    );
  }
}
