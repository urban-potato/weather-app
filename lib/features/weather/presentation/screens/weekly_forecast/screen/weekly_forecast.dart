import 'dart:developer' show log;

import 'package:auto_route/annotations.dart';
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';
import '../../../../../home/presentation/provider/home_cubit.dart';
import '../widgets/weekly_forecast_list/index.dart';

@RoutePage()
class WeeklyForecastScreen extends ConsumerWidget {
  const WeeklyForecastScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (kDebugMode)
      log('------------------- WeeklyForecastScreen build -------------------');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    final padding = sizeService.sidesPadding;

    final homeCubit = context.read<HomeCubit>();
    homeCubit.changeAppBar(title: 'Weekly Forecast', ifShowArrowBack: true);

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            // const CustomSliverAppBar(title: 'Weekly Forecast'),
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
