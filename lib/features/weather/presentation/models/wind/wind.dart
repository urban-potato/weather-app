import 'package:equatable/equatable.dart';

import 'wind_speed/wind_speed.dart';

class WindModelUI extends Equatable {
  final WindSpeedModelUI speed;
  final String direction;

  const WindModelUI({required this.speed, required this.direction});

  @override
  List<Object?> get props => [speed, direction];
}
