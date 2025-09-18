import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../providers/index.dart' show responsiveSizeServiceProvider;

class ScreenPadding extends ConsumerWidget {
  const ScreenPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider);

    final padding = sizeService.sidesPadding;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ).copyWith(bottom: padding),
      child: child,
    );
  }
}
