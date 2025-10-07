import 'package:auto_route/auto_route.dart'
    show PageRouteInfo, RootStackRouter, StackRouter;

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
      (topRouter as StackRouter).push(route.routeInfo);
    } catch (e) {
      _appRouter.replaceAll([
        TodayWeatherRoute(navError: true),
      ], updateExistingRoutes: false);
    }
  }

  @override
  void pop() {
    final topRouter = _appRouter.topMostRouter(ignorePagelessRoutes: true);

    try {
      (topRouter as StackRouter).pop();
    } catch (e) {
      _appRouter.replaceAll([
        TodayWeatherRoute(navError: true),
      ], updateExistingRoutes: false);
    }
  }
}
