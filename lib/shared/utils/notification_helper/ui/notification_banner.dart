import 'dart:async' show Timer;

import 'package:flutter/material.dart';

class NotificationBanner extends StatefulWidget {
  const NotificationBanner({
    super.key,
    required this.message,
    required this.statusBarHeight,
    required this.appBarHeight,
    required this.onDismissed,
  });

  final String message;
  final double statusBarHeight;
  final double appBarHeight;
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
    final theme = Theme.of(context);

    // TODO: убрать хардкод значений
    return ClipRect(
      clipBehavior: Clip.hardEdge,
      child: SlideTransition(
        position: _slideAnimation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: widget.appBarHeight),
            const SizedBox(height: 6),
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.horizontal,
                onDismissed: (direction) {
                  widget.onDismissed();
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(8),
                    color: theme.cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Text(
                        widget.message,
                        style: theme.textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),
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
