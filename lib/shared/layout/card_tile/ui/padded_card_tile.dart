import 'package:flutter/material.dart';

import '../../../utils/adjustable_size/index.dart';
import 'card_tile.dart';

class PaddedCardTile extends StatelessWidget {
  const PaddedCardTile({super.key, required this.child, this.color});

  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    ScreenBasedSize.instance.init(context);

    final hPadding = ScreenBasedSize.instance.scaleByUnit(2.5);
    final vPadding = ScreenBasedSize.instance.scaleByUnit(1.9);

    return CardTile(
      padding: EdgeInsets.symmetric(vertical: vPadding, horizontal: hPadding),
      color: color,
      child: child,
    );
  }
}
