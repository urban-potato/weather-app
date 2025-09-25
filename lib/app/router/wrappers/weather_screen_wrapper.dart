import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/weather/index.dart';
import '../../factories/di_container.dart';
import '../router.dart';

@RoutePage()
class WeatherScreenWrapper extends StatelessWidget {
  const WeatherScreenWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => getIt<WeatherCubit>()..loadWeather(),
      // child: const AutoRouter(),
      child: AutoTabsRouter(
        routes: const [
          TodayWeatherRoute(),
          WeeklyForecastRoute(),
          MoonInfoRoute(),
        ],
        builder: (context, child) => child,
        transitionBuilder: (context, child, animation) =>
            FadeTransition(opacity: animation, child: child),
      ),
    );
  }
}
