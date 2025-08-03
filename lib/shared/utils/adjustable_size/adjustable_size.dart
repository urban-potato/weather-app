class AdjustableSize {
  static double scaleByUnit(double constraint, double size) {
    final unit = constraint * 0.01;
    return unit * size;
  }

  static double scaleByRatio(double constraint, double size) {
    return constraint / size;
  }
}
