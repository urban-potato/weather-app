import 'package:flutter/widgets.dart' show BuildContext, MediaQuery;

import '../../../shared/services/index.dart' show ResponsiveSizeService;

class ResponsiveSizeServiceImpl implements ResponsiveSizeService {
  static const _paddingSidePercent = 3.6;
  static const _borderRadiusPercent = 3.8;
  static const _tileHorizontalPaddingPercent = 3.5;
  static const _tileVerticalPaddingPercent = 3.0;

  double? _screenMinSide;

  double _calculateScreenMinSide(BuildContext context) {
    final screenMinSide =
        MediaQuery.of(context).size.width < MediaQuery.of(context).size.height
        ? MediaQuery.of(context).size.width
        : MediaQuery.of(context).size.height;

    return screenMinSide;
  }

  @override
  void init(BuildContext context) {
    _screenMinSide = _calculateScreenMinSide(context);
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
    if (_screenMinSide == null) {
      throw StateError(
        'ResponsiveSizeService is not initialized. Call init(context) first.',
      );
    }

    return _screenMinSide! - (sidesPadding * 2);
  }

  @override
  double percentageOf(double base, double percent) {
    return (base * percent / 100).round().toDouble();
  }

  @override
  double screenPercentage(double percent) {
    if (_screenMinSide == null) {
      throw StateError(
        'ResponsiveSizeService is not initialized. Call init(context) first.',
      );
    }

    return percentageOf(_screenMinSide!, percent);
  }
}
