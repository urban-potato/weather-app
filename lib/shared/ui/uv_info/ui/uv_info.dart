import 'package:flutter/material.dart';

import '../../../utils/uv_color_helper/index.dart';
import '../../info_badge/index.dart';

class UvInfo extends StatelessWidget {
  const UvInfo({super.key, required this.uv});

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
