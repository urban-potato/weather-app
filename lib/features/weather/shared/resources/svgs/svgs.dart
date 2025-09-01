part 'components/moon_phases.dart';
part 'components/weather_icons.dart';

class Svgs {
  Svgs._();

  static const _basePath = 'lib/shared/assets/svg/';

  static final SvgMoonPhases moonPhases = SvgMoonPhases.instance;
  static final SvgWeatherIcons weatherIcons = SvgWeatherIcons.instance;
  static const String unknown = '${_basePath}unknown.png';
}
