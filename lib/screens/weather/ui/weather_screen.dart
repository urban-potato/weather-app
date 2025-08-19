import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/layout/sliver_to_box_adapter_with_padding/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import 'components/additional_information.dart';
import 'components/hourly_forecast.dart';
import 'components/main_weather.dart';
import 'components/weather_sliver_app_bar.dart';
import 'components/weekly_forecast_preview.dart';

@RoutePage()
class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.getSidesPadding();
    final vPadding = ScreenBasedSize.instance.scaleByRatio(5);
    final mainWeatherWidgetMaxWidth = ScreenBasedSize.instance.scaleByUnit(49);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const WeatherSliverAppBar(locationName: 'Saint Petersburg'),

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

                    child: const MainWeather(),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapterWithPadding(child: WeekForecastPreview()),

            const SliverToBoxAdapterWithPadding(child: HourlyForecast()),

            const SliverToBoxAdapterWithPadding(child: AdditionalInformation()),
          ],
        ),
      ),
    );
  }
}
