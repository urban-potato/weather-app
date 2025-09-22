import 'package:flutter/material.dart';

import '../../../../../../../../shared/ui/info_badge/index.dart';
import '../utils/aqi_color_helper.dart';

class AqiInfoWidget extends StatelessWidget {
  const AqiInfoWidget({super.key, required this.aqi});

  final int aqi;

  @override
  Widget build(BuildContext context) {
    final color = getAqiColor(aqi);

    return InfoBadge(
      color: color,
      lable: 'AQI',
      value: aqi.toString(),
      icon: Icons.cloud,
    );
  }
}
