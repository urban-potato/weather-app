import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../../../shared/ui/themed_text/index.dart';
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

    return BlocSelector<WeatherCubit, WeatherState, String?>(
      selector: (state) => state.weather?.location.name,
      builder: (context, state) {
        final title = state == null
            ? const ThemedText(
                text: 'location...',
                styleType: AppTextStyle.bodySmall,
              )
            : ThemedText(
                text: state,
                styleType: AppTextStyle.headlineMedium,
                fontSize: contentSize,
              );

        return SliverAppBar(
          pinned: true,
          toolbarHeight: toolbarHeight,
          title: title,
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
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
