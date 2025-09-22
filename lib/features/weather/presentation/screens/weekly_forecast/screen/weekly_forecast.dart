import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../../../../shared/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../shared/ui/custom_sliver_app_bar/index.dart';
import '../widgets/weekly_forecast_list/index.dart';

@RoutePage()
class WeeklyForecastScreen extends ConsumerWidget {
  const WeeklyForecastScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    final padding = sizeService.sidesPadding;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Weekly Forecast'),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
              ).copyWith(bottom: padding),
              sliver: const WeeklyForecastListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
