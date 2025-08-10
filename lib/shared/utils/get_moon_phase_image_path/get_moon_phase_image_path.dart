import '../../resources/resources.dart';

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

String getMoonPhaseImagePath(String moonPhase) {
  final moonPhaseParsed = parseMoonPhase(moonPhase);

  final moonImage = switch (moonPhaseParsed) {
    MoonPhase.newMoon => Images.newMoon,
    MoonPhase.waxingCrescent => Images.waxingCrescent,
    MoonPhase.firstQuarter => Images.firstQuarter,
    MoonPhase.waxingGibbous => Images.waxingGibbous,
    MoonPhase.fullMoon => Images.fullMoon,
    MoonPhase.waningGibbous => Images.waningGibbous,
    MoonPhase.lastQuarter => Images.lastQuarter,
    MoonPhase.waningCrescent => Images.waningCrescent,
    MoonPhase.unknown => Images.unknown,
  };

  return moonImage;
}
