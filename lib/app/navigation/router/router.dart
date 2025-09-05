import 'package:auto_route/auto_route.dart';

import '../../../features/weather/index.dart';
import 'wrappers/weather_screen_wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: WeatherRouteWrapper.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(page: TodayWeatherRoute.page, path: 'weather', initial: true),
        AutoRoute(page: WeeklyForecastRoute.page, path: 'weekForecast'),
        AutoRoute(page: MoonInfoRoute.page, path: 'moon'),
      ],
    ),
  ];
}
