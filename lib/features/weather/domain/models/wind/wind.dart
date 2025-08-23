import 'package:equatable/equatable.dart';

import 'wind_speed/wind_speed.dart';

class WindModelDomain extends Equatable {
  final WindSpeedModelDomain speed;
  final String direction;

  const WindModelDomain({required this.speed, required this.direction});

  @override
  List<Object?> get props => [speed, direction];
}
