import 'package:flutter/material.dart';

import '../../../utils/size_helper/index.dart';

class CardTile extends StatelessWidget {
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
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final screenMinSide = ScreenBasedSize.instance.screenMinSide;
    final tileBorderRadius = screenMinSide / 25.7;
    final hPadding = ScreenBasedSize.instance.scaleByUnit(3.5);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(3);

    final finalPadding =
        padding ??
        EdgeInsetsGeometry.symmetric(horizontal: hPadding, vertical: vPadding);

    print('CardTile');

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

    print('CardTile _ThemedDecoratedBox');

    return DecoratedBox(
      decoration: BoxDecoration(
        color: finalColor,
        borderRadius: BorderRadius.circular(tileBorderRadius),
      ),
      child: Padding(padding: padding, child: child),
    );
  }
}
