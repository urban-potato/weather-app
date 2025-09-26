import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../shared/presentation/services/index.dart';
import '../../router/index.dart';

class NavigationServiceImpl implements NavigationService {
  const NavigationServiceImpl();

  @override
  void pushMoonInfoRoute(BuildContext context) {
    context.router.push(const MoonInfoRoute());
  }

  @override
  void pushWeeklyForecastRoute(BuildContext context) {
    context.router.push(const WeeklyForecastRoute());
  }

  @override
  void pushLocationsManagerRoute(BuildContext context) {
    context.router.push(const LocationsManagerRoute());
  }

  @override
  void pushSettingsRoute(BuildContext context) {
    context.router.push(const SettingsRoute());
  }

  @override
  void pop(BuildContext context) {
    context.router.pop();
  }
}
