import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../providers/index.dart' show responsiveSizeServiceProvider;

class SliverScreenPadding extends ConsumerWidget {
  const SliverScreenPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider);

    final padding = sizeService.sidesPadding;

    return SliverPadding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ).copyWith(bottom: padding),
      sliver: SliverToBoxAdapter(child: child),
    );
  }
}
