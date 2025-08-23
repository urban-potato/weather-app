import 'package:equatable/equatable.dart';

class PressureModelDomain extends Equatable {
  final double millibars;
  final double inches;

  const PressureModelDomain({required this.millibars, required this.inches});

  @override
  List<Object?> get props => [millibars, inches];
}
