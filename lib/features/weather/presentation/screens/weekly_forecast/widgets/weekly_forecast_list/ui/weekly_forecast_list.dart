import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../models/index.dart' show WeeklyForecastModelUI;
import '../../../../../provider/index.dart';
import 'components/day_tile/day_tile.dart';

class WeeklyForecastListWidget extends ConsumerWidget {
  const WeeklyForecastListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = context.read<Talker>();
    talker.info('WeeklyForecastListWidget build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final separatorHeight = sizeService.screenPercentage(4);

    return BlocSelector<WeatherCubit, WeatherState, WeeklyForecastModelUI?>(
      selector: (state) => state.weather?.weeklyForecast,
      builder: (context, state) {
        if (state == null) {
          talker.info(
            'WeeklyForecastListWidget BlocSelector CustomCircularProgressIndicator',
          );

          return const SliverFillRemaining(
            child: CustomCircularProgressIndicator(),
          );
        }

        talker.info('WeeklyForecastListWidget BlocSelector SliverList');

        final forecastDayList = state.forecastDayList;

        return SliverList.separated(
          itemBuilder: (context, index) => DayTileWidget(
            data: forecastDayList[index],
            sizeService: sizeService,
          ),
          separatorBuilder: (context, index) =>
              SizedBox(height: separatorHeight),
          itemCount: forecastDayList.length,
        );
      },
    );
  }
}
