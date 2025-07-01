import 'package:flutter/material.dart';

import '../../moon/index.dart';
import '../../weather/index.dart';
import '../../week_forecast/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentPageIndex = 0;
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          selectedIndex: _currentPageIndex,
          onDestinationSelected: _openPage,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          height: 55,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.wb_sunny_outlined),
              selectedIcon: Icon(Icons.wb_sunny_sharp),
              label: 'Today',
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_month_outlined),
              selectedIcon: Icon(Icons.calendar_month_sharp),
              label: 'Week',
            ),
            NavigationDestination(
              icon: Icon(Icons.brightness_2_outlined),
              selectedIcon: Icon(Icons.brightness_2_sharp),
              label: 'Moon',
            ),
          ],
        ),
        body: PageView(
          controller: _pageController,
          onPageChanged: (int index) {
            setState(() => _currentPageIndex = index);
          },
          children: [WeatherScreen(), WeekForecastScreen(), MoonScreen()],
        ),
      ),
    );
  }

  void _openPage(int index) {
    setState(() => _currentPageIndex = index);
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }
}
