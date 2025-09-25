import 'package:auto_route/auto_route.dart';

import '../../features/locations_manager/index.dart'
    show LocationsManagerScreen;
import '../../features/settings/index.dart' show SettingsScreen;
import '../../features/weather/index.dart'
    show TodayWeatherScreen, WeeklyForecastScreen, MoonInfoScreen;
import '../../features/home/presentation/screen/home.dart';
import 'wrappers/weather_screen_wrapper.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: MainRoute.page,
      path: '/',
      initial: true,
      children: [
        AutoRoute(
          page: WeatherRouteWrapper.page,
          path: 'weather',
          // path: '/',
          initial: true,
          children: [
            AutoRoute(
              page: TodayWeatherRoute.page,
              // path: 'weather',
              path: '',
              initial: true,
            ),
            AutoRoute(page: WeeklyForecastRoute.page, path: 'weekForecast'),
            AutoRoute(page: MoonInfoRoute.page, path: 'moon'),
          ],
        ),
        AutoRoute(page: LocationsManagerRoute.page, path: 'locations'),
        AutoRoute(page: SettingsRoute.page, path: 'settings'),
      ],
    ),
  ];
}

// @AutoRouterConfig()
// class AppRouter extends RootStackRouter {
//   @override
//   List<AutoRoute> get routes => [
//     AutoRoute(
//       page: WeatherRouteWrapper.page,
//       path: '/',
//       // initial: true,
//       children: [
//         AutoRoute(
//           page: TodayWeatherRoute.page,
//           // path: 'weather',
//           path: '',
//           // initial: true
//         ),
//         AutoRoute(page: WeeklyForecastRoute.page, path: 'weekForecast'),
//         AutoRoute(page: MoonInfoRoute.page, path: 'moon'),
//       ],
//     ),
//   ];
// }
