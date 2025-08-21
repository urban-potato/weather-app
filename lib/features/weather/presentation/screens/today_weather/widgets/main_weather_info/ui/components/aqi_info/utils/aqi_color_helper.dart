import 'package:flutter/material.dart';

Color getAqiColor(int aqi) {
  final color = aqi < 101
      ? Colors.green
      : aqi < 161
      ? Colors.amber
      : aqi < 241
      ? Colors.red
      : Colors.black;

  return color;
}
