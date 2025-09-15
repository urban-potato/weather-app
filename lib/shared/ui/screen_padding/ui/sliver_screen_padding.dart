import 'package:flutter/material.dart';

import '../../../utils/size_helper/index.dart';

class SliverScreenPadding extends StatelessWidget {
  const SliverScreenPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final padding = ScreenBasedSize.instance.sidesPadding;

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ).copyWith(bottom: padding),
      sliver: SliverToBoxAdapter(child: child),
    );
  }
}
