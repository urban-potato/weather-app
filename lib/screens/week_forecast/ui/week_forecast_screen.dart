import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../../../shared/ui/custom_sliver_app_bar/index.dart';

@RoutePage()
class WeekForecastScreen extends StatelessWidget {
  const WeekForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [CustomSliverAppBar(locationName: 'Krasnoyarsk')],
    );
  }
}
