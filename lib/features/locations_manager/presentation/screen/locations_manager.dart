import 'dart:developer' show log;

import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';

@RoutePage()
class LocationsManagerScreen extends StatelessWidget {
  const LocationsManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      log(
        '------------------- LocationsManagerScreen build -------------------',
      );

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Locations Manager'),

            SliverToBoxAdapter(
              child: Container(width: 100, height: 100, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}
