import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;
import 'package:talker_flutter/talker_flutter.dart' show Talker;
import '../../../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';
import '../widgets/moon_info_list/index.dart';

@RoutePage()
class MoonInfoScreen extends ConsumerWidget {
  const MoonInfoScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    context.read<Talker>().debug('MoonInfoScreen build');

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final padding = sizeService.sidesPadding;

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const CustomSliverAppBar(title: 'Moon Info'),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: padding,
              ).copyWith(bottom: padding),
              sliver: const MoonInfoListWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
