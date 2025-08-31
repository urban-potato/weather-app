import 'package:equatable/equatable.dart';

import '../moon/moon.dart';

class WeeklyMoonModelUI extends Equatable {
  final List<MoonModelUI> moonList;

  const WeeklyMoonModelUI({required this.moonList});

  @override
  List<Object?> get props => [moonList];
}
