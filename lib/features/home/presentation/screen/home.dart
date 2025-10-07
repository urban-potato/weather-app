import 'package:auto_route/auto_route.dart' show RoutePage, AutoRouter;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:talker_flutter/talker_flutter.dart' show Talker;

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<Talker>().debug('HomeScreen build');

    return const AutoRouter();
  }
}
