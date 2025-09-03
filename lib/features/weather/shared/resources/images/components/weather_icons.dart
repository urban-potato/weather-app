part of '../images.dart';

class ImageWeatherIcons {
  ImageWeatherIcons._();

  static final _instance = ImageWeatherIcons._();
  static ImageWeatherIcons get instance => _instance;

  static const _basePath = '${AppImages._basePath}icons/';

  static const _dayPath = '${_basePath}day/';
  static const _nightPath = '${_basePath}night/';

  String getDayIcon(int iconNumber) {
    return '$_dayPath$iconNumber.webp';
  }

  String getNightIcon(int iconNumber) {
    return '$_nightPath$iconNumber.webp';
  }
}
