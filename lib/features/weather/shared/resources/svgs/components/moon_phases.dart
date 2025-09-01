part of '../svgs.dart';

class SvgMoonPhases {
  SvgMoonPhases._();

  static final _instance = SvgMoonPhases._();
  static SvgMoonPhases get instance => _instance;

  static const _basePath = '${Svgs._basePath}moon/';

  final String firstQuarter = '${_basePath}first-quarter.svg';
  final String fullMoon = '${_basePath}full-moon.svg';
  final String lastQuarter = '${_basePath}last-quarter.svg';
  final String newMoon = '${_basePath}new-moon.svg';
  final String waningCrescent = '${_basePath}waning-crescent.svg';
  final String waningGibbous = '${_basePath}waning-gibbous.svg';
  final String waxingCrescent = '${_basePath}waxing-crescent.svg';
  final String waxingGibbous = '${_basePath}waxing-gibbous.svg';
}
