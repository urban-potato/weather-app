import 'package:equatable/equatable.dart';

class MoonModelUI extends Equatable {
  final String phase;
  final DateTime? moonrise;
  final DateTime? moonset;
  final int illumination;

  const MoonModelUI({
    required this.phase,
    required this.moonrise,
    required this.moonset,
    required this.illumination,
  });

  @override
  List<Object?> get props => [phase, moonrise, moonset, illumination];
}
