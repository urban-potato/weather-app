import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

import 'ui/notification_banner.dart';

abstract class NotificationHelper {
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

    OverlayEntry? overlayEntry;

    overlayEntry = OverlayEntry(
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
            message: message,
            statusBarHeight: _statusBarHeight,
            onDismissed: () {
              overlayEntry?.remove();
            },
          ),
        );
      },
    );

    Overlay.of(context).insert(overlayEntry);
  }
}
