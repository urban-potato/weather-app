import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../../../shared/presentation/providers/index.dart'
    show navigationServiceProvider;
import '../../../../../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';

class WeatherScreenSliverAppBar extends ConsumerWidget {
  const WeatherScreenSliverAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode) print('WeatherScreenSliverAppBar build');

    return BlocSelector<WeatherCubit, WeatherState, String?>(
      selector: (state) => state.weather?.location.name,
      builder: (context, state) {
        if (kDebugMode) print('WeatherScreenSliverAppBar BlocSelector');

        final navigationService = ref.read(navigationServiceProvider);

        return CustomSliverAppBar(
          title: state,
          leadingIcon: Icons.add,
          leadingCallback: () =>
              navigationService.pushLocationsManagerRoute(context),
          actionConfigs: [
            (
              icon: Icons.menu,
              onPressed: () => navigationService.pushSettingsRoute(context),
            ),
          ],
        );
      },
    );
  }
}
