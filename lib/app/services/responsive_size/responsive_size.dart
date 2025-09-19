import 'package:flutter/widgets.dart' show BuildContext, MediaQuery;

import '../../../shared/services/index.dart' show ResponsiveSizeService;

class ResponsiveSizeServiceImpl implements ResponsiveSizeService {
  static const _paddingSidePercent = 3.6;
  static const _borderRadiusPercent = 3.8;
  static const _tileHorizontalPaddingPercent = 3.5;
  static const _tileVerticalPaddingPercent = 3.0;

  static const _defaultScreenMinSide = 360.0;
  double? _screenMinSide;

  double get _screenSize => _screenMinSide ?? _defaultScreenMinSide;

  double _calculateScreenMinSide(BuildContext context) {
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return screenMinSide;
  }

  @override
  void init(BuildContext context) {
    final newMinSide = _calculateScreenMinSide(context);
    if (newMinSide != _screenMinSide) {
      _screenMinSide = newMinSide;
    }
  }

  @override
  bool get isInitialized => _screenMinSide != null;

  @override
  double get sidesPadding {
    final result = screenPercentage(_paddingSidePercent);

    return result;
  }

  @override
  double get borderRadius => screenPercentage(_borderRadiusPercent);
  @override
  double get tileHorizontalPadding =>
      screenPercentage(_tileHorizontalPaddingPercent);
  @override
  double get tileVerticalPadding =>
      screenPercentage(_tileVerticalPaddingPercent);

  @override
  double get contentMaxWidth {
    return _screenSize - (sidesPadding * 2);
  }

  @override
  double percentageOf(double base, double percent) {
    return (base * percent / 100).round().toDouble();
  }

  @override
  double screenPercentage(double percent) {
    return percentageOf(_screenSize, percent);
  }
}
