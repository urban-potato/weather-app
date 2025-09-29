import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../features/locations_manager/index.dart'
    show LocationsManagerScreen;
import '../../features/settings/index.dart' show SettingsScreen;
import '../../features/weather/index.dart'
    show TodayWeatherScreen, WeeklyForecastScreen, MoonInfoScreen;
import '../../features/home/presentation/screen/home.dart';
import '../../shared/infrastructure/configs/router_paths.dart';
import 'wrappers/weather_screen_wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: RouterPaths.root.relativePath,
      initial: true,
      children: [
        RedirectRoute(path: '', redirectTo: RouterPaths.weather.relativePath),
        AutoRoute(
          page: WeatherRouteWrapper.page,
          path: RouterPaths.weather.relativePath,
          initial: true,
          children: [
            RedirectRoute(path: '', redirectTo: RouterPaths.today.relativePath),
            AutoRoute(
              page: TodayWeatherRoute.page,
              path: RouterPaths.today.relativePath,
              initial: true,
            ),
            AutoRoute(
              page: WeeklyForecastRoute.page,
              path: RouterPaths.weeklyForecast.relativePath,
            ),
            AutoRoute(
              page: MoonInfoRoute.page,
              path: RouterPaths.moonInfo.relativePath,
            ),
          ],
        ),
        AutoRoute(
          page: LocationsManagerRoute.page,
          path: RouterPaths.locationsManager.relativePath,
        ),
        AutoRoute(
          page: SettingsRoute.page,
          path: RouterPaths.settings.relativePath,
        ),
      ],
    ),
  ];
}
