import 'dart:developer' show log;

import 'package:auto_route/auto_route.dart' show RoutePage, AutoRouter;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      log('------------------- MainScreen build -------------------');

    return const AutoRouter();
  }
}
