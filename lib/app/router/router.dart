import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: WeatherRouteWrapper.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: WeatherRoute.page, path: 'weather', initial: true),
        AutoRoute(page: WeekForecastRoute.page, path: 'weekForecast'),
        AutoRoute(page: MoonInfoRoute.page, path: 'moon'),
      ],
    ),
  ];
}
