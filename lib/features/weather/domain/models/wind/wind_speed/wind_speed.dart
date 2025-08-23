import 'package:equatable/equatable.dart';

class WindSpeedModelDomain extends Equatable {
  final double milePerHour;
  final double kilometrePerHour;

  const WindSpeedModelDomain({
    required this.milePerHour,
    required this.kilometrePerHour,
  });

  @override
  List<Object?> get props => [milePerHour, kilometrePerHour];
}
