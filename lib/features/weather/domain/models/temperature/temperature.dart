import 'package:equatable/equatable.dart';

class TemperatureModelDomain extends Equatable {
  final double celsius;
  final double fahrenheit;

  const TemperatureModelDomain({
    required this.celsius,
    required this.fahrenheit,
  });

  @override
  List<Object?> get props => [celsius, fahrenheit];
}
