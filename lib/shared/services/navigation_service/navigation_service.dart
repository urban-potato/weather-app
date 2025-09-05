import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract interface class NavigationService {
  void pushMoonInfoRoute(BuildContext context);
  void pushWeeklyForecastRoute(BuildContext context);
  void pop(BuildContext context);
}

final navigationServiceProvider = Provider<NavigationService>((ref) {
  throw UnimplementedError('NavigationService not initialized');
});
