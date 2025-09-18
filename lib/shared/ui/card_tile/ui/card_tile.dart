import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerWidget, WidgetRef;

import '../../../providers/index.dart' show responsiveSizeServiceProvider;

class CardTile extends ConsumerWidget {
  const CardTile({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.minWidth = 0.0,
    this.maxWidth = double.infinity,
    this.minHeight = 0.0,
    this.maxHeight = double.infinity,
    this.color,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double minWidth;
  final double maxWidth;
  final double minHeight;
  final double maxHeight;
  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sizeService = ref.read(responsiveSizeServiceProvider);

    final tileBorderRadius = sizeService.borderRadius;
    final hPadding = sizeService.tileHorizontalPadding;
    final vPadding = sizeService.tileVerticalPadding;

    final finalPadding =
        padding ??
        EdgeInsetsGeometry.symmetric(horizontal: hPadding, vertical: vPadding);

    if (kDebugMode) print('CardTile build');

    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      child: SizedBox(
        width: width,
        height: height,
        child: _ThemedDecoratedBox(
          color: color,
          tileBorderRadius: tileBorderRadius,
          padding: finalPadding,
          child: child,
        ),
      ),
    );
  }
}

class _ThemedDecoratedBox extends StatelessWidget {
  const _ThemedDecoratedBox({
    required this.color,
    required this.tileBorderRadius,
    required this.padding,
    required this.child,
  });

  final Color? color;
  final double tileBorderRadius;
  final EdgeInsetsGeometry padding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final finalColor =
        color?.withValues(alpha: 0.8) ??
        Theme.of(context).cardColor.withValues(alpha: 0.8);

    if (kDebugMode) print('CardTile _ThemedDecoratedBox');

    return DecoratedBox(
      decoration: BoxDecoration(
        color: finalColor,
        borderRadius: BorderRadius.circular(tileBorderRadius),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
