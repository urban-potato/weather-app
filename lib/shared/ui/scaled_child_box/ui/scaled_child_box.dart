import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../providers/index.dart' show responsiveSizeServiceProvider;

class ScaledChildBox extends ConsumerWidget {
  const ScaledChildBox({
    super.key,
    required this.height,
    required this.child,
    this.aligment = Alignment.center,
  }) : assert(height >= 0, 'height must be greater than or equal to 0');

  final double height;
  final Widget child;
  final AlignmentGeometry aligment;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider);

    final double height = sizeService.screenPercentage(this.height);

    return SizedBox(
      height: height,
      child: FittedBox(alignment: aligment, child: child),
    );
  }
}
