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
    MoonPhase.newMoon => Svgs.moonPhases.newMoon,
    MoonPhase.waxingCrescent => Svgs.moonPhases.waxingCrescent,
    MoonPhase.firstQuarter => Svgs.moonPhases.firstQuarter,
    MoonPhase.waxingGibbous => Svgs.moonPhases.waxingGibbous,
    MoonPhase.fullMoon => Svgs.moonPhases.fullMoon,
    MoonPhase.waningGibbous => Svgs.moonPhases.waningGibbous,
    MoonPhase.lastQuarter => Svgs.moonPhases.lastQuarter,
    MoonPhase.waningCrescent => Svgs.moonPhases.waningCrescent,
    MoonPhase.unknown => Svgs.unknown,
  };

  return moonImage;
}
