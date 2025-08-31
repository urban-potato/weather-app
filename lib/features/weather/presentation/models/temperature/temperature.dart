import 'package:equatable/equatable.dart';

class TemperatureModelUI extends Equatable {
  final int celsius;
  final int fahrenheit;

  const TemperatureModelUI({required this.celsius, required this.fahrenheit});

  @override
  List<Object?> get props => [celsius, fahrenheit];
}
