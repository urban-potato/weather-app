import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';

import 'features/additional_information_tile.dart';
import 'features/hourly_forecast_tile.dart';
import '../../../shared/ui/main_weather/index.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.getSidesPadding();
    final vPadding = ScreenBasedSize.instance.scaleByRatio(5);
    final mainWeatherWidgetMaxWidth = ScreenBasedSize.instance.scaleByUnit(49);

    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(locationName: 'Saint Petersburg'),
        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding,
            vertical: vPadding,
          ),
          sliver: SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: mainWeatherWidgetMaxWidth,
                ),

                child: const MainWeatherWidget(
                  shouldShowAQI: true,
                  currentTemperatureSize: 1.5,
                ),
              ),
            ),
          ),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(horizontal: hPadding),
          sliver: const SliverToBoxAdapter(child: HourlyForecastWidget()),
        ),

        SliverPadding(
          padding: EdgeInsets.symmetric(
            horizontal: hPadding,
            vertical: hPadding,
          ),
          sliver: const SliverToBoxAdapter(child: AdditionalInformationTile()),
        ),
      ],
    );
  }
}
