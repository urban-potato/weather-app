import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/presentation/models/index.dart'
    show AppBarModelUI;
import '../../../../../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';

class WeatherScreenSliverAppBar extends StatelessWidget {
  const WeatherScreenSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) print('WeatherScreenSliverAppBar build');

    return BlocSelector<WeatherCubit, WeatherState, String?>(
      selector: (state) => state.weather?.location.name,
      builder: (context, state) {
        if (kDebugMode) print('WeatherScreenSliverAppBar BlocSelector');

        return CustomSliverAppBar(
          appBarModelUI: AppBarModelUI(
            title: state,
            leadingIcon: Icons.add,
            leadingCallback: () {},
            actionConfigs: [(icon: Icons.menu, onPressed: () {})],
          ),
          // title: state,
          // leadingIcon: Icons.add,
          // leadingCallback: () {},
          // actionConfigs: [(icon: Icons.menu, onPressed: () {})],
        );
      },
    );
  }
}
