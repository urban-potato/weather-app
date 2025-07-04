import 'package:flutter/material.dart';

double calculateScreenSidesPadding(BuildContext context) {
  final screenMinSide =
      MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;

  return screenMinSide / 28;
}
