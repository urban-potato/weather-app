import 'package:flutter/material.dart';

import '../adjustable_size/adjustable_size.dart';

class ScreenBasedSize {
  ScreenBasedSize._();

  static final _instance = ScreenBasedSize._();
  static ScreenBasedSize get instance => _instance;

  static const _paddingSideRatio = 28.0;
  static const _borderRadiusFactor = 3.8;

  double get sidesPadding => scaleByRatio(_paddingSideRatio);
  double get borderRadius => scaleByUnit(_borderRadiusFactor);

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

  double calculateScreenMinSide(BuildContext context) {
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return screenMinSide;
  }

  double scaleByUnit(double size) {
    if (_screenMinSide == null) {
      throw StateError(
        'AdjustableSize is not initialized. Call init(context) first.',
      );
    }

    return AdjustableSize.scaleByUnit(_screenMinSide!, size);
  }

  double scaleByRatio(double size) {
    if (_screenMinSide == null) {
      throw StateError(
        'AdjustableSize is not initialized. Call init(context) first.',
      );
    }

    return AdjustableSize.scaleByRatio(_screenMinSide!, size);
  }

  double getContentMaxWidth() {
    if (_screenMinSide == null) {
      throw StateError(
        'AdjustableSize is not initialized. Call init(context) first.',
      );
    }

    final areaMaxWidth = _screenMinSide! - (sidesPadding * 2);
    return areaMaxWidth;
  }

  // double getSidesPadding() {
  //   return scaleByRatio(_paddingSideRatio);
  // }
}
