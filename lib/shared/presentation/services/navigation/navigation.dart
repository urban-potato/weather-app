import 'package:flutter/material.dart';

abstract interface class NavigationService {
  void pushMoonInfoRoute(BuildContext context);
  void pushWeeklyForecastRoute(BuildContext context);
  void pushSettingsRoute(BuildContext context);
  void pushLocationsManagerRoute(BuildContext context);
  void pop(BuildContext context);
}
