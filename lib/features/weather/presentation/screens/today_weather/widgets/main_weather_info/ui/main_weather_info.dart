import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState, ConsumerWidget, WidgetRef;

import '../../../../../../../../shared/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../shared/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../models/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';
import '../../../../../widgets/daily_temperature_range/index.dart'
    show ScaledDailyTemperatureRangeWidget;
import '../../../../../widgets/main_temperature/index.dart';
import '../../../../../widgets/uv_info/index.dart';
import '../../../../../widgets/weather_condition/index.dart';
import 'components/aqi_info/ui/aqi_info.dart';

class MainWeatherInfoWidget extends ConsumerStatefulWidget {
  const MainWeatherInfoWidget({super.key});

  @override
  ConsumerState<MainWeatherInfoWidget> createState() =>
      _MainWeatherInfoWidgetState();
}

class _MainWeatherInfoWidgetState extends ConsumerState<MainWeatherInfoWidget>
    with AutomaticKeepAliveClientMixin<MainWeatherInfoWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    if (kDebugMode) print('MainWeatherInfoWidget build');

    final spacing = sizeService.screenPercentage(2);

    return BlocSelector<WeatherCubit, WeatherState, MainWeatherModelUI?>(
      selector: (state) => state.weather?.today.mainWeather,
      builder: (context, state) {
        if (state == null) {
          if (kDebugMode)
            print(
              'MainWeatherInfoWidget BlocSelector return CircularProgressIndicator',
            );
          return const CustomCircularProgressIndicator();
        } else {
          if (kDebugMode)
            print('MainWeatherInfoWidget BlocSelector return Column');
          return Column(
            spacing: spacing,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(child: Text(state.lastUpdated)),
              MainTemperatureWidget(
                temperature: state.temperature.celsius.toString(),
                sizeRatio: 2,
              ),
              WeatherConditionWidget(
                sizeRatio: 1.3,
                condition: state.condition,
              ),
              ScaledDailyTemperatureRangeWidget(
                maxTemp: state.temperatureRange.maximum.celsius.toString(),
                minTemp: state.temperatureRange.minimum.celsius.toString(),
              ),
              _UVAndAQIInfoRow(aqi: state.airQualityGbDefraIndex, uv: state.uv),
            ],
          );
        }
      },
    );
  }
}

class _UVAndAQIInfoRow extends ConsumerWidget {
  const _UVAndAQIInfoRow({required this.aqi, required this.uv});

  final int aqi;
  final int uv;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final spacing = sizeService.screenPercentage(1);

    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      alignment: WrapAlignment.center,
      spacing: spacing,
      runSpacing: spacing,
      children: [
        UvInfoWidget(uv: uv),
        AqiInfoWidget(aqi: aqi),
      ],
    );
  }
}
