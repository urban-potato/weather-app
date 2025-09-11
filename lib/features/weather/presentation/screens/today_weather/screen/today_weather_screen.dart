import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../shared/ui/screen_padding/index.dart';
import '../../../../../../shared/utils/size_helper/index.dart';
import '../../../provider/weather_cubit.dart';
import '../../../provider/weather_state.dart';
import '../widgets/additional_info/index.dart';
import '../widgets/custom_refresh_control/index.dart';
import '../widgets/hourly_forecast/index.dart';
import '../widgets/main_weather_info/index.dart';
import '../widgets/weather_screen_sliver_app_bar/index.dart';
import '../widgets/no_data/index.dart';
import '../widgets/weekly_forecast_preview/index.dart';

@RoutePage()
class TodayWeatherScreen extends StatelessWidget {
  const TodayWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('+++++ TodayWeatherScreen build +++++');

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            const WeatherScreenSliverAppBar(),
            const CustomRefreshControl(),

            BlocBuilder<WeatherCubit, WeatherState>(
              buildWhen: (previous, current) {
                if (previous is! WeatherInitial && current is WeatherLoading) {
                  return false;
                }
                return true;
              },
              builder: (context, state) {
                if (kDebugMode)
                  print('+++++ TodayWeatherScreen BlocBuilder build +++++');
                if (state is WeatherLoaded) {
                  if (kDebugMode)
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder _BodyWidgets +++++',
                    );
                  return const _WeatherScreenBodyWidgets();
                } else if (state is WeatherFailure) {
                  if (kDebugMode)
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder _NoDataWidget +++++',
                    );
                  return const SliverFillRemaining(
                    child: ScreenPadding(child: NoDataWidget()),
                  );
                }

                if (kDebugMode)
                  print(
                    '+++++ TodayWeatherScreen BlocBuilder CustomCircularProgressIndicator +++++',
                  );
                return const SliverFillRemaining(
                  child: CustomCircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _WeatherScreenBodyWidgets extends StatelessWidget {
  const _WeatherScreenBodyWidgets();

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      print(
        '======= TodayWeatherScreen _WeatherScreenBodyWidgets build =======',
      );

    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        ElevatedButton(
          onPressed: () {
            if (kDebugMode) print('--- onPressed ---');
            context.read<WeatherCubit>().loadWeather();
          },
          child: const Text('Refresh'),
        ),
        const _MainWeatherInfoPadding(child: MainWeatherInfoWidget()),
        const ScreenPadding(child: WeeklyForecastPreviewWidget()),
        const ScreenPadding(child: HourlyForecastWidget()),
        const ScreenPadding(child: AdditionalInfoWidget()),
      ]),
    );
  }
}

class _MainWeatherInfoPadding extends StatelessWidget {
  const _MainWeatherInfoPadding({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.getSidesPadding();
    final vPadding = ScreenBasedSize.instance.scaleByRatio(5);
    final mainWeatherWidgetMaxWidth = ScreenBasedSize.instance.scaleByUnit(49);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hPadding, vertical: vPadding),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: mainWeatherWidgetMaxWidth),

          child: child,
        ),
      ),
    );
  }
}
