import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:weather_app/shared/utils/notification_helper/ui/notification_banner.dart';

import '../size_helper/index.dart';

abstract class NotificationHelper {
  static void showMessage(BuildContext context, String message) {
    OverlayEntry? overlayEntry;

    final double statusBarHeight =
        WidgetsBinding.instance.platformDispatcher.views.first.viewPadding.top /
        WidgetsBinding
            .instance
            .platformDispatcher
            .views
            .first
            .display
            .devicePixelRatio;

    print(
      '------------------------ statusBarHeight = $statusBarHeight ------------------------------',
    );

    // TODO: вынести куда-то или получать высоту апп бара
    ScreenBasedSize.instance.init(context);
    final double appBarHeight = ScreenBasedSize.instance.scaleByUnit(12);

    if (kDebugMode)
      print(
        '+++++ TodayWeatherScreen BlocBuilder listener _Messenger showErrorMessage +++++',
      );

    overlayEntry = OverlayEntry(
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
            message: message,
            statusBarHeight: statusBarHeight,
            appBarHeight: appBarHeight,
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
