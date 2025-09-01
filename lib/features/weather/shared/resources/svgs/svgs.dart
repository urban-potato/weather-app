part 'components/moon_phases.dart';

class Svgs {
  Svgs._();

  static const _basePath = 'lib/shared/assets/svg/';

  static final SvgMoonPhases moonPhases = SvgMoonPhases.instance;
  static const String unknown = '${_basePath}unknown.png';
}
