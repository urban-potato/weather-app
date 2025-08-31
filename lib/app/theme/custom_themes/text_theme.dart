import 'package:flutter/material.dart';

import '../../../shared/utils/size_helper/index.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final titleMediumFontSize = ScreenBasedSize.instance.scaleByUnit(5.2);
    final labelMediumFontSize = ScreenBasedSize.instance.scaleByUnit(4);
    final labelLargeFontSize = ScreenBasedSize.instance.scaleByUnit(4.1);
    final bodyMediumFontSize = ScreenBasedSize.instance.scaleByUnit(3.3);
    final bodySmallFontSize = ScreenBasedSize.instance.scaleByUnit(3.1);

    return TextTheme(
      headlineMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      titleMedium: const TextStyle().copyWith(
        fontSize: titleMediumFontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      labelMedium: const TextStyle().copyWith(
        fontSize: labelMediumFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        height: 1.0,
      ),
      labelLarge: const TextStyle().copyWith(
        fontSize: labelLargeFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.black,
        height: 1.0,
      ),
      bodySmall: const TextStyle().copyWith(
        fontSize: bodySmallFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.grey[700],
      ),
      bodyMedium: const TextStyle().copyWith(
        fontSize: bodyMediumFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
    );
  }

  static TextTheme darkTextTheme(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final titleMediumFontSize = ScreenBasedSize.instance.scaleByUnit(5.2);
    final labelMediumFontSize = ScreenBasedSize.instance.scaleByUnit(4);
    final labelLargeFontSize = ScreenBasedSize.instance.scaleByUnit(4.1);
    final bodyMediumFontSize = ScreenBasedSize.instance.scaleByUnit(3.3);
    final bodySmallFontSize = ScreenBasedSize.instance.scaleByUnit(3.1);

    return TextTheme(
      headlineMedium: const TextStyle().copyWith(
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
      titleMedium: const TextStyle().copyWith(
        fontSize: titleMediumFontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelMedium: const TextStyle().copyWith(
        fontSize: labelMediumFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 1.0,
      ),
      labelLarge: const TextStyle().copyWith(
        fontSize: labelLargeFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.white,
        height: 1.0,
      ),
      bodySmall: const TextStyle().copyWith(
        fontSize: bodySmallFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.grey[350],
      ),
      bodyMedium: const TextStyle().copyWith(
        fontSize: bodyMediumFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
    );
  }
}
