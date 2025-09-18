import 'package:flutter/widgets.dart' show BuildContext, MediaQuery;

import '../../../shared/services/index.dart' show ResponsiveSizeService;

class ResponsiveSizeServiceImpl implements ResponsiveSizeService {
  static const _paddingSideRatio = 28.0;
  static const _borderRadiusFactor = 3.8;
  static const _tileHorizontalPaddingFactor = 3.5;
  static const _tileVerticalPaddingFactor = 3.0;

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
    _screenMinSide ??= _calculateScreenMinSide(context);
  }

  @override
  bool get isInitialized => _screenMinSide != null;

  @override
  double get sidesPadding => screenDividedBy(_paddingSideRatio);
  @override
  double get borderRadius => screenPercentage(_borderRadiusFactor);
  @override
  double get tileHorizontalPadding =>
      screenPercentage(_tileHorizontalPaddingFactor);
  @override
  double get tileVerticalPadding =>
      screenPercentage(_tileVerticalPaddingFactor);

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
  double dividedBy(double base, double parts) {
    return (base / parts).round().toDouble();
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

  @override
  double screenDividedBy(double parts) {
    if (_screenMinSide == null) {
      throw StateError(
        'ResponsiveSizeService is not initialized. Call init(context) first.',
      );
    }

    return dividedBy(_screenMinSide!, parts);
  }
}
