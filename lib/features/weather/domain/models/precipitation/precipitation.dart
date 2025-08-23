import 'package:equatable/equatable.dart';

class PrecipitationModelDomain extends Equatable {
  final int chanceOfRain;
  final int chanceOfSnow;

  const PrecipitationModelDomain({
    required this.chanceOfRain,
    required this.chanceOfSnow,
  });

  @override
  List<Object?> get props => [chanceOfRain, chanceOfSnow];
}
