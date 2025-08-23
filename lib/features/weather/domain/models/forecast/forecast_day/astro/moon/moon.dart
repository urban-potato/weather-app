import 'package:equatable/equatable.dart';

class MoonModelDomain extends Equatable {
  final DateTime moonrise;
  final DateTime moonset;
  final String moonPhase;
  final double moonIllumination;

  const MoonModelDomain({
    required this.moonrise,
    required this.moonset,
    required this.moonPhase,
    required this.moonIllumination,
  });

  @override
  List<Object?> get props => [moonrise, moonset, moonPhase, moonIllumination];
}
