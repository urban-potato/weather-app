import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../shared/providers/index.dart' show notificationServiceProvider;
import '../shared/utils/size_helper/index.dart';
import 'initializer/app_initializer.dart';
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
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    return AppInitializer(
      child: MaterialApp.router(
        routerConfig: _router.config(),
        debugShowCheckedModeBanner: false,
        title: 'Weather App',
        theme: TAppTheme.lightTheme(context),
        darkTheme: TAppTheme.darkTheme(context),
      ),
    );
  }
}
