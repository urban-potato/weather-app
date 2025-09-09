import 'package:flutter/material.dart';

import '../../../../../shared/ui/themed_text/index.dart';
import '../../../../../shared/utils/size_helper/index.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);
    final bottomPadding = ScreenBasedSize.instance.scaleByUnit(0.75);

    print('WidgetTitle');

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: ThemedText(
        text: title,
        styleType: AppTextStyle.titleMedium,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
