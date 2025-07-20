import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import 'widgets/additional_information_tile.dart';
import 'widgets/hourly_forecast_tile.dart';
import 'widgets/main_weather_widget.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AdjustableSize.instance.init(context);

    final sidesPadding = AdjustableSize.instance.getSidesPadding();
    final verticalPadding = AdjustableSize.instance.scaleByScreen(5);

    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(locationName: 'Krasnoyarsk'),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: sidesPadding,
            vertical: verticalPadding,
          ),
          sliver: const SliverToBoxAdapter(child: MainWeatherWidget()),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: sidesPadding),
          sliver: const SliverToBoxAdapter(child: HourlyForecastTile()),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: sidesPadding,
            vertical: sidesPadding,
          ),
          sliver: const SliverToBoxAdapter(child: AdditionalInformationTile()),
        ),
      ],
    );
  }
}
