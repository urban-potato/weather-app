part of '../navigation.dart';

extension AppRouteExtensions on AppRoute {
  PageRouteInfo get routeInfo {
    switch (this) {
      case AppRoute.today:
        return TodayWeatherRoute();
      case AppRoute.weeklyForecast:
        return const WeeklyForecastRoute();
      case AppRoute.moonInfo:
        return const MoonInfoRoute();
      case AppRoute.locationsManager:
        return const LocationsManagerRoute();
      case AppRoute.settings:
        return const SettingsRoute();
    }
  }
}
