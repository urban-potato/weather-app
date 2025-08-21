import 'package:flutter/material.dart';

Color getUvColor(int uv) {
  final color = uv < 3
      ? Colors.green
      : uv < 5
      ? Colors.amber
      : uv < 7
      ? Colors.orange
      : uv < 10
      ? Colors.red
      : Colors.black;

  return color;
}
