import 'package:flutter/widgets.dart' show BuildContext;

abstract interface class ResponsiveSizeService {
  void updateReferenceScreenSize(BuildContext context);

  double? get referenceScreenSize;

  bool get isInitialized;

  double get sidesPadding;
  double get borderRadius;
  double get tileHorizontalPadding;
  double get tileVerticalPadding;

  double get contentMaxWidth;

  double percentageOf(double base, double percent);
  double screenPercentage(double percent);
}
