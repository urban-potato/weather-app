class AdjustableSize {
  // TODO: ограничить constraint (не null, не infinity) и size
  static double scaleByUnit(double constraint, double size) {
    final unit = constraint * 0.01;
    return unit * size;
  }

  // TODO: ограничить constraint (не null, не infinity) и size
  static double scaleByRatio(double constraint, double size) {
    return constraint / size;
  }
}
