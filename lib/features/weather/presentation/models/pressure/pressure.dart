import 'package:equatable/equatable.dart';

class PressureModelUI extends Equatable {
  final int millibars;
  final int inches;

  const PressureModelUI({required this.millibars, required this.inches});

  @override
  List<Object?> get props => [millibars, inches];
}
