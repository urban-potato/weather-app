import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.locationName});

  final String locationName;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
    final toolbarHeight = screenMinSide / 8;
    final contentSize = screenMinSide / 17;

    return SliverAppBar(
      pinned: true,
      toolbarHeight: toolbarHeight,
      title: Text(
        locationName,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: contentSize),
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
