import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../shared/providers/index.dart'
    show notificationServiceProvider, responsiveSizeServiceProvider;
import '../../../../../../shared/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../../shared/ui/screen_padding/index.dart';
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
class TodayWeatherScreen extends ConsumerWidget {
  const TodayWeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationService = ref.read(notificationServiceProvider);

    if (kDebugMode) print('+++++ TodayWeatherScreen build +++++');

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          slivers: [
            const WeatherScreenSliverAppBar(),
            const CustomRefreshControl(),

            BlocConsumer<WeatherCubit, WeatherState>(
              listener: (context, state) {
                if (kDebugMode)
                  print('+++++ TodayWeatherScreen BlocBuilder listener +++++');

                if (state is WeatherFailure && state.weather != null) {
                  notificationService.showMessage(
                    context,
                    'Failed to load data. Please check your internet connection and try again.',
                  );
                }
              },
              buildWhen: (previous, current) {
                // TODO: сделать, чтобы во время обновления с ошибки без данных на ошибку без данных не мелькала крутилка, но картинка облака обновлялась(?)
                if (current.weather != null &&
                    previous.weather == current.weather) {
                  return false;
                }

                return true;
              },
              builder: (context, state) {
                if (kDebugMode)
                  print('+++++ TodayWeatherScreen BlocBuilder build +++++');

                if (state.weather != null) {
                  if (kDebugMode)
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder _WeatherScreenBodyWidgets +++++',
                    );

                  return const _WeatherScreenBodyWidgets();
                } else if (state is WeatherInitial || state is WeatherLoading) {
                  if (kDebugMode)
                    print(
                      '+++++ TodayWeatherScreen BlocBuilder CustomCircularProgressIndicator +++++',
                    );

                  return const SliverFillRemaining(
                    child: CustomCircularProgressIndicator(),
                  );
                }

                if (kDebugMode)
                  print(
                    '+++++ TodayWeatherScreen BlocBuilder NoDataWidget +++++',
                  );

                return const SliverFillRemaining(
                  child: ScreenPadding(child: NoDataWidget()),
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
        const _MainWeatherInfoPadding(child: MainWeatherInfoWidget()),
        // TODO: временная кнопка, потом удалить
        ElevatedButton(
          onPressed: () {
            if (kDebugMode) print('--- onPressed ---');
            context.read<WeatherCubit>().loadWeather();
          },
          child: const Text('Refresh'),
        ),
        const ScreenPadding(child: WeeklyForecastPreviewWidget()),
        const ScreenPadding(child: HourlyForecastWidget()),
        const ScreenPadding(child: AdditionalInfoWidget()),
      ]),
    );
  }
}

class _MainWeatherInfoPadding extends ConsumerWidget {
  const _MainWeatherInfoPadding({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider);

    final hPadding = sizeService.sidesPadding;
    final vPadding = sizeService.screenDividedBy(5);
    final mainWeatherWidgetMaxWidth = sizeService.screenPercentage(49);

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
