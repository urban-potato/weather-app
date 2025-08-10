import 'package:flutter/material.dart';
import 'package:weather_app/shared/utils/adjustable_size/index.dart';

class WidgetTitle extends StatelessWidget {
  const WidgetTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    ScreenBasedSize.instance.init(context);
    final bottomPadding = ScreenBasedSize.instance.scaleByUnit(0.75);

    return Padding(
      padding: EdgeInsets.only(bottom: bottomPadding),
      child: Text(
        title,
        style: theme.textTheme.titleMedium,
        overflow: TextOverflow.clip,
        // textAlign: TextAlign.left,
      ),
    );
  }
}
