import 'package:flutter/material.dart';

import '../screens/home/index.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Color(0xFF0099FF);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primaryColor: primaryColor,
        colorScheme: ColorScheme.fromSeed(seedColor: primaryColor),
        useMaterial3: true,
        scaffoldBackgroundColor: Color(0xFFBAE3FF),
      ),
      home: HomeScreen(),
    );
  }
}
