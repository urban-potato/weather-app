import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';
import '../../../shared/utils/adjustable_size/index.dart';
import '../components/weekly_forecast_list.dart';

@RoutePage()
class WeekForecastScreen extends StatelessWidget {
  const WeekForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final padding = ScreenBasedSize.instance.getSidesPadding();

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Week Forecast'),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
              ).copyWith(bottom: padding),
              sliver: const WeeklyForecastList(),
            ),
          ],
        ),
      ),
    );
  }
}
