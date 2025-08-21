import 'package:flutter/material.dart';

import '../../../../../shared/ui/card_tile/index.dart';
import '../../../../../shared/utils/size_helpers/index.dart';

class InfoBadge extends StatelessWidget {
  const InfoBadge({
    super.key,
    required this.color,
    required this.lable,
    required this.value,
    required this.icon,
  });

  final Color color;
  final String lable;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.scaleByUnit(2.5);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(1.9);
    final iconSize = ScreenBasedSize.instance.scaleByUnit(6);
    final iconSpacing = ScreenBasedSize.instance.scaleByUnit(2);
    final textSpacing = ScreenBasedSize.instance.scaleByUnit(1);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      color: color,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: iconSpacing,
        children: [
          Icon(icon, color: Colors.white, size: iconSize),
          Flexible(
            child: Row(
              spacing: textSpacing,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(child: _InfoText(text: lable)),
                Flexible(child: _InfoText(text: value)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoText extends StatelessWidget {
  const _InfoText({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(
        context,
      ).textTheme.labelMedium?.copyWith(color: Colors.white),
      overflow: TextOverflow.clip,
    );
  }
}
