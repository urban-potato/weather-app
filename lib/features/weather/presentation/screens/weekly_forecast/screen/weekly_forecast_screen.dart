import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../../../../shared/ui/custom_sliver_app_bar/index.dart';
import '../../../../../../shared/utils/size_helpers/index.dart';
import '../widgets/weekly_forecast_list/index.dart';

@RoutePage()
class WeeklyForecastScreen extends StatelessWidget {
  const WeeklyForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final padding = ScreenBasedSize.instance.getSidesPadding();

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
