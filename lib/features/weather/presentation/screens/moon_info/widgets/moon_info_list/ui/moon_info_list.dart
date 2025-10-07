import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../../../shared/presentation/ui/custom_circular_progress_indicator/index.dart';
import '../../../../../models/index.dart' show WeeklyMoonModelUI;
import '../../../../../provider/index.dart';
import 'components/day_tile.dart';

class MoonInfoListWidget extends ConsumerWidget {
  const MoonInfoListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.read<Talker>().info('MoonInfoListWidget build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final separatorHeight = sizeService.screenPercentage(4);

    return BlocSelector<WeatherCubit, WeatherState, WeeklyMoonModelUI?>(
      selector: (state) => state.weather?.weeklyMoon,
      builder: (context, state) {
        if (state == null) {
          return const SliverFillRemaining(
            child: CustomCircularProgressIndicator(),
          );
        }

        final moonList = state.moonList;

        return SliverList.separated(
          itemBuilder: (context, index) => DayTileWidget(data: moonList[index]),
          separatorBuilder: (context, index) =>
              SizedBox(height: separatorHeight),
          itemCount: moonList.length,
        );
      },
    );
  }
}
