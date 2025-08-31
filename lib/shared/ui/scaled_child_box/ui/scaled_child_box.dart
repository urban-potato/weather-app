import 'package:flutter/material.dart';

import '../../../utils/size_helper/index.dart';

class ScaledChildBox extends StatelessWidget {
  const ScaledChildBox({
    super.key,
    required this.height,
    required this.child,
    this.aligment = Alignment.center,
  }) : assert(height >= 0, 'height must be greater than or equal to 0');

  final double height;
  final Widget child;
  final AlignmentGeometry aligment;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final double height = ScreenBasedSize.instance.scaleByUnit(this.height);

    return SizedBox(
      height: height,
      child: FittedBox(alignment: aligment, child: child),
    );
  }
}
