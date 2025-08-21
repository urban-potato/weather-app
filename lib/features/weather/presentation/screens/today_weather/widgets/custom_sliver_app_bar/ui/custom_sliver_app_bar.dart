import 'package:flutter/material.dart';

import '../../../../../../../../shared/utils/size_helpers/index.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.locationName});

  final String locationName;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final theme = Theme.of(context);
    final toolbarHeight = ScreenBasedSize.instance.scaleByUnit(12);
    final contentSize = ScreenBasedSize.instance.scaleByUnit(5);

    return SliverAppBar(
      pinned: true,
      toolbarHeight: toolbarHeight,
      title: Text(
        locationName,
        style: Theme.of(
          context,
        ).textTheme.headlineMedium?.copyWith(fontSize: contentSize),
      ),
      centerTitle: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      surfaceTintColor: theme.scaffoldBackgroundColor,
      actions: [
        IconButton(
          iconSize: contentSize,
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
      ],
      leading: Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          iconSize: contentSize,
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
      ),
      leadingWidth: toolbarHeight,
    );
  }
}
