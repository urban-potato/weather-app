import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../shared/domain/services/index.dart';
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
  void pop(BuildContext context) {
    context.router.pop();
  }
}
