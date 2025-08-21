import 'package:flutter/material.dart';

import '../../../../shared/ui/info_badge/index.dart';
import '../utils/uv_color_helper/uv_color_helper.dart';

class UvInfoWidget extends StatelessWidget {
  const UvInfoWidget({super.key, required this.uv});

  final int uv;

  @override
  Widget build(BuildContext context) {
    final color = getUvColor(uv);

    return InfoBadge(
      color: color,
      lable: 'UV',
      value: uv.toString(),
      icon: Icons.sunny,
    );
  }
}
