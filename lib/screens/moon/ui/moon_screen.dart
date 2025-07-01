import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MoonScreen extends StatelessWidget {
  const MoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Moon')));
  }
}
