import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app/router/router.gr.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AutoTabsScaffold(
        routes: const [WeatherRoute(), WeekForecastRoute(), MoonRoute()],
        bottomNavigationBuilder: (_, tabsRouter) {
          return NavigationBar(
            selectedIndex: tabsRouter.activeIndex,
            onDestinationSelected: tabsRouter.setActiveIndex,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            height: 55,
            destinations: const [
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
          );
        },
      ),
    );
  }
}
