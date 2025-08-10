// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:weather_app/app/router/wrappers/weather_screen_wrapper.dart'
    as _i3;
import 'package:weather_app/screens/moon_info/ui/moon_info_screen.dart' as _i1;
import 'package:weather_app/screens/weather/ui/weather_screen.dart' as _i2;
import 'package:weather_app/screens/week_forecast/ui/week_forecast_screen.dart'
    as _i4;

/// generated route for
/// [_i1.MoonInfoScreen]
class MoonInfoRoute extends _i5.PageRouteInfo<void> {
  const MoonInfoRoute({List<_i5.PageRouteInfo>? children})
    : super(MoonInfoRoute.name, initialChildren: children);

  static const String name = 'MoonInfoRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i1.MoonInfoScreen();
    },
  );
}

/// generated route for
/// [_i2.WeatherScreen]
class WeatherRoute extends _i5.PageRouteInfo<void> {
  const WeatherRoute({List<_i5.PageRouteInfo>? children})
    : super(WeatherRoute.name, initialChildren: children);

  static const String name = 'WeatherRoute';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i2.WeatherScreen();
    },
  );
}

/// generated route for
/// [_i3.WeatherScreenWrapper]
class WeatherRouteWrapper extends _i5.PageRouteInfo<void> {
  const WeatherRouteWrapper({List<_i5.PageRouteInfo>? children})
    : super(WeatherRouteWrapper.name, initialChildren: children);

  static const String name = 'WeatherRouteWrapper';

  static _i5.PageInfo page = _i5.PageInfo(
    name,
    builder: (data) {
      return const _i3.WeatherScreenWrapper();
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
