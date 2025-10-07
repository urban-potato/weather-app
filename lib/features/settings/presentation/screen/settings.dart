import 'package:auto_route/auto_route.dart' show RoutePage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

import '../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<Talker>().debug('SettingsScreen build');

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
