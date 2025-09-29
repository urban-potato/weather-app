import 'dart:developer' show log;

import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      log('------------------- SettingsScreen build -------------------');

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Settings'),

            SliverToBoxAdapter(
              child: Container(width: 100, height: 100, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
