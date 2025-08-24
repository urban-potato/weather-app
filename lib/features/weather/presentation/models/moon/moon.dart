class MoonModelUI {
  final String phaseImagePath;
  final String phase;
  final DateTime? moonrise;
  final DateTime? moonset;
  final int illumination;

  const MoonModelUI({
    required this.phaseImagePath,
    required this.phase,
    required this.moonrise,
    required this.moonset,
    required this.illumination,
  });
}
