import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/weather/index.dart';
import '../../factories/di_container.dart';

@RoutePage()
class WeatherScreenWrapper extends StatelessWidget implements AutoRouteWrapper {
  const WeatherScreenWrapper({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WeatherCubit>(
      create: (context) => getIt<WeatherCubit>()..loadWeather(),
      child: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
