import '../../../resources/index.dart';

String getWeatherIconAssetPath(bool isDay, String iconNumber) {
  final iconPath = isDay
      ? Svgs.weatherIcons.getDayIcon(iconNumber)
      : Svgs.weatherIcons.getNightIcon(iconNumber);

  return iconPath;
}
