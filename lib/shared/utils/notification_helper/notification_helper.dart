import 'dart:async' show Timer;

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import 'ui/notification_banner.dart';

abstract interface class AnimatedBanner<S extends StatefulWidget>
    implements State<S> {
  void dismissWithAnimation();
}

abstract class NotificationHelper {
  static Timer? _timer;
  static OverlayEntry? _currentOverlay;
  static final GlobalKey<AnimatedBanner<NotificationBanner>> _bannerKey =
      GlobalKey<AnimatedBanner<NotificationBanner>>();
  static final _statusBarHeight =
      WidgetsBinding.instance.platformDispatcher.views.first.viewPadding.top /
      WidgetsBinding
          .instance
          .platformDispatcher
          .views
          .first
          .display
          .devicePixelRatio;

  static void showMessage(BuildContext context, String message) {
    if (kDebugMode)
      print('------- statusBarHeight = $_statusBarHeight ---------');

    if (kDebugMode)
      print(
        '+++++ TodayWeatherScreen BlocBuilder listener _Messenger showErrorMessage +++++',
      );

    _dismiss();

    _currentOverlay = OverlayEntry(
      builder: (context) {
        if (kDebugMode)
          print(
            '+++++ TodayWeatherScreen BlocBuilder listener _Messenger showErrorMessage OverlayEntry +++++',
          );

        return Positioned(
          top: _statusBarHeight,
          left: 0,
          right: 0,
          child: NotificationBanner(
            key: _bannerKey,
            message: message,
            statusBarHeight: _statusBarHeight,
            onDismissed: () {
              _dismiss();
            },
          ),
        );
      },
    );

    Overlay.of(context).insert(_currentOverlay!);

    _timer = Timer(const Duration(seconds: 5), () {
      if (kDebugMode) print('+++++ Auto-dismiss triggered +++++');
      _performAnimatedDismiss();
    });
  }

  static void _performAnimatedDismiss() {
    final bannerState = _bannerKey.currentState;

    if (bannerState != null && bannerState.mounted) {
      bannerState.dismissWithAnimation();
    } else {
      _dismiss();
    }
  }

  static void _dismiss() {
    _timer?.cancel();
    _timer = null;
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}
