import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc;
import 'package:talker_bloc_logger/talker_bloc_logger.dart'
    show TalkerBlocLoggerSettings, TalkerBlocObserver;
import 'package:talker_flutter/talker_flutter.dart' show TalkerFlutter;
import 'app/app.dart';
import 'app/app_config.dart';
import 'app/factories/di_container.dart';
import 'app/initializer/app_initializer.dart';
import 'app/router/index.dart' show AppRouter;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final router = AppRouter();
  final talker = TalkerFlutter.init();
  talker.verbose('Talker initialized');

  Bloc.observer = TalkerBlocObserver(
    talker: talker,
    settings: const TalkerBlocLoggerSettings(
      printChanges: true,
      printEventFullData: false,
      printStateFullData: false,
      printCreations: true,
      printClosings: true,
    ),
  );

  final config = AppConfig(talker: talker, router: router);

  await initializeDependencies(config: config);
  await getIt.allReady();

  runApp(AppInitializer(config: config, child: const App()));
}
