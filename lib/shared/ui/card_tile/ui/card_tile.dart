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

    final theme = Theme.of(context);
    final screenMinSide = ScreenBasedSize.instance.screenMinSide;
    final tileBorderRadius = screenMinSide / 25.7;
    final hPadding = ScreenBasedSize.instance.scaleByUnit(3.5);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(3);

    final finalPadding =
        padding ??
        EdgeInsetsGeometry.symmetric(horizontal: hPadding, vertical: vPadding);

    final finalColor =
        color?.withValues(alpha: 0.8) ?? theme.cardColor.withValues(alpha: 0.8);

    print('CardTile');

    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth,
        maxWidth: maxWidth,
        minHeight: minHeight,
        maxHeight: maxHeight,
      ),
      width: width,
      height: height,
      padding: finalPadding,
      decoration: BoxDecoration(
        color: finalColor,
        borderRadius: BorderRadius.circular(tileBorderRadius),
      ),
      child: child,
    );
  }
}
