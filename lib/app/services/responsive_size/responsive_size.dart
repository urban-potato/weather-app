import 'dart:developer' show log;

import 'package:flutter/foundation.dart' show kDebugMode;

import '../../../shared/presentation/providers/index.dart'
    show ResponsiveSizeNotifier;

class ResponsiveSizeServiceImpl extends ResponsiveSizeNotifier {
  ResponsiveSizeServiceImpl() {
    if (kDebugMode)
      log(
        '------------------- ResponsiveSizeServiceImpl create -------------------',
      );
  }

  @override
  double? build() => null;

  static const _defaultScreenMinSide = 360.0;
  static const _paddingSidePercent = 3.6;
  static const _borderRadiusPercent = 3.8;
  static const _tileHorizontalPaddingPercent = 3.5;
  static const _tileVerticalPaddingPercent = 3.0;

  double get _screenSize => state ?? _defaultScreenMinSide;

  @override
  void updateReferenceScreenSize({
    required double width,
    required double height,
  }) {
    final newMinSide = _calculateScreenMinSide(width: width, height: height);
    if (newMinSide != state) {
      state = newMinSide;
    }
  }

  double _calculateScreenMinSide({
    required double width,
    required double height,
  }) {
    final screenMinSide = width < height ? width : height;

    return screenMinSide;
  }

  @override
  double? get referenceScreenSize => state;

  @override
  bool get isInitialized => state != null;

  @override
  double get sidesPadding => screenPercentage(_paddingSidePercent);

  @override
  double get borderRadius => screenPercentage(_borderRadiusPercent);

  @override
  double get tileHorizontalPadding =>
      screenPercentage(_tileHorizontalPaddingPercent);

  @override
  double get tileVerticalPadding =>
      screenPercentage(_tileVerticalPaddingPercent);

  @override
  double get contentMaxWidth => _screenSize - (sidesPadding * 2);

  @override
  double percentageOf(double base, double percent) =>
      (base * percent / 100).round().toDouble();

  @override
  double screenPercentage(double percent) => percentageOf(_screenSize, percent);
}
