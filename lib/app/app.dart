import 'package:flutter/material.dart';
import 'package:weather_app/shared/lib/adjustable_size/index.dart';

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
    const primaryColor = Color(0xFF0099FF);

    return MaterialApp.router(
      routerConfig: _router.config(),
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFBAE3FF),
      ),
    );
  }
}
