import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/utils/size_helper/index.dart';
import '../../../../../provider/weather_cubit.dart';
import '../../../../../provider/weather_state.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final toolbarHeight = ScreenBasedSize.instance.scaleByUnit(12);
    final contentSize = ScreenBasedSize.instance.scaleByUnit(5);

    print('CustomSliverAppBar today_weather build');

    return BlocSelector<WeatherCubit, WeatherState, String?>(
      selector: (state) => state.weather?.location.name,
      builder: (context, state) {
        print('CustomSliverAppBar today_weather BlocSelector');

        final theme = Theme.of(context);

        final title = state == null
            ? Text('location...', style: theme.textTheme.bodySmall)
            : Text(
                state,
                style: theme.textTheme.headlineMedium?.copyWith(
                  fontSize: contentSize,
                ),
              );

        return SliverAppBar(
          pinned: true,
          toolbarHeight: toolbarHeight,
          title: title,
          centerTitle: true,
          backgroundColor: theme.scaffoldBackgroundColor,
          surfaceTintColor: theme.scaffoldBackgroundColor,
          actions: [
            IconButton(
              iconSize: contentSize,
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
          ],
          leading: Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              iconSize: contentSize,
              onPressed: () {},
              icon: const Icon(Icons.add),
            ),
          ),
          leadingWidth: toolbarHeight,
        );
      },
    );
  }
}
