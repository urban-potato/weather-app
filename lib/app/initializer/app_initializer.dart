import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/services/index.dart';
import '../services/index.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      overrides: [
        navigationServiceProvider.overrideWithValue(
          const NavigationServiceImpl(),
        ),
      ],
      child: child,
    );
  }
}
