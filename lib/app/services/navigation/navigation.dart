import 'dart:developer' show log;

import 'package:auto_route/auto_route.dart'
    show PageRouteInfo, RootStackRouter, StackRouter;
import 'package:flutter/foundation.dart' show kDebugMode;

import '../../../shared/presentation/services/index.dart'
    show NavigationService, AppRoute;

import '../../router/index.dart'
    show
        TodayWeatherRoute,
        WeeklyForecastRoute,
        MoonInfoRoute,
        LocationsManagerRoute,
        SettingsRoute;

part 'extensions/app_route.dart';

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

      (topRouter as StackRouter).push(route.routeInfo);
    } catch (e) {
      if (kDebugMode)
        log(
          'Path: ${route.routerPath.relativePath}. Current path: ${_appRouter.currentPath}.\nError push: $e',
        );

      _appRouter.replaceAll(
        [TodayWeatherRoute(navError: true)],
        updateExistingRoutes: false,
        onFailure: (failure) => log(failure.toString()),
      );
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
        log('Current path: ${_appRouter.currentPath}.\nError pop: $e');

      _appRouter.replaceAll(
        [TodayWeatherRoute(navError: true)],
        updateExistingRoutes: false,
        onFailure: (failure) => log(failure.toString()),
      );
    }
  }
}
