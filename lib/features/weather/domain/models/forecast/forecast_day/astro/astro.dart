import 'package:equatable/equatable.dart';

import 'moon/moon.dart';
import 'sun/sun.dart';

class AstroModelDomain extends Equatable {
  final SunModelDomain sun;
  final MoonModelDomain moon;

  const AstroModelDomain({required this.sun, required this.moon});

  @override
  List<Object?> get props => [sun, moon];
}
