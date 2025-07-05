import 'package:flutter/material.dart';

double calculateScreenSidesPadding({
  BuildContext? context,
  double? screenMinSide,
}) {
  assert(
    context != null || screenMinSide != null,
    'Both arguments cannot be null',
  );

  const divider = 28;

  if (screenMinSide != null) return screenMinSide / divider;

  final calculatedScreenMinSide =
      MediaQuery.of(context!).size.width < MediaQuery.of(context).size.height
      ? MediaQuery.of(context).size.width
      : MediaQuery.of(context).size.height;

  return calculatedScreenMinSide / divider;
}
