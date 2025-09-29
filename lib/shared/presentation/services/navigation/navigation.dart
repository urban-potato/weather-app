import '../../../infrastructure/configs/router_paths.dart';

enum AppRoute {
  today(RouterPaths.today),
  weeklyForecast(RouterPaths.weeklyForecast),
  moonInfo(RouterPaths.moonInfo),
  locationsManager(RouterPaths.locationsManager),
  settings(RouterPaths.settings);

  final RouterPaths routerPath;
  const AppRoute(this.routerPath);
}

abstract interface class NavigationService {
  void push(AppRoute route);
  void pop();
}
