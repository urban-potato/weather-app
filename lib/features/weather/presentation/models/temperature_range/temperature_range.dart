import 'package:equatable/equatable.dart';

import '../temperature/temperature.dart';

class TemperatureRangeModelUI extends Equatable {
  final TemperatureModelUI maximum;
  final TemperatureModelUI minimum;

  const TemperatureRangeModelUI({required this.maximum, required this.minimum});

  @override
  List<Object?> get props => [maximum, minimum];
}
