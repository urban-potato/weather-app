import 'dart:async' show Timer;

import 'package:flutter/material.dart';

import '../../size_helper/index.dart' show ScreenBasedSize;

class NotificationBanner extends StatefulWidget {
  const NotificationBanner({
    super.key,
    required this.message,
    required this.statusBarHeight,
    required this.onDismissed,
  });

  final String message;
  final double statusBarHeight;
  final VoidCallback onDismissed;

  @override
  State<NotificationBanner> createState() => NotificationBannerState();
}

class NotificationBannerState extends State<NotificationBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    ScreenBasedSize.instance.init(context);

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();

    Timer(const Duration(seconds: 5), () {
      if (mounted) {
        _controller.reverse().then((_) => widget.onDismissed());
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final elevation = ScreenBasedSize.instance.scaleByUnit(0.9);
    final spacing = ScreenBasedSize.instance.scaleByUnit(1.4);
    final textPadding = ScreenBasedSize.instance.scaleByUnit(3.3);
    final sidesPadding = ScreenBasedSize.instance.sidesPadding;
    final tileBorderRadius = ScreenBasedSize.instance.borderRadius;
    final appBarHeight = ScreenBasedSize.instance.toolbarHeight;

    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          spacing: spacing,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: appBarHeight),
            Padding(
              padding: EdgeInsets.only(bottom: tileBorderRadius),
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  widget.onDismissed();
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: sidesPadding),
                  child: _ThemedMaterial(
                    elevation: elevation,
                    tileBorderRadius: tileBorderRadius,
                    textPadding: textPadding,
                    widget: widget,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ThemedMaterial extends StatelessWidget {
  const _ThemedMaterial({
    required this.elevation,
    required this.tileBorderRadius,
    required this.textPadding,
    required this.widget,
  });

  final double elevation;
  final double tileBorderRadius;
  final double textPadding;
  final NotificationBanner widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(tileBorderRadius),
      color: theme.cardColor,
      child: Padding(
        padding: EdgeInsets.all(textPadding),
        child: Text(
          widget.message,
          style: theme.textTheme.bodyMedium,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
