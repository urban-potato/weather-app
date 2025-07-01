import 'package:flutter/material.dart';

class BasicTile extends StatelessWidget {
  const BasicTile({
    super.key,
    required this.child,
    this.padding,
    this.width,
    this.height,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: theme.cardColor.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(16),
      ),
      child: child,
    );
  }
}
