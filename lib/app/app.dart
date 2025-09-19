import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/providers/index.dart'
    show notificationServiceProvider, responsiveSizeServiceProvider;
import 'router/index.dart';
import 'theme/index.dart';

class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  ConsumerState<App> createState() => _AppState();
}

class _AppState extends ConsumerState<App> with WidgetsBindingObserver {
  final _router = AppRouter();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
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
      if (kDebugMode) print('+++++ App detached - disposing services +++++');

      final notificationService = ref.read(notificationServiceProvider);
      notificationService.dispose();
    }
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sizeService = ref.read(responsiveSizeServiceProvider);

    sizeService.init(context);

    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: TAppTheme.lightTheme(sizeService),
      darkTheme: TAppTheme.darkTheme(sizeService),
    );
  }
}
