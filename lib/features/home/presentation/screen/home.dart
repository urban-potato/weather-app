import 'dart:developer' show log;

import 'package:auto_route/auto_route.dart' show RoutePage, AutoRouter;
import 'package:flutter/foundation.dart' show kDebugMode;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/presentation/ui/custom_sliver_app_bar/index.dart';
import '../provider/home_cubit.dart';
import '../provider/home_state.dart';

@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    if (kDebugMode)
      log('------------------- MainScreen build -------------------');

    return Scaffold(
      body: SafeArea(
        child: BlocProvider<HomeCubit>(
          create: (context) => HomeCubit(),
          child: CustomScrollView(
            slivers: [
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if (kDebugMode)
                    log(
                      '------------------- MainScreen BlocBuilder -------------------',
                    );

                  return CustomSliverAppBar(appBarModelUI: state.appBar);
                },
              ),
              const SliverFillRemaining(child: AutoRouter()),
            ],
          ),
        ),
      ),
    );
  }
}
