import 'dart:math';

part 'components/moon_phases.dart';
part 'components/cloud_faces.dart';

class AppSvgs {
  AppSvgs._();

  static const _basePath = 'lib/features/weather/shared/assets/svgs/';

  static final SvgMoonPhases moonPhases = SvgMoonPhases.instance;
  static final SvgCloudFaces cloudFaces = SvgCloudFaces.instance;
  static const String unknown = '${_basePath}unknown.svg';
}
