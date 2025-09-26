import 'dart:developer' show log;

import 'package:auto_route/auto_route.dart' show RootStackRouter, StackRouter;
import 'package:flutter/foundation.dart' show kDebugMode;

import '../../../shared/presentation/services/index.dart'
    show NavigationService, AppRoute;

class NavigationServiceImpl implements NavigationService {
  NavigationServiceImpl(RootStackRouter appRouter) : _appRouter = appRouter;

  final RootStackRouter _appRouter;

  @override
  void push(AppRoute route) {
    final topRouter = _appRouter.topMostRouter(ignorePagelessRoutes: true);

    try {
      if (kDebugMode)
        log(
          'Pushing to topRouter: ${topRouter.runtimeType}. Path: ${route.routerPath.relativePath}. Current path: ${_appRouter.currentPath}',
        );

      (topRouter as StackRouter).pushPath(route.routerPath.relativePath);
    } catch (e) {
      if (kDebugMode)
        log(
          'Pushing to _appRouter: ${_appRouter.runtimeType}. Path: ${route.routerPath.relativePath}. Current path: ${_appRouter.currentPath}',
        );

      _appRouter.pushPath(route.routerPath.relativePath);
    }
  }

  @override
  void pop() {
    final topRouter = _appRouter.topMostRouter(ignorePagelessRoutes: true);

    try {
      if (kDebugMode)
        log(
          'Popping from topRouter: ${topRouter.runtimeType}. Current path: ${_appRouter.currentPath}',
        );

      (topRouter as StackRouter).pop();
    } catch (e) {
      if (kDebugMode)
        log(
          'Popping from _appRouter: ${_appRouter.runtimeType}. Current path: ${_appRouter.currentPath}',
        );

      _appRouter.pop();
    }
  }
}
