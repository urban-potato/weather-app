import 'dart:developer';

import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:talker_flutter/talker_flutter.dart';

import '../shared/presentation/providers/index.dart'
    show notificationServiceProvider, responsiveSizeServiceProvider;
import 'router/index.dart' show appRouterProvider;
import 'theme/index.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);

    if (!sizeService.isInitialized) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final size = MediaQuery.of(context).size;

        sizeService.updateReferenceScreenSize(
          width: size.width,
          height: size.height,
        );

        if (kDebugMode)
          log(
            '+++++++++ ResponsiveSize init: ${sizeService.referenceScreenSize} +++++++++',
          );
      });
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    if (state == AppLifecycleState.detached) {
      if (kDebugMode) log('+++++ App detached - disposing services +++++');

      final notificationService = ref.read(notificationServiceProvider);
      notificationService.dispose();
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final size = MediaQuery.of(context).size;

    sizeService.updateReferenceScreenSize(
      width: size.width,
      height: size.height,
    );

    if (kDebugMode)
      log('++++++++++++++++++ didChangeMetrics ++++++++++++++++++');
  }

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      log(
        '++++++++++++++++++++++++++++++ App build +++++++++++++++++++++++++++++++',
      );

    ref.watch(responsiveSizeServiceProvider);

    final sizeService = ref.read(responsiveSizeServiceProvider.notifier);
    final router = ref.read(appRouterProvider);
    final talker = context.read<Talker>();

    return MaterialApp.router(
      routerConfig: router.config(
        navigatorObservers: () => [TalkerRouteObserver(talker)],
      ),
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: TAppTheme.lightTheme(sizeService),
      darkTheme: TAppTheme.darkTheme(sizeService),
    );
  }
}
