import 'package:flutter/material.dart';

class AdjustableSize {
  AdjustableSize._();

  static final _instance = AdjustableSize._();
  static AdjustableSize get instance => _instance;

  final paddingSideRatio = 28.0;

  double? _screenMinSide;
  double get screenMinSide {
    if (_screenMinSide == null) {
      throw StateError(
        'AdjustableSize is not initialized. Call init(context) first.',
      );
    }

    return _screenMinSide!;
  }

  bool get isInitialized => _screenMinSide != null;

  void init(BuildContext context) {
    _screenMinSide ??= calculateScreenMinSide(context);
  }

  // void setScreenMinSize(BuildContext context) {
  //   _screenMinSide = calculateScreenMinSide(context);
  // }

  double calculateScreenMinSide(BuildContext context) {
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return screenMinSide;
  }

  double scaleByUnit(double constraint, double size) {
    final unit = constraint * 0.01;
    return unit * size;
  }

  double scaleByRatio(double constraint, double size) {
    return constraint / size;
  }

  double scaleByScreen(double size) {
    if (_screenMinSide == null) {
      throw StateError(
        'AdjustableSize is not initialized. Call init(context) first.',
      );
    }

    return scaleByRatio(_screenMinSide!, size);
  }

  double getContentMaxWidth() {
    if (_screenMinSide == null) {
      throw StateError(
        'AdjustableSize is not initialized. Call init(context) first.',
      );
    }

    final areaMaxWidth = _screenMinSide! - (getSidesPadding() * 2);
    return areaMaxWidth;
  }

  double getSidesPadding() {
    return scaleByScreen(paddingSideRatio);
  }
}
