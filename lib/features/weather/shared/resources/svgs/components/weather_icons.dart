part of '../svgs.dart';

class SvgWeatherIcons {
  SvgWeatherIcons._();

  static final _instance = SvgWeatherIcons._();
  static SvgWeatherIcons get instance => _instance;

  static const _basePath = '${Svgs._basePath}icons/';

  static const _dayPath = '${_basePath}day/';
  static const _nightPath = '${_basePath}night/';

  String getDayIcon(String iconNumber) {
    return '$_dayPath$iconNumber.webp';
  }

  String getNightIcon(String iconNumber) {
    return '$_nightPath$iconNumber.webp';
  }
}
