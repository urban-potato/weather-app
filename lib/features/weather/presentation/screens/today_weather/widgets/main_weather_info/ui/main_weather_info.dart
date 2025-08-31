import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../models/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';
import '../../../../../widgets/daily_temperature_range/index.dart';
import '../../../../../widgets/main_temperature/index.dart';
import '../../../../../widgets/uv_info/index.dart';
import '../../../../../widgets/weather_condition/index.dart';
import '../../../../../../../../shared/utils/size_helper/index.dart';
import 'components/aqi_info/ui/aqi_info.dart';

class MainWeatherInfoWidget extends StatefulWidget {
  const MainWeatherInfoWidget({super.key});

  @override
  State<MainWeatherInfoWidget> createState() => _MainWeatherInfoWidgetState();
}

class _MainWeatherInfoWidgetState extends State<MainWeatherInfoWidget>
    with AutomaticKeepAliveClientMixin<MainWeatherInfoWidget> {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print('MainWeatherInfoWidget build');

    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(2);

    return BlocSelector<WeatherCubit, WeatherState, MainWeatherModelUI?>(
      selector: (state) => state.weather?.today.mainWeather,
      builder: (context, state) {
        if (state == null) {
          print(
            'MainWeatherInfoWidget BlocSelector return CircularProgressIndicator',
          );
          return const Center(child: CircularProgressIndicator());
        } else {
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
                text: state.condition.text,
                iconPath: state.condition.iconPath,
                sizeRatio: 1.3,
              ),
              DailyTemperatureRangeWidget(
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

class _UVAndAQIInfoRow extends StatelessWidget {
  const _UVAndAQIInfoRow({required this.aqi, required this.uv});

  final int aqi;
  final int uv;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final spacing = ScreenBasedSize.instance.scaleByUnit(1);

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
