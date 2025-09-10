import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../services/index.dart';
import '../../../utils/size_helper/index.dart';

class CustomSliverAppBar extends ConsumerWidget {
  const CustomSliverAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final navigationService = ref.read(navigationServiceProvider);
    ScreenBasedSize.instance.init(context);

    final toolbarHeight = ScreenBasedSize.instance.scaleByUnit(12);
    final contentSize = ScreenBasedSize.instance.scaleByUnit(5);

    final theme = Theme.of(context);

    print('CustomSliverAppBar build - shared/ui');

    return SliverAppBar(
      pinned: true,
      toolbarHeight: toolbarHeight,
      title: Text(
        title,
        style: theme.textTheme.headlineMedium?.copyWith(fontSize: contentSize),
      ),

      centerTitle: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: theme.scaffoldBackgroundColor,
      automaticallyImplyLeading: false,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          iconSize: contentSize,
          onPressed: () => navigationService.pop(context),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      leadingWidth: toolbarHeight,
    );
  }
}
