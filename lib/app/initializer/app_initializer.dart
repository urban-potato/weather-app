import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/presentation/providers/index.dart';
import '../router/index.dart' show AppRouter, appRouterProvider;
import '../services/index.dart';

ProviderScope appInitializer(Widget child) {
  final appRouter = AppRouter();

  return ProviderScope(
    overrides: [
      appRouterProvider.overrideWithValue(appRouter),
      navigationServiceProvider.overrideWithValue(
        NavigationServiceImpl(appRouter),
      ),
      notificationServiceProvider.overrideWithValue(NotificationServiceImpl()),
      responsiveSizeServiceProvider.overrideWith(
        () => ResponsiveSizeServiceImpl(),
      ),
    ],
    child: child,
  );
}
