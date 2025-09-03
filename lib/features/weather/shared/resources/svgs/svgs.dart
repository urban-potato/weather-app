part 'components/moon_phases.dart';

class AppSvgs {
  AppSvgs._();

  static const _basePath = 'lib/shared/assets/svg/';

  static final SvgMoonPhases moonPhases = SvgMoonPhases.instance;
  static const String unknown = '${_basePath}unknown.svg';
}
