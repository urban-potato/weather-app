import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../shared/services/index.dart';
import '../router/router.gr.dart';

class NavigationServiceImpl implements NavigationService {
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
