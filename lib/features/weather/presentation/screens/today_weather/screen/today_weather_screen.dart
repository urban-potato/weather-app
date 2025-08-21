import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/ui/sliver_to_box_adapter_with_padding/index.dart';
import '../../../../../../shared/utils/size_helpers/index.dart';
import '../widgets/additional_info/index.dart';
import '../widgets/hourly_forecast/index.dart';
import '../widgets/main_weather_info/index.dart';
import '../widgets/custom_sliver_app_bar/index.dart';
import '../widgets/weekly_forecast_preview/index.dart';

@RoutePage()
class TodayWeatherScreen extends StatelessWidget {
  const TodayWeatherScreen({super.key});

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

                    child: const MainWeatherInfoWidget(),
                  ),
                ),
              ),
            ),

            const SliverToBoxAdapterWithPadding(
              child: WeekForecastPreviewWidget(),
            ),

            const SliverToBoxAdapterWithPadding(child: HourlyForecastWidget()),

            const SliverToBoxAdapterWithPadding(child: AdditionalInfoWidget()),
          ],
        ),
      ),
    );
  }
}
