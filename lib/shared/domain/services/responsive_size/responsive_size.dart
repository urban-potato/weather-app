abstract interface class ResponsiveSizeService {
  void updateReferenceScreenSize({
    required double width,
    required double height,
  });

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
