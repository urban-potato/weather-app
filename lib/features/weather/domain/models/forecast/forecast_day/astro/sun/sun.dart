import 'package:equatable/equatable.dart';

class SunModelDomain extends Equatable {
  final DateTime sunrise;
  final DateTime sunset;

  const SunModelDomain({required this.sunrise, required this.sunset});

  @override
  List<Object?> get props => [sunrise, sunset];
}
