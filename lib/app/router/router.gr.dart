// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

/// generated route for
/// [HomeScreen]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}

/// generated route for
/// [LocationsManagerScreen]
class LocationsManagerRoute extends PageRouteInfo<void> {
  const LocationsManagerRoute({List<PageRouteInfo>? children})
    : super(LocationsManagerRoute.name, initialChildren: children);

  static const String name = 'LocationsManagerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LocationsManagerScreen();
    },
  );
}

/// generated route for
/// [MoonInfoScreen]
class MoonInfoRoute extends PageRouteInfo<void> {
  const MoonInfoRoute({List<PageRouteInfo>? children})
    : super(MoonInfoRoute.name, initialChildren: children);

  static const String name = 'MoonInfoRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MoonInfoScreen();
    },
  );
}

/// generated route for
/// [SettingsScreen]
class SettingsRoute extends PageRouteInfo<void> {
  const SettingsRoute({List<PageRouteInfo>? children})
    : super(SettingsRoute.name, initialChildren: children);

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsScreen();
    },
  );
}

/// generated route for
/// [TodayWeatherScreen]
class TodayWeatherRoute extends PageRouteInfo<TodayWeatherRouteArgs> {
  TodayWeatherRoute({
    Key? key,
    bool navError = false,
    List<PageRouteInfo>? children,
  }) : super(
         TodayWeatherRoute.name,
         args: TodayWeatherRouteArgs(key: key, navError: navError),
         rawQueryParams: {'navError': navError},
         initialChildren: children,
       );

  static const String name = 'TodayWeatherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final queryParams = data.queryParams;
      final args = data.argsAs<TodayWeatherRouteArgs>(
        orElse: () => TodayWeatherRouteArgs(
          navError: queryParams.getBool('navError', false),
        ),
      );
      return TodayWeatherScreen(key: args.key, navError: args.navError);
    },
  );
}

class TodayWeatherRouteArgs {
  const TodayWeatherRouteArgs({this.key, this.navError = false});

  final Key? key;

  final bool navError;

  @override
  String toString() {
    return 'TodayWeatherRouteArgs{key: $key, navError: $navError}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! TodayWeatherRouteArgs) return false;
    return key == other.key && navError == other.navError;
  }

  @override
  int get hashCode => key.hashCode ^ navError.hashCode;
}

/// generated route for
/// [WeatherScreenWrapper]
class WeatherRouteWrapper extends PageRouteInfo<void> {
  const WeatherRouteWrapper({List<PageRouteInfo>? children})
    : super(WeatherRouteWrapper.name, initialChildren: children);

  static const String name = 'WeatherRouteWrapper';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const WeatherScreenWrapper());
    },
  );
}

/// generated route for
/// [WeeklyForecastScreen]
class WeeklyForecastRoute extends PageRouteInfo<void> {
  const WeeklyForecastRoute({List<PageRouteInfo>? children})
    : super(WeeklyForecastRoute.name, initialChildren: children);

  static const String name = 'WeeklyForecastRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WeeklyForecastScreen();
    },
  );
}
