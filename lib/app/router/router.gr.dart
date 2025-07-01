// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:weather_app/screens/home/ui/home_screen.dart' as _i1;
import 'package:weather_app/screens/moon/ui/moon_screen.dart' as _i2;
import 'package:weather_app/screens/weather/ui/weather_screen.dart' as _i3;
import 'package:weather_app/screens/week_forecast/ui/week_forecast_screen.dart'
    as _i4;

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.HomeScreen();
    },
  );
}

/// generated route for
/// [_i2.MoonScreen]
class MoonRoute extends _i5.PageRouteInfo<void> {
  const MoonRoute({List<_i5.PageRouteInfo>? children})
    : super(MoonRoute.name, initialChildren: children);

  static const String name = 'MoonRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.MoonScreen();
    },
  );
}

/// generated route for
/// [_i3.WeatherScreen]
class WeatherRoute extends _i5.PageRouteInfo<void> {
  const WeatherRoute({List<_i5.PageRouteInfo>? children})
    : super(WeatherRoute.name, initialChildren: children);

  static const String name = 'WeatherRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.WeatherScreen();
    },
  );
}

/// generated route for
/// [_i4.WeekForecastScreen]
class WeekForecastRoute extends _i5.PageRouteInfo<void> {
  const WeekForecastRoute({List<_i5.PageRouteInfo>? children})
    : super(WeekForecastRoute.name, initialChildren: children);

  static const String name = 'WeekForecastRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i4.WeekForecastScreen();
    },
  );
}
