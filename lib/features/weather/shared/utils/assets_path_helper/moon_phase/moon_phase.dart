import '../../../resources/index.dart';

enum MoonPhase {
  newMoon,
  waxingCrescent,
  firstQuarter,
  waxingGibbous,
  fullMoon,
  waningGibbous,
  lastQuarter,
  waningCrescent,
  unknown,
}

MoonPhase parseMoonPhase(String moonPhase) {
  switch (moonPhase) {
    case 'New Moon':
      return MoonPhase.newMoon;
    case 'Waxing Crescent':
      return MoonPhase.waxingCrescent;
    case 'First Quarter':
      return MoonPhase.firstQuarter;
    case 'Waxing Gibbous':
      return MoonPhase.waxingGibbous;
    case 'Full Moon':
      return MoonPhase.fullMoon;
    case 'Waning Gibbous':
      return MoonPhase.waningGibbous;
    case 'Last Quarter':
      return MoonPhase.lastQuarter;
    case 'Waning Crescent':
      return MoonPhase.waningCrescent;
    default:
      return MoonPhase.unknown;
  }
}

String getMoonPhaseAssetPath(String moonPhase) {
  final moonPhaseParsed = parseMoonPhase(moonPhase);

  final moonImage = switch (moonPhaseParsed) {
    MoonPhase.newMoon => AppSvgs.moonPhases.newMoon,
    MoonPhase.waxingCrescent => AppSvgs.moonPhases.waxingCrescent,
    MoonPhase.firstQuarter => AppSvgs.moonPhases.firstQuarter,
    MoonPhase.waxingGibbous => AppSvgs.moonPhases.waxingGibbous,
    MoonPhase.fullMoon => AppSvgs.moonPhases.fullMoon,
    MoonPhase.waningGibbous => AppSvgs.moonPhases.waningGibbous,
    MoonPhase.lastQuarter => AppSvgs.moonPhases.lastQuarter,
    MoonPhase.waningCrescent => AppSvgs.moonPhases.waningCrescent,
    MoonPhase.unknown => AppSvgs.unknown,
  };

  return moonImage;
}
