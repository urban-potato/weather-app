import 'package:flutter/widgets.dart' show BuildContext;

abstract interface class ResponsiveSizeService {
  void init(BuildContext context);

  bool get isInitialized;

  double get sidesPadding;
  double get borderRadius;
  double get tileHorizontalPadding;
  double get tileVerticalPadding;

  double get contentMaxWidth;

  double percentageOf(double base, double percent);
  double dividedBy(double base, double parts);
  double screenPercentage(double percent);
  double screenDividedBy(double parts);
}
