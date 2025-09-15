import 'package:flutter/material.dart';

import '../../../utils/size_helper/index.dart';

class ScreenPadding extends StatelessWidget {
  const ScreenPadding({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final padding = ScreenBasedSize.instance.sidesPadding;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: padding,
      ).copyWith(bottom: padding),
      child: child,
    );
  }
}
