import 'package:flutter/widgets.dart' show BuildContext, MediaQuery;

import '../../../shared/services/responsive_size/responsive_size_notifier.dart'
    show ResponsiveSizeNotifier;

class ResponsiveSizeServiceImpl extends ResponsiveSizeNotifier {
  ResponsiveSizeServiceImpl();

  @override
  double? build() => null;

  static const _defaultScreenMinSide = 360.0;
  static const _paddingSidePercent = 3.6;
  static const _borderRadiusPercent = 3.8;
  static const _tileHorizontalPaddingPercent = 3.5;
  static const _tileVerticalPaddingPercent = 3.0;

  double get _screenSize => state ?? _defaultScreenMinSide;

  @override
  void updateReferenceScreenSize(BuildContext context) {
    final newMinSide = _calculateScreenMinSide(context);
    if (newMinSide != state) {
      state = newMinSide;
    }
  }

  double _calculateScreenMinSide(BuildContext context) {
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;
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
