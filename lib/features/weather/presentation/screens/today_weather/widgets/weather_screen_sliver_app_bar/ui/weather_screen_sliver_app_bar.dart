import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../../../../../shared/presentation/providers/index.dart'
    show navigationServiceProvider;
import '../../../../../../../../shared/presentation/services/index.dart'
    show AppRoute;
import '../../../../../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';

class WeatherScreenSliverAppBar extends ConsumerWidget {
  const WeatherScreenSliverAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final talker = context.read<Talker>();
    talker.info('WeatherScreenSliverAppBar build');

    return BlocSelector<WeatherCubit, WeatherState, String?>(
      selector: (state) => state.weather?.location.name,
      builder: (context, state) {
        talker.info('WeatherScreenSliverAppBar BlocSelector');

        final navigationService = ref.read(navigationServiceProvider);

        return CustomSliverAppBar(
          title: state,
          leadingIcon: Icons.add,
          leadingCallback: () =>
              navigationService.push(AppRoute.locationsManager),
          actionConfigs: [
            (
              icon: Icons.menu,
              onPressed: () => navigationService.push(AppRoute.settings),
            ),
          ],
        );
      },
    );
  }
}
