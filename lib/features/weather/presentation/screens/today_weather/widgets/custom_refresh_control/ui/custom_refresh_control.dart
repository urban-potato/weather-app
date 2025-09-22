import 'dart:developer';

import 'package:flutter/cupertino.dart'
    show CupertinoSliverRefreshControl, RefreshIndicatorMode;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/features/weather/presentation/provider/weather_cubit.dart';

import '../../../../../shared/utils/update_permission_helper/index.dart';
import '../../../../../provider/weather_state.dart';
import '../utils/last_updated_info_helper.dart';

class CustomRefreshControl extends StatelessWidget {
  const CustomRefreshControl({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherCubit = context.read<WeatherCubit>();
    final textStyle = Theme.of(context).textTheme.bodySmall;

    if (kDebugMode) print('CustomRefreshControl build');

    return CupertinoSliverRefreshControl(
      refreshIndicatorExtent: 20,
      refreshTriggerPullDistance: 50,
      onRefresh: () async {
        final lastUpdated = weatherCubit.state.weather?.lastUpdated;

        if (!isUpdateAllowed(lastUpdated)) {
          if (kDebugMode) log('WE DON\'T LET USER UPDATE HEHE');
          await Future.delayed(const Duration(seconds: 1));
          return;
        }

        final futureWeatherState = weatherCubit.stream.firstWhere((state) {
          if (kDebugMode) print('weatherBloc.stream.firstWhere');
          return (state is WeatherLoaded || state is WeatherFailure);
        });

        weatherCubit.loadWeather();
        if (kDebugMode) print('weatherCubit.loadWeather();');

        final resultState = await futureWeatherState;

        if (kDebugMode) print('resultState = $resultState');
        if (kDebugMode) print('after await');
      },
      builder:
          (
            BuildContext context,
            RefreshIndicatorMode refreshState,
            double pulledExtent,
            double refreshTriggerPullDistance,
            double refreshIndicatorExtent,
          ) {
            if (kDebugMode)
              print(
                'CustomRefreshControl CupertinoSliverRefreshControl builder',
              );

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
