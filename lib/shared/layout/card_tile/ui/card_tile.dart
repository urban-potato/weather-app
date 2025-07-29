import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

class CardTile extends StatelessWidget {
  const CardTile({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
    this.minWidth,
    this.maxWidth,
    this.minHeight,
    this.maxHeight,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;
  final double? minWidth;
  final double? maxWidth;
  final double? minHeight;
  final double? maxHeight;

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

    return Container(
      constraints: BoxConstraints(
        minWidth: minWidth ?? 0.0,
        maxWidth: maxWidth ?? double.infinity,
        minHeight: minHeight ?? 0.0,
        maxHeight: maxHeight ?? double.infinity,
      ),
      width: width,
      height: height,
      padding: finalPadding,
      decoration: BoxDecoration(
        color: theme.cardColor.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(tileBorderRadius),
      ),
      child: child,
    );
  }
}
