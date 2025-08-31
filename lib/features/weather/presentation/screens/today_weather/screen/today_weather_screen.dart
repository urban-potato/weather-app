import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/service_locator/service_locator.dart';
import '../../../../../../shared/ui/screen_padding/index.dart';
import '../../../../../../shared/utils/size_helper/index.dart';
import '../../../provider/weather_cubit.dart';
import '../../../provider/weather_state.dart';
import '../widgets/additional_info/index.dart';
import '../widgets/custom_refresh_control/index.dart';
import '../widgets/hourly_forecast/index.dart';
import '../widgets/main_weather_info/index.dart';
import '../widgets/custom_sliver_app_bar/index.dart';
import '../widgets/weekly_forecast_preview/index.dart';

@RoutePage()
class TodayWeatherScreen extends StatelessWidget {
  const TodayWeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print('+++++ TodayWeatherScreen build +++++');

    return SafeArea(
      child: Scaffold(
        body: BlocProvider<WeatherCubit>(
          create: (context) => sl<WeatherCubit>()..loadWeather(),

          child: CustomScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            slivers: [
              const CustomSliverAppBar(),
              const CustomRefreshControl(),

              BlocBuilder<WeatherCubit, WeatherState>(
                buildWhen: (previous, current) {
                  if (previous is! WeatherInitial &&
                      current is WeatherLoading) {
                    return false;
                  }
                  return true;
                },
                builder: (context, state) {
                  print('+++++ TodayWeatherScreen BlocBuilder build +++++');
                  if (state is WeatherLoading) {
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder CircularProgressIndicator +++++',
                    );

                    return const SliverFillRemaining(
                      child: Center(child: CircularProgressIndicator()),
                    );
                  } else if (state is WeatherFailure) {
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder Text ERROR :( +++++',
                    );

                    return const SliverFillRemaining(
                      child: Center(child: Text('ERROR :(')),
                    );
                  } else if (state is WeatherLoaded) {
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder _BodyWidgets +++++',
                    );

                    return const _WeatherScreenBodyWidgets();
                  } else {
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder Text ERROR :(( +++++',
                    );

                    return const SliverFillRemaining(
                      child: Center(child: Text('ERROR :((((((')),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _NoDataWidget extends StatelessWidget {
  const _NoDataWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _WeatherScreenBodyWidgets extends StatelessWidget {
  const _WeatherScreenBodyWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    print('======= TodayWeatherScreen _WeatherScreenBodyWidgets build =======');

    return SliverList(
      delegate: SliverChildListDelegate.fixed([
        ElevatedButton(
          onPressed: () {
            print('--- onPressed ---');
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
  const _MainWeatherInfoPadding({super.key, required this.child});

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
