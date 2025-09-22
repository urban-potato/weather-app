import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'
    show ConsumerStatefulWidget, ConsumerState;

import '../../../../shared/presentation/providers/index.dart'
    show responsiveSizeServiceProvider;
import '../../../../shared/domain/services/index.dart' show AnimatedBanner;

class NotificationBanner extends ConsumerStatefulWidget {
  const NotificationBanner({
    super.key,
    required this.message,
    required this.onDismissed,
  });

  final String message;
  final VoidCallback onDismissed;

  @override
  ConsumerState<NotificationBanner> createState() => NotificationBannerState();
}

class NotificationBannerState extends ConsumerState<NotificationBanner>
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
    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    final elevation = sizeService.screenPercentage(0.9);
    final sidesPadding = sizeService.sidesPadding;
    final tileBorderRadius = sizeService.borderRadius;
    final textSize = sizeService.screenPercentage(3.7);
    final hPadding = sizeService.tileHorizontalPadding;
    final vPadding = sizeService.tileVerticalPadding;

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
