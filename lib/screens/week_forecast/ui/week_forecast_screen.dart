import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import '../features/day_tile.dart';

@RoutePage()
class WeekForecastScreen extends StatelessWidget {
  const WeekForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const CustomSliverAppBar(locationName: 'Saint Petersburg'),

        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          sliver: SliverList.separated(
            itemBuilder: (context, index) => const DayTile(),
            separatorBuilder: (context, index) => const SizedBox(height: 26),
            itemCount: 7,
          ),
        ),
      ],
    );
  }
}
