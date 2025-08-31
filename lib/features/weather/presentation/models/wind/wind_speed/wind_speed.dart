import 'package:equatable/equatable.dart';

class WindSpeedModelUI extends Equatable {
  final double milePerHour;
  final double kilometrePerHour;

  const WindSpeedModelUI({
    required this.milePerHour,
    required this.kilometrePerHour,
  });

  @override
  List<Object?> get props => [milePerHour, kilometrePerHour];
}
