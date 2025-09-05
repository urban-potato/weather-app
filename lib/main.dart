import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/factories/di_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  await getIt.allReady();

  runApp(const App());
}
