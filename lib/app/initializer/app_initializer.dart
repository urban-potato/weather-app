import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show RepositoryProvider;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;
import 'package:talker_riverpod_logger/talker_riverpod_logger.dart'
    show TalkerRiverpodObserver;

import '../../shared/presentation/providers/index.dart';
import '../app_config.dart';
import '../router/index.dart' show appRouterProvider;
import '../services/index.dart';

class AppInitializer extends StatelessWidget {
  const AppInitializer({super.key, required this.child, required this.config});

  final Widget child;
  final AppConfig config;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<Talker>(
      create: (context) => config.talker,
      child: ProviderScope(
        observers: [TalkerRiverpodObserver(talker: config.talker)],
        overrides: [
          appRouterProvider.overrideWithValue(config.router),
          navigationServiceProvider.overrideWithValue(
            NavigationServiceImpl(config.router),
          ),
          notificationServiceProvider.overrideWithValue(
            NotificationServiceImpl(),
          ),
          responsiveSizeServiceProvider.overrideWith(
            () => ResponsiveSizeServiceImpl(),
          ),
        ],
        child: child,
      ),
    );
  }
}
