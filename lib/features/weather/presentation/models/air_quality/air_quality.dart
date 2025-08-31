import 'package:equatable/equatable.dart';

class AirQualityModelUI extends Equatable {
  final double co;
  final double no2;
  final double o3;
  final double so2;
  final double pm25;
  final double pm10;
  final int gbDefraIndex;

  const AirQualityModelUI({
    required this.co,
    required this.no2,
    required this.o3,
    required this.so2,
    required this.pm25,
    required this.pm10,
    required this.gbDefraIndex,
  });

  @override
  List<Object?> get props => [co, no2, o3, so2, pm25, pm10, gbDefraIndex];
}
