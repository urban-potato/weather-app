import 'package:equatable/equatable.dart';

class SunModelUI extends Equatable {
  final DateTime sunrise;
  final DateTime sunset;

  const SunModelUI({required this.sunrise, required this.sunset});

  @override
  List<Object?> get props => [sunrise, sunset];
}
