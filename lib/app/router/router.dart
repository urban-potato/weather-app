import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: HomeRoute.page,
      path: '/',
      children: [
        AutoRoute(page: WeatherRoute.page, path: 'weather'),
        AutoRoute(page: WeekForecastRoute.page, path: 'weekForecast'),
        AutoRoute(page: MoonRoute.page, path: 'moon'),
      ],
    ),
  ];
}
