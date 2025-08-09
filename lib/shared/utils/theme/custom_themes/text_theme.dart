import 'package:flutter/material.dart';

import '../../adjustable_size/index.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final fontSize = ScreenBasedSize.instance.scaleByUnit(5.2);

    return TextTheme(
      titleMedium: const TextStyle().copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  static TextTheme darkTextTheme(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final fontSize = ScreenBasedSize.instance.scaleByUnit(5.2);

    return TextTheme(
      titleMedium: const TextStyle().copyWith(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
