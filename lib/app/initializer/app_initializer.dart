import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/presentation/providers/index.dart';
import '../services/index.dart';

ProviderScope appInitializer(Widget child) {
  return ProviderScope(
    overrides: [
      navigationServiceProvider.overrideWithValue(
        const NavigationServiceImpl(),
      ),
      notificationServiceProvider.overrideWithValue(NotificationServiceImpl()),

      responsiveSizeServiceProvider.overrideWith(
        () => ResponsiveSizeServiceImpl(),
      ),
    ],
    child: child,
  );
}
