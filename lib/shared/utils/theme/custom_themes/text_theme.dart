import 'package:flutter/material.dart';

import '../../adjustable_size/index.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final titleMediumFontSize = ScreenBasedSize.instance.scaleByUnit(5.2);
    final labelMediumFontSize = ScreenBasedSize.instance.scaleByUnit(4);

    return TextTheme(
      titleMedium: const TextStyle().copyWith(
        fontSize: titleMediumFontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
      labelMedium: const TextStyle().copyWith(
        fontSize: labelMediumFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }

  static TextTheme darkTextTheme(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final titleMediumFontSize = ScreenBasedSize.instance.scaleByUnit(5.2);
    final labelMediumFontSize = ScreenBasedSize.instance.scaleByUnit(4);

    return TextTheme(
      titleMedium: const TextStyle().copyWith(
        fontSize: titleMediumFontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      labelMedium: const TextStyle().copyWith(
        fontSize: labelMediumFontSize,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      ),
    );
  }
}
