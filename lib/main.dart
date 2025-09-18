import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/factories/di_container.dart';
import 'app/initializer/app_initializer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await getIt.allReady();

  final container = appInitializer(const App());

  runApp(container);
}
