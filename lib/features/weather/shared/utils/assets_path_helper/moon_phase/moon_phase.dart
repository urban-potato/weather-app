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
    MoonPhase.newMoon => Svgs.moon.newMoon,
    MoonPhase.waxingCrescent => Svgs.moon.waxingCrescent,
    MoonPhase.firstQuarter => Svgs.moon.firstQuarter,
    MoonPhase.waxingGibbous => Svgs.moon.waxingGibbous,
    MoonPhase.fullMoon => Svgs.moon.fullMoon,
    MoonPhase.waningGibbous => Svgs.moon.waningGibbous,
    MoonPhase.lastQuarter => Svgs.moon.lastQuarter,
    MoonPhase.waningCrescent => Svgs.moon.waningCrescent,
    MoonPhase.unknown => Svgs.unknown,
  };

  return moonImage;
}
