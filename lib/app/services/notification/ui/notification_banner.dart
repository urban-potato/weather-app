import 'package:flutter/material.dart';

import '../../../../shared/services/index.dart' show AnimatedBanner;
import '../../../../shared/utils/size_helper/index.dart' show ScreenBasedSize;

class NotificationBanner extends StatefulWidget {
  const NotificationBanner({
    super.key,
    required this.message,
    required this.onDismissed,
  });

  final String message;
  final VoidCallback onDismissed;

  @override
  State<NotificationBanner> createState() => NotificationBannerState();
}

class NotificationBannerState extends State<NotificationBanner>
    with SingleTickerProviderStateMixin
    implements AnimatedBanner<NotificationBanner> {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: const Offset(0, 0),
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ScreenBasedSize.instance.init(context);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void dismissWithAnimation() {
    _controller.reverse().then((_) {
      if (mounted) {
        widget.onDismissed();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final elevation = ScreenBasedSize.instance.scaleByUnit(0.9);
    final sidesPadding = ScreenBasedSize.instance.sidesPadding;
    final tileBorderRadius = ScreenBasedSize.instance.borderRadius;
    final textSize = ScreenBasedSize.instance.scaleByUnit(3.7);
    final hPadding = ScreenBasedSize.instance.tileHorizontalPadding;
    final vPadding = ScreenBasedSize.instance.tileVerticalPadding;

    final textPadding = EdgeInsetsGeometry.symmetric(
      horizontal: hPadding,
      vertical: vPadding,
    );

    return Semantics(
      label: widget.message,
      hint: 'Swipe to dismiss',
      child: ClipRect(
        clipBehavior: Clip.hardEdge,
        child: SlideTransition(
          position: _slideAnimation,
          child: Padding(
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
                  textSize: textSize,
                  widget: widget,
                ),
              ),
            ),
          ),
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
    required this.textSize,
    required this.widget,
  });

  final double elevation;
  final double tileBorderRadius;
  final EdgeInsetsGeometry textPadding;
  final double textSize;
  final NotificationBanner widget;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(tileBorderRadius),
      color: theme.cardColor,
      child: Padding(
        padding: textPadding,
        child: Text(
          widget.message,
          style: theme.textTheme.bodyMedium?.copyWith(fontSize: textSize),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
