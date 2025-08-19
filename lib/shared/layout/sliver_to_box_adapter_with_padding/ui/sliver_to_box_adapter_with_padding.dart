import 'package:flutter/material.dart';

import '../../../utils/adjustable_size/index.dart';

class SliverToBoxAdapterWithPadding extends StatelessWidget {
  const SliverToBoxAdapterWithPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final padding = ScreenBasedSize.instance.getSidesPadding();

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ).copyWith(bottom: padding),
      sliver: SliverToBoxAdapter(child: child),
    );
  }
}
