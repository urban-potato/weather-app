import 'package:flutter/material.dart';

import '../../../shared/domain/services/index.dart' show ResponsiveSizeService;

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme(ResponsiveSizeService sizeService) {
    final titleMediumFontSize = sizeService.screenPercentage(5.2);
    final labelMediumFontSize = sizeService.screenPercentage(4);
    final labelLargeFontSize = sizeService.screenPercentage(4.1);
    final bodyLargeFontSize = sizeService.screenPercentage(4.8);
    final bodyMediumFontSize = sizeService.screenPercentage(3.3);
    final bodySmallFontSize = sizeService.screenPercentage(3.1);

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
      bodyLarge: const TextStyle().copyWith(
        fontSize: bodyLargeFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.grey[900],
      ),
    );
  }

  static TextTheme darkTextTheme(ResponsiveSizeService sizeService) {
    final titleMediumFontSize = sizeService.screenPercentage(5.2);
    final labelMediumFontSize = sizeService.screenPercentage(4);
    final labelLargeFontSize = sizeService.screenPercentage(4.1);
    final bodyLargeFontSize = sizeService.screenPercentage(4.8);
    final bodyMediumFontSize = sizeService.screenPercentage(3.3);
    final bodySmallFontSize = sizeService.screenPercentage(3.1);

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
      bodyLarge: const TextStyle().copyWith(
        fontSize: bodyLargeFontSize,
        fontWeight: FontWeight.w400,
        color: Colors.grey[200],
      ),
    );
  }
}
