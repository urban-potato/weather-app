import 'package:flutter/material.dart';
import 'package:weather_app/shared/utils/theme/index.dart';

import '../shared/utils/adjustable_size/index.dart';
import 'router/router.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: TAppTheme.lightTheme(context),
      darkTheme: TAppTheme.darkTheme(context),
    );
  }
}
