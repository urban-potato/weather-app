part of '../svgs.dart';

class SvgCloudFaces {
  SvgCloudFaces._();

  static final _instance = SvgCloudFaces._();
  static SvgCloudFaces get instance => _instance;

  static const _basePath = '${AppSvgs._basePath}cloud_faces/';

  final SvgCloudFacesPositive positive = SvgCloudFacesPositive.instance;
  final SvgCloudFacesNegative negative = SvgCloudFacesNegative.instance;
}

class SvgCloudFacesPositive {
  SvgCloudFacesPositive._();

  static final _instance = SvgCloudFacesPositive._();
  static SvgCloudFacesPositive get instance => _instance;

  static const _basePath = '${SvgCloudFaces._basePath}positive/';

  final String cool = '${_basePath}cloud_cool.svg';
  final String happy = '${_basePath}cloud_happy.svg';
  final String smilingWidely = '${_basePath}cloud_smiling_widely.svg';
  final String smiling = '${_basePath}cloud_smiling.svg';
  final String winking = '${_basePath}cloud_winking.svg';

  List<String> get allPictures => [
    cool,
    happy,
    smilingWidely,
    smiling,
    winking,
  ];
  String get randomPicture => allPictures[Random().nextInt(allPictures.length)];
}

class SvgCloudFacesNegative {
  SvgCloudFacesNegative._();

  static final _instance = SvgCloudFacesNegative._();
  static SvgCloudFacesNegative get instance => _instance;

  static const _basePath = '${SvgCloudFaces._basePath}negative/';

  final String confused = '${_basePath}cloud_confused.svg';
  final String disappointed = '${_basePath}cloud_disappointed.svg';
  final String notHappy = '${_basePath}cloud_not_happy.svg';
  final String sad = '${_basePath}cloud_sad.svg';

  List<String> get allPictures => [confused, disappointed, notHappy, sad];
  String get randomPicture => allPictures[Random().nextInt(allPictures.length)];
}
