import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../utils/adjustable_size/index.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final toolbarHeight = ScreenBasedSize.instance.scaleByUnit(12);
    final contentSize = ScreenBasedSize.instance.scaleByUnit(5);

    return SliverAppBar(
      pinned: true,
      toolbarHeight: toolbarHeight,
      title: Text(
        title,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.copyWith(fontSize: contentSize),
      ),
      centerTitle: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
      leading: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          iconSize: contentSize,
          onPressed: () => context.router.pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      leadingWidth: toolbarHeight,
    );
  }
}
