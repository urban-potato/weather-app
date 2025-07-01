import 'package:flutter/material.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key, required this.locationName});

  final String locationName;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text(
        locationName,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      centerTitle: true,
      // backgroundColor: theme.appBarTheme.foregroundColor,
      backgroundColor: Colors.transparent,
      actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.menu))],
      leading: IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
    );
  }
}
