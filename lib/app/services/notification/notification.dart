import 'dart:async' show Timer;

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import '../../../shared/presentation/services/index.dart'
    show NotificationService, AnimatedBanner;
import 'ui/notification_banner.dart';

class NotificationServiceImpl implements NotificationService {
  Timer? _timer;
  OverlayEntry? _currentOverlay;

  @override
  void showMessage(BuildContext context, String message, {int duration = 5}) {
    if (kDebugMode)
      print(
        '+++++ TodayWeatherScreen BlocBuilder listener _Messenger showErrorMessage +++++',
      );

    _dismiss();

    final statusBarHeight =
        WidgetsBinding.instance.platformDispatcher.views.first.viewPadding.top /
        WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .display
            .devicePixelRatio;

    if (kDebugMode)
      print('------- statusBarHeight = $statusBarHeight ---------');

    final GlobalKey<AnimatedBanner<StatefulWidget>> bannerKey =
        GlobalKey<AnimatedBanner<StatefulWidget>>();

    _currentOverlay = OverlayEntry(
      builder: (context) {
        if (kDebugMode)
          print(
            '+++++ TodayWeatherScreen BlocBuilder listener _Messenger showErrorMessage OverlayEntry +++++',
          );

        return Positioned(
          top: statusBarHeight,
          left: 0,
          right: 0,
          child: NotificationBanner(
            key: bannerKey,
            message: message,
            onDismissed: _dismiss,
          ),
        );
      },
    );

    Overlay.of(context).insert(_currentOverlay!);

    _timer = Timer(Duration(seconds: duration), () {
      if (kDebugMode) print('+++++ Auto-dismiss triggered +++++');
      _performAnimatedDismiss(bannerKey);
    });
  }

  void _performAnimatedDismiss(
    GlobalKey<AnimatedBanner<StatefulWidget>> bannerKey,
  ) {
    final bannerState = bannerKey.currentState;

    if (bannerState != null && bannerState.mounted) {
      bannerState.dismissWithAnimation();
    } else {
      _dismiss();
    }
  }

  void _dismiss() {
    _timer?.cancel();
    _timer = null;
    _currentOverlay?.remove();
    _currentOverlay = null;
  }

  @override
  void dispose() {
    if (kDebugMode) print('+++++ NotificationServiceImpl dispose() +++++');
    _dismiss();
  }
}
