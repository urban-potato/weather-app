import 'package:flutter/material.dart';

import 'custom_themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme(BuildContext context) {
    const primaryColor = Color(0xFF0099FF);
    const scaffoldBackgroundColor = Color(0xFFBAE3FF);

    return ThemeData(
      useMaterial3: true,
      // TODO: fontFamily
      // fontFamily: '',
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.light,
      ),
      textTheme: TTextTheme.lightTextTheme(context),
    );
  }

  static ThemeData darkTheme(BuildContext context) {
    const primaryColor = Color.fromARGB(255, 0, 38, 63);
    const scaffoldBackgroundColor = Color.fromARGB(255, 53, 65, 73);

    return ThemeData(
      useMaterial3: true,
      // TODO: fontFamily
      // fontFamily: '',
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryColor,
        brightness: Brightness.dark,
      ),
      textTheme: TTextTheme.darkTextTheme(context),
    );
  }
}
