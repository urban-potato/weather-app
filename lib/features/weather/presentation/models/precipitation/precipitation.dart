import 'package:equatable/equatable.dart';

class PrecipitationModelUI extends Equatable {
  final int chanceOfRain;
  final int chanceOfSnow;

  const PrecipitationModelUI({
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });

  @override
  List<Object?> get props => [chanceOfRain, chanceOfSnow];
}
