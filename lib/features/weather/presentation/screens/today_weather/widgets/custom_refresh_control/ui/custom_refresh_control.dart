import 'package:flutter/cupertino.dart'
    show CupertinoSliverRefreshControl, RefreshIndicatorMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../provider/weather_cubit.dart';
import '../../../../../shared/utils/update_permission_helper/index.dart';
import '../../../../../provider/weather_state.dart';
import '../utils/last_updated_info_helper.dart';

class CustomRefreshControl extends StatelessWidget {
  const CustomRefreshControl({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherCubit>();
    final textStyle = Theme.of(context).textTheme.bodySmall;

    return CupertinoSliverRefreshControl(
      refreshIndicatorExtent: 20,
      refreshTriggerPullDistance: 50,
      onRefresh: () async {
        final lastUpdated = weatherCubit.state.weather?.lastUpdated;

        if (!isUpdateAllowed(lastUpdated)) {
          await Future.delayed(const Duration(seconds: 1));
          return;
        }

        final futureWeatherState = weatherCubit.stream.firstWhere((state) {
          return (state is WeatherLoaded || state is WeatherFailure);
        });

        weatherCubit.loadWeather();

        await futureWeatherState;
      },
      builder:
          (
            BuildContext context,
            RefreshIndicatorMode refreshState,
            double pulledExtent,
            double refreshTriggerPullDistance,
            double refreshIndicatorExtent,
          ) {
            String text = '';

            if (refreshState == RefreshIndicatorMode.refresh ||
                refreshState == RefreshIndicatorMode.armed) {
              text = 'Updating...';
            } else if (refreshState == RefreshIndicatorMode.done &&
                weatherCubit.state is WeatherLoaded) {
              text = 'Updated successfully';
            } else if (refreshState == RefreshIndicatorMode.done &&
                weatherCubit.state is WeatherFailure) {
              text = 'Error';
            } else {
              text = getLastUpdatedInfo(
                weatherCubit.state.weather?.lastUpdated,
              );
            }

            return Text(text, style: textStyle, textAlign: TextAlign.center);
          },
    );
  }
}
