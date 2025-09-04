import 'package:flutter/material.dart';
import 'app/app.dart';
import 'app/service_locator/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const App());
}
